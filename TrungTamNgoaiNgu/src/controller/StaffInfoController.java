package controller;

import model.AccountUpdateModel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pojo.NhanVien;
import bus.NhanVienBUS;

@Controller
@RequestMapping("/profile")
public class StaffInfoController {
	@RequestMapping(value = "/nhanvien", method = RequestMethod.POST)
	public String staffIndex(ModelMap m, @RequestParam("id") int nhanVien) {
		NhanVien nv = new NhanVienBUS().get(nhanVien);
		AccountUpdateModel acc = new AccountUpdateModel();
		acc.setId(nv.getTaiKhoan().getId());

		m.addAttribute("staffInfo", nv);
		m.addAttribute("staffAcc", acc);
		return "nhanvienprofile";
	}
}
