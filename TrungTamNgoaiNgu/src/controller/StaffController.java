package controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.KhoaHocManagerModel;
import model.LichHocManagerModel;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

import pojo.ChuDe;
import pojo.KhoaHoc;
import pojo.LichHoc;
import pojo.LichHocId;
import pojo.NhanVien;
import pojo.ThongBaoKhoaHoc;
import utils.ConnectionFactory;
import utils.DateFormat;
import bus.ChuDeBUS;
import bus.KhoaHocBUS;
import bus.LichHocBUS;
import bus.ThongBaoBUS;

@Controller
@RequestMapping(value = "/nhanvien")
public class StaffController {

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(ModelMap m) {
		List<ChuDe> lst = new ChuDeBUS().getAll(6);
		m.addAttribute("lst", lst);
		return "staffindex";
	}

	@RequestMapping(value = "/courses/{id}", method = RequestMethod.GET)
	public String bySubject(@PathVariable("id") int id, ModelMap m) {
		List<KhoaHoc> lst = new KhoaHocBUS().getAll(id);
		m.addAttribute("subject", id);
		m.addAttribute("lst", lst);
		return "staffcourses";
	}

	@RequestMapping(value = "/editcourse/{id}", method = RequestMethod.GET)
	public String editCourse(@PathVariable("id") int id, ModelMap m,
			@RequestParam(value = "status", required = false) String status) {
		KhoaHoc kh = new KhoaHocBUS().getById(id);
		if (kh != null) {
			KhoaHocManagerModel khE = new KhoaHocManagerModel(kh);
			m.addAttribute("linkback", kh.getChuDe().getId());
			m.addAttribute("obj", khE);
		}

		m.addAttribute("status", status);
		return "editcourse";
	}

	@RequestMapping(value = "/addcourse/{id}", method = RequestMethod.GET)
	public String addCoursePage(@PathVariable("id") int id, ModelMap m) {
		KhoaHocManagerModel khM = new KhoaHocManagerModel();
		khM.setChuDe(id);

		m.addAttribute("obj", khM);

		return "addcourse";
	}

	@RequestMapping(value = "/addcourse", method = RequestMethod.POST)
	public String addCoursePage(@ModelAttribute("obj") KhoaHocManagerModel kh,
			ModelMap m) {

		KhoaHocBUS bus = new KhoaHocBUS();
		boolean success = false;
		success = bus.add(kh);

		if (success) {
			m.addAttribute("status", "Thêm khóa học thành công");
			m.addAttribute("obj", new KhoaHocManagerModel());
		} else {
			m.addAttribute("status", "Thêm khóa học thất bại");
		}

		return "addcourse";
	}

	@RequestMapping(value = "/updatecourse", method = RequestMethod.POST)
	public String updateCourse(@ModelAttribute("obj") KhoaHocManagerModel kh,
			Model m) {
		String status = "Cập nhập thành công";

		if (new KhoaHocBUS().update(kh) == false) {
			status = "Cập nhập thất bại";
		}

		m.addAttribute("status", status);
		return "redirect:/nhanvien/editcourse/" + kh.getId();
	}

	@RequestMapping(value = "/schedule/{id}", method = RequestMethod.GET)
	public String byCourse(@PathVariable("id") int idKhoaHoc, ModelMap m) {
		List<LichHoc> lh = new LichHocBUS().getAll(idKhoaHoc);
		m.addAttribute("lst", lh);
		m.addAttribute("subject", idKhoaHoc);

		return "schedule";
	}

	@RequestMapping(value = "/addschedule/{id}", method = RequestMethod.GET)
	public String addSchedule(@PathVariable("id") int idKhoaHoc, ModelMap m) {
		LichHocManagerModel lhM = new LichHocManagerModel();
		lhM.setKhoaHoc(idKhoaHoc);
		m.addAttribute("obj", lhM);

		return "addschedule";
	}

