package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import model.LoginModel;
import model.SessionUserModel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pojo.DangKyThiId;
import pojo.HocVien;
import pojo.KyThi;
import bus.HocVienBUS;
import bus.KyThiBUS;

@Controller
@RequestMapping(value = "/kythi")
public class KyThiController {

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList(ModelMap model) {
		List<KyThi> lst = new KyThiBUS().getUnStart();

		model.addAttribute("lstKyThi", lst);
		return "listkythi";
	}

	@RequestMapping(value = "/danhsanh", method = RequestMethod.GET)
	public String getDanhSach(ModelMap m) {
		List<KyThi> lst = new KyThiBUS().getStarted();
		List<KyThi> lstUn = new KyThiBUS().getUnStart();

		m.addAttribute("lstKt", lst);
		m.addAttribute("lstKtUn", lstUn);

		return "danhsachkythi";
	}

	@RequestMapping(value = "/dangky/{id}", method = RequestMethod.GET)
	public String addDangKy(@PathVariable("id") int id, ModelMap m,
			HttpSession session) {
		if (session.getAttribute("acc") == null) {
			m.addAttribute("required", "/kythi/list");
			return "redirect:/account/login";
		}

		SessionUserModel log = (SessionUserModel) session.getAttribute("acc");
		HocVien hv = new HocVienBUS().getHocVien(log.getId());
		DangKyThiId dkId = new DangKyThiId(id, hv.getId());

		if (new KyThiBUS().isExistDangKy(dkId) == false) {
			KyThiBUS kt = new KyThiBUS();
			kt.addDangKy(dkId);
		} else {
			m.addAttribute("title", "Đăng ký kỳ thi");
			m.addAttribute("status", "mã số " + id
					+ " thất bại, bạn đã đăng ký kỳ thi này rồi!");
			m.addAttribute("linkBack", "/kythi/list");
			m.addAttribute("linkContent", "Trở lại trang kỳ thi");

			return "error";
		}

		m.addAttribute("title", "Đăng ký kỳ thi");
		m.addAttribute("status", "mã số " + id
				+ " thành công, hãy chờ chúng tôi liên hệ bạn để làm thủ tục");
		m.addAttribute("linkBack", "/kythi/list");
		m.addAttribute("linkContent", "Trở lại trang kỳ thi");

		return "success";
	}

}
