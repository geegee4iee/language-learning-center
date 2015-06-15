package controller;

import javax.servlet.http.HttpSession;

import model.AccountUpdateModel;
import model.SessionUserModel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pojo.HocVien;
import pojo.NhanVien;
import pojo.TaiKhoan;
import utils.EncryptPassword;
import bus.HocVienBUS;
import bus.NhanVienBUS;
import bus.TaiKhoanBUS;

@Controller
@RequestMapping("/profile")
public class StaffInfoController {
	@RequestMapping(value = "/nhanvien", method = RequestMethod.GET)
	public String staffIndex(ModelMap m, HttpSession session) {
		SessionUserModel sessStaff = (SessionUserModel) session
				.getAttribute("accStaff");

		NhanVien nv = new NhanVienBUS().get(sessStaff.getId());
		AccountUpdateModel acc = new AccountUpdateModel();
		acc.setId(nv.getTaiKhoan().getId());

		m.addAttribute("staffInfo", nv);
		m.addAttribute("staffAcc", acc);
		return "nhanvienprofile";
	}

	@RequestMapping(value = "/changepwd", method = RequestMethod.POST)
	public String changePwd(@ModelAttribute("staffAcc") AccountUpdateModel pwd,
			ModelMap m) {
		TaiKhoan tk = new TaiKhoanBUS().get(pwd.getId());
		if (EncryptPassword.md5(pwd.getPassword()).equals(tk.getMatKhau()) == false) {
			NhanVien nv = new NhanVienBUS().get(pwd.getId());

			// Add HocVien model and AccountUpdateModel to view
			m.addAttribute("staffInfo", nv);
			m.addAttribute("staffAcc", pwd);
			m.addAttribute("status", "Mật khẩu không đúng");

			return "nhanvienprofile";
		} else {
			new TaiKhoanBUS().updatePwd(pwd);
		}

		return "redirect:/profile/nhanvien";
	}

}
