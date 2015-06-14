package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LoginModel;
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

import pojo.TaiKhoan;
import utils.ConnectionFactory;
import utils.CookieHelper;

@Controller
@RequestMapping(value = "/tknhanvien")
public class StaffAccountController {
	@RequestMapping(value = "/dangnhap", method = RequestMethod.GET)
	public String login(ModelMap m, HttpServletRequest request) {
		m.addAttribute("obj", new LoginModel());

		return "stafflogin";
	}

	@RequestMapping(value = "/dangxuat", method = RequestMethod.POST)
	public String logout(HttpSession session, HttpServletResponse respond) {
		session.removeAttribute("accStaff");
		CookieHelper.expireCookie("accStaff", respond);

		return "redirect:/tknhanvien/dangnhap";
	}

	@RequestMapping(value = "/dangnhap", method = RequestMethod.POST)
	public String login(@ModelAttribute("obj") LoginModel login, Model model,
			HttpSession session, HttpServletResponse respond) {

		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();
		int permission = 2;

		try {
			sess.getTransaction().begin();

			Query query = sess
					.createQuery("from TaiKhoan tk where tk.id=:id and tk.matKhau=:password and tk.quyenHan > 1");
			query.setString("id", login.getId());
			query.setString("password", login.getPassword());

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
				System.out.println(tk.getQuyenHan().getId());
				permission = user.getPermission();
				user.setName(name);
				user.setId(login.getId());

				session.setAttribute("accStaff", user);

				if (login.getRemember().equals("checked") == true) {
					CookieHelper.saveCookie("accStaff", user.getId(), respond);
				}

			} else {
				model.addAttribute("status", "Đăng nhập thất bại");
				model.addAttribute("obj", login);
				return "stafflogin";
			}

			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/*
		 * model.addAttribute("login", login); return "login";
		 */

		switch (permission) {
		case 2:
			return "redirect:/nhanvien/index";
		case 3:
			return "redirect:/bangiamdoc/thongke";
		case 4:
			return "redirect:/quantri/nhanvien";
		}

		return "redirect:/";
	}

}
