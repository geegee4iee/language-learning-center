package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import model.LoginModel;
import model.SessionUserModel;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pojo.ChuDe;
import pojo.DangKyKhoaHoc;
import pojo.DangKyKhoaHocId;
import pojo.HocVien;
import pojo.KhoaHoc;
import pojo.LichHoc;
import utils.ConnectionFactory;
import bus.ChuDeBUS;
import bus.DangKyKhoaHocBUS;
import bus.HocVienBUS;
import bus.KhoaHocBUS;
import bus.LichHocBUS;

@Controller
@RequestMapping(value = "/khoahoc")
public class KhoaHocController {
	@RequestMapping(value = "/danhsach", method = RequestMethod.GET)
	public String getStarted(ModelMap m) {
		List<KhoaHoc> kh = new KhoaHocBUS().getStarted();
		List<KhoaHoc> khUn = new KhoaHocBUS().getUnStartKhoaHoc();
		List<ChuDe> cd = new ChuDeBUS().getAll();

		m.addAttribute("lstKh", kh);
		m.addAttribute("lstKhUn", khUn);
		m.addAttribute("lstCd", cd); // Danh sách chủ đề
		return "danhsachkhoahoc";
	}

	@RequestMapping(value = "/lichhoc/{id}", method = RequestMethod.GET)
	public String getSchedule(ModelMap m, @PathVariable("id") int khoaHoc) {
		List<LichHoc> lh = new LichHocBUS().getAll(khoaHoc);

		m.addAttribute("lstLh", lh);
		return "lichhockhoahoc";
	}

	@RequestMapping(value = "/danhsach/{id}", method = RequestMethod.GET)
	public String getBySubject(ModelMap m, @PathVariable("id") int chuyenDe) {
		List<KhoaHoc> kh = new KhoaHocBUS().getStarted(chuyenDe);
		List<KhoaHoc> khUn = new KhoaHocBUS().getUnStartKhoaHoc(chuyenDe);
		List<ChuDe> cd = new ChuDeBUS().getAll();

		m.addAttribute("lstKh", kh);
		m.addAttribute("lstKhUn", khUn);
		m.addAttribute("lstCd", cd); // Danh sách chủ đề
		return "danhsachkhoahoc";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList(ModelMap m) {
		// Get khoa hoc list and map
		List<KhoaHoc> kh = new KhoaHocBUS().getUnStartKhoaHoc();
		Map<String, String> mapKh = new HashMap<String, String>();
		for (KhoaHoc k : kh) {
			mapKh.put(String.valueOf(k.getId()), k.getTen());
		}

		m.put("khoahoc", new KhoaHoc());
		m.addAttribute("lst", mapKh);
		m.addAttribute("fullList", kh);
		return "listkhoahoc";
	}

	// Register the course
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String learn(@RequestParam("id") int id, ModelMap m,
			HttpSession session) {

		if (session.getAttribute("acc") == null) {
			m.addAttribute("required", "/khoahoc/list");
			return "redirect:/account/login";
		}

		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		SessionUserModel login = (SessionUserModel) session.getAttribute("acc");

		HocVien hv = new HocVienBUS().getHocVien(login.getId());

		DangKyKhoaHocId khId = new DangKyKhoaHocId(hv.getId(), id);
		DangKyKhoaHoc dkKh = null;

		// Add course's register for trainee if not exist
		if ((new DangKyKhoaHocBUS().isExist(khId)) == false) {
			KhoaHoc kh = new KhoaHoc();
			kh.setId(id);
			dkKh = new DangKyKhoaHoc(khId, hv, kh, 0);

			try {
				sess.getTransaction().begin();
				sess.save(dkKh);
				sess.getTransaction().commit();
			} catch (Exception e) {
				sess.getTransaction().rollback();
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			m.addAttribute("title", "Đăng ký khóa học");
			m.addAttribute("status", "mã số " + id
					+ " thất bại, bạn đã đăng ký khóa học này rồi!");
			m.addAttribute("linkBack", "/khoahoc/list");
			m.addAttribute("linkContent", "Trở lại trang khóa học");

			return "error";
		}

		m.addAttribute("title", "Đăng ký khóa học");
		m.addAttribute("status", "mã số " + id
				+ " thành công, hãy chờ chúng tôi liên hệ bạn để làm thủ tục");
		m.addAttribute("linkBack", "/khoahoc/list");
		m.addAttribute("linkContent", "Trở lại trang khóa học");

		return "success";
	}
}