	@RequestMapping(value = "/addschedule", method = RequestMethod.POST)
	public String addSchedule(@ModelAttribute("obj") LichHocManagerModel lhM,
			ModelMap m) {
		System.out.print(lhM.getBuoiHoc());
		if (new LichHocBUS().add(lhM) == false) {

			m.addAttribute("status", "Thêm lịch học thất bại");
			m.addAttribute("obj", lhM);

			return "addschedule";
		}

		return "redirect:/nhanvien/schedule/" + lhM.getKhoaHoc();
	}

	@RequestMapping(value = "/editschedule", method = RequestMethod.GET)
	public String editSchedule(@RequestParam("bh") int buoiHoc,
			@RequestParam("kh") int khoaHoc, ModelMap m) {
		LichHocId id = new LichHocId(khoaHoc, buoiHoc);
		LichHoc lh = new LichHocBUS().get(id);
		LichHocManagerModel lhM = new LichHocManagerModel();
		lhM.setBuoiHoc(buoiHoc);
		lhM.setKhoaHoc(khoaHoc);
		lhM.setPhongHoc(lh.getPhongHoc());
		lhM.setThoiGianHoc(new DateFormat().formatDateTime(lh.getThoiGianHoc()));
		m.addAttribute("obj", lhM);

		return "editschedule";
	}

	@RequestMapping(value = "/editschedule", method = RequestMethod.POST)
	public String editSchedule(@ModelAttribute("obj") LichHocManagerModel lhM,
			ModelMap m) {
		if (new LichHocBUS().update(lhM) == false) {
			m.addAttribute("status", "Cập nhập lịch học thất bại");
			m.addAttribute("obj", lhM);

			return "editschedule";
		}

		return "redirect:/nhanvien/schedule/" + lhM.getKhoaHoc();
	}

	@RequestMapping(value = "/delschedule", method = RequestMethod.POST)
	public String removeSchedule(@RequestParam("khoaHoc") int khoaHoc,
			@RequestParam("buoiHoc") int buoiHoc) {
		LichHocId lhId = new LichHocId(khoaHoc, buoiHoc);
		LichHocBUS bus = new LichHocBUS();
		bus.remove(lhId);

		return "redirect:/nhanvien/schedule/" + khoaHoc;
	}

	@RequestMapping(value = "/thongbao/{id}", method = RequestMethod.GET)
	public String lstThongBao(@PathVariable("id") int khoaHoc, ModelMap m) {
		List<ThongBaoKhoaHoc> lst = new ThongBaoBUS().getAll(khoaHoc);
		m.addAttribute("subject", khoaHoc);
		m.addAttribute("lst", lst);
		m.addAttribute("obj", new ThongBaoKhoaHoc());

		return "thongbao";
	}

	@RequestMapping(value = "/addthongbao", method = RequestMethod.POST)
	public String addThongBao(@RequestParam("noiDung") String noiDung,
			@RequestParam("khoaHoc") int khoaHoc, ModelMap m) {
		if (new ThongBaoBUS().add(khoaHoc, noiDung) == false) {
			List<ThongBaoKhoaHoc> lst = new ThongBaoBUS().getAll(khoaHoc);
			m.addAttribute("subject", khoaHoc);
			m.addAttribute("lst", lst);
			m.addAttribute("obj", new ThongBaoKhoaHoc());
			m.addAttribute("status", "Thêm thông báo thất bại");

			return "thongbao";
		}

		return "redirect:/nhanvien/thongbao/" + khoaHoc;
	}

	@RequestMapping(value = "/removethongbao", method = RequestMethod.GET)
	public String removeThongBao(@RequestParam("khoaHoc") int khoaHoc,
			@RequestParam("thoiGian") String thoiGian) {
		new ThongBaoBUS().remove(khoaHoc, thoiGian);

		return "redirect:/nhanvien/thongbao/" + khoaHoc;
	}

}
