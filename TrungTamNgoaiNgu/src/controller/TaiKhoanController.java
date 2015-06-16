package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AccountUpdateModel;
import model.HocVienInfoModel;
import model.LoginModel;
import model.RegisterModel;
import model.SessionUserModel;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.KyThiDAO;
import bus.ChuDeBUS;
import bus.HocVienBUS;
import bus.KhoaHocBUS;
import bus.KyThiBUS;
import bus.TaiKhoanBUS;
import pojo.ChuDe;
import pojo.HocVien;
import pojo.KhoaHoc;
import pojo.KyThi;
import pojo.QuyenHan;
import pojo.TaiKhoan;
import utils.ConnectionFactory;
import utils.CookieHelper;
import utils.EncryptPassword;

@Controller
@RequestMapping(value = "/account")
public class TaiKhoanController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(
			@RequestParam(value = "required", required = false) String required,
			ModelMap model, HttpSession session) {
		if (session.getAttribute("acc") != null) {
			return "redirect:/home/index";
		}
		List<ChuDe> cd = new ChuDeBUS().getAll();
		model.addAttribute("lstCd", cd); // Danh sách chủ đề
		model.put("acc", new LoginModel());
		model.addAttribute("required", required);
		return "login";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		model.put("reg", new RegisterModel());
		List<ChuDe> cd = new ChuDeBUS().getAll();
		model.addAttribute("lstCd", cd); // Danh sách chủ đề
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute("reg") RegisterModel register,
			Model model) {

		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		TaiKhoan tk = new TaiKhoan();
		tk.setId(register.getId());
		tk.setMatKhau(EncryptPassword.md5(register.getPassword()));
		tk.setQuyenHan(new QuyenHan(1, ""));

		// Convert from String to Date
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();
		try {
			date = format.parse(register.getNgaySinh());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		HocVien hv = new HocVien();
		hv.setDiaChi(register.getDiaChi());
		hv.setHoTen(register.getHoTen());
		hv.setNgaySinh(date);
		hv.setSoDienThoai(register.getSoDienThoai());
		hv.setTaiKhoan(tk);

		// Add account and student to database
		try {
			sess.getTransaction().begin();
			sess.save(tk);
			sess.save(hv);
			sess.getTransaction().commit();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			sess.getTransaction().rollback();
			e1.printStackTrace();
		}

		return "redirect:/account/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("acc") LoginModel login, Model model,
			HttpSession session, HttpServletResponse respond) {

		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();

			Query query = sess
					.createQuery("from TaiKhoan tk where tk.id=:id and tk.matKhau=:password and quyenHan=:quyenHan");
			query.setString("id", login.getId());
			query.setParameter("quyenHan", new QuyenHan(1, ""));
			query.setString("password",
					EncryptPassword.md5(login.getPassword()));

			if (query.uniqueResult() != null) {
				TaiKhoan tk = (TaiKhoan) query.uniqueResult();
				String name = "";

				if (tk.getQuyenHan().getId() == 1) {
					name = tk.getHocViens().iterator().next().getHoTen();
				} else {
					name = tk.getNhanViens().iterator().next().getHoTen();
				}

				SessionUserModel user = new SessionUserModel();
				user.setPermission(tk.getQuyenHan().getId());
				user.setName(name);
				user.setId(login.getId());

				session.setAttribute("acc", user);

				if (login.getRemember() != null) {
					if (login.getRemember().equals("checked") == true) {
						CookieHelper.saveCookie("acc", user.getId(), respond);
					}
				}
			} else {
				model.addAttribute("status", "Đăng nhập thất bại");
				return "login";
			}

			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/*
		 * model.addAttribute("login", login); return "login";
		 */
		if (login.getRequired().length() != 0) {
			return "redirect:" + login.getRequired();
		} else {
			return "redirect:/home/index";
		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse respond) {
		if (session.getAttribute("acc") != null) {
			session.removeAttribute("acc");
			CookieHelper.expireCookie("acc", respond);
		}

		return "redirect:/home/index";
	}

	// Return view profile
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String viewProfile(HttpSession session, ModelMap m) {
		SessionUserModel acc = new SessionUserModel();

		// Check whether user logged in
		if (session.getAttribute("acc") != null) {
			acc = (SessionUserModel) session.getAttribute("acc");
		} else {
			return "redirect:/account/login";
		}

		HocVien hv = new HocVienBUS().getHocVien(acc.getId());
		HocVienInfoModel hvModel = new HocVienBUS().toHocVienInfo(hv);
		List<KyThi> lstKt = new KyThiBUS().getRegByHocVien(hv.getId());
		List<KhoaHoc> lstKh = new KhoaHocBUS().getRegByHocVien(hv.getId());
		List<ChuDe> lstCd = new ChuDeBUS().getAll();
		AccountUpdateModel pwd = new AccountUpdateModel();
		pwd.setId(acc.getId());

		// Add all student's information to profile's view
		m.addAttribute("objHv", hvModel);
		m.addAttribute("objPwd", pwd);
		m.addAttribute("lstKh", lstKh);
		m.addAttribute("lstKt", lstKt);
		m.addAttribute("lstCd", lstCd);

		return "profile";
	}

	@RequestMapping(value = "/changepwd", method = RequestMethod.POST)
	public String changePwd(@ModelAttribute("objPwd") AccountUpdateModel pwd,
			ModelMap m, HttpSession session) {
		TaiKhoan tk = new TaiKhoanBUS().get(pwd.getId());
		if (EncryptPassword.md5(pwd.getPassword()).equals(tk.getMatKhau()) == false) {
			HocVien hv = new HocVienBUS().getHocVien(pwd.getId());

			// Add HocVien model and AccountUpdateModel to view
			m.addAttribute("objHv", hv);
			m.addAttribute("objPwd", pwd);
			m.addAttribute("status", "Mật khẩu không đúng");

			return "profile";
		} else {
			new TaiKhoanBUS().updatePwd(pwd);
		}

		return "redirect:/account/profile";
	}

	@RequestMapping(value = "/changeinfo", method = RequestMethod.POST)
	public String changeInfo(@ModelAttribute("objHv") HocVienInfoModel hvModel,
			ModelMap m) {
		if (new HocVienBUS().updateInfo(hvModel) == true) {

		} else {

		}

		return "redirect:/account/profile";
	}
}
