package controller;

import java.io.File;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.List;

import javassist.compiler.ast.Stmnt;
import model.NhanVienManagerModel;
import model.RegisterModel;
import model.TaiKhoanManagerModel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bus.ChuDeBUS;
import bus.DangKyKhoaHocBUS;
import bus.KyThiBUS;
import bus.NhanVienBUS;
import bus.PhanHoiBUS;
import bus.TaiKhoanBUS;
import dao.NhanVienDAO;
import pojo.ChuDe;
import pojo.DangKyKhoaHoc;
import pojo.DangKyKhoaHocId;
import pojo.DangKyThi;
import pojo.DangKyThiId;
import pojo.KyThi;
import pojo.NhanVien;
import utils.BackupDatabase;
import utils.ConnectionFactory;

@Controller
@RequestMapping(value = "/quantri")
public class ManagerController {

	@RequestMapping(value = "/nhanvien", method = RequestMethod.GET)
	public String listStaff(ModelMap m) {
		List<NhanVien> lst = new NhanVienBUS().getAll();
		m.addAttribute("lst", lst);

		return "listnhanvien";
	}

	@RequestMapping(value = "/themnhanvien", method = RequestMethod.GET)
	public String addStaff(ModelMap m) {
		m.addAttribute("obj", new NhanVienManagerModel());

		return "addnhanvien";
	}

	@RequestMapping(value = "/themnhanvien", method = RequestMethod.POST)
	public String addStaff(@ModelAttribute("obj") NhanVienManagerModel nvM,
			ModelMap m) {
		if (new NhanVienBUS().add(nvM) == false) {
			m.addAttribute("obj", nvM);
			m.addAttribute("status", "Thêm nhân viên thất bại");

			return "addnhanvien";
		}

		return "redirect:/quantri/nhanvien";
	}

	@RequestMapping(value = "/themtaikhoan/{id}", method = RequestMethod.GET)
	public String addAccount(ModelMap m, @PathVariable("id") int nhanVien) {
		TaiKhoanManagerModel tkM = new TaiKhoanManagerModel();
		tkM.setNhanVien(nhanVien);
		m.addAttribute("obj", tkM);

		return "addtaikhoannhanvien";
	}

	@RequestMapping(value = "/themtaikhoan", method = RequestMethod.POST)
	public String addAccount(ModelMap m,
			@ModelAttribute("obj") TaiKhoanManagerModel tkM) {
		tkM.setPermission(2);

		if (new TaiKhoanBUS().add(tkM) == false) {
			m.addAttribute("obj", tkM);
			m.addAttribute("status", "Thêm tài khoản thất bại");

			return "addtaikhoannhanvien";
		}

		return "redirect:/quantri/nhanvien";
	}

	@RequestMapping(value = "/capnhapluong", method = RequestMethod.POST)
	public String updateSalary(ModelMap m,
			@RequestParam("luong") BigDecimal luong,
			@RequestParam("nhanVien") int nhanVien) {
		if (new NhanVienBUS().updateSalary(nhanVien, luong) == false) {
			return "redirect:/quantri/nhanvien";
		}

		return "redirect:/quantri/nhanvien";
	}

	@RequestMapping(value = "/phanhoi", method = RequestMethod.GET)
	public String listFeedback(ModelMap m) {
		m.addAttribute("lst", new PhanHoiBUS().getAll());

		return "feedback";
	}

	@RequestMapping(value = "/xemphanhoi", method = RequestMethod.GET)
	public String viewFeedback(ModelMap m,
			@RequestParam("hocVien") int hocVien,
			@RequestParam("thoiGian") String thoiGian) {
		m.addAttribute("obj", new PhanHoiBUS().get(hocVien, thoiGian));

		return "feedbackcontent";
	}

	@RequestMapping(value = "/xoaphanhoi", method = RequestMethod.POST)
	public String removeFeedback(ModelMap m,
			@RequestParam("hocVien") int hocVien,
			@RequestParam("thoiGian") String thoiGian) {
		if (new PhanHoiBUS().remove(hocVien, thoiGian) == false) {
			return "redirect:/quantri/phanhoi";
		}

		return "redirect:/quantri/phanhoi";
	}

	@RequestMapping(value = "/doichuyende/{id}", method = RequestMethod.GET)
	public String changeSubject(ModelMap m, @PathVariable("id") int nhanVien) {
		List<ChuDe> lst = new ChuDeBUS().getAllExcept(nhanVien);

		m.addAttribute("lst", lst);
		m.addAttribute("nhanVien", nhanVien);

		return "editstaffsubject";
	}

	@RequestMapping(value = "/doichuyende", method = RequestMethod.POST)
	public String changeSubject(ModelMap m,
			@RequestParam("nhanVien") int nhanVien,
			@RequestParam("chuDe") int chuDe) {
		if (new ChuDeBUS().changeStaff(nhanVien, chuDe) == false) {

		}

		return "redirect:/quantri/doichuyende/" + nhanVien;
	}

	@RequestMapping(value = "/backup", method = RequestMethod.GET)
	public String backup(ModelMap m) {
		String lastModifed = new BackupDatabase().getLastBackup();
		String lastAccess = new BackupDatabase().getLastRestore();

		m.addAttribute("restoreTime", lastAccess);
		m.addAttribute("modTime", lastModifed);

		return "backup";
	}

	@RequestMapping(value = "/backup", method = RequestMethod.POST)
	public String runBackup(ModelMap m) {
		new BackupDatabase().backup();

		return "redirect:/quantri/backup";
	}

	@RequestMapping(value = "/restore", method = RequestMethod.POST)
	public String runRestore() {
		new BackupDatabase().restore();

		return "redirect:/quantri/backup";
	}

	@RequestMapping(value = "/dangkykhoahoc", method = RequestMethod.GET)
	public String viewRegisterCourse(ModelMap m) {
		List<DangKyKhoaHoc> lst = new DangKyKhoaHocBUS().getUnReg();
		m.addAttribute("lst", lst);

		return "regcourse";
	}

	@RequestMapping(value = "/dangkykhoahoc", method = RequestMethod.POST)
	public String registerCourse(@RequestParam("hocVien") int hocVien,
			@RequestParam("khoaHoc") int khoaHoc, ModelMap m) {
		DangKyKhoaHocId dkId = new DangKyKhoaHocId(hocVien, khoaHoc);
		new DangKyKhoaHocBUS().register(dkId);

		return "redirect:/quantri/dangkykhoahoc";
	}

	@RequestMapping(value = "/dangkythi", method = RequestMethod.GET)
	public String viewRegExam(ModelMap m) {
		List<DangKyThi> lst = new KyThiBUS().getUnReg();
		m.addAttribute("lst", lst);

		return "regexam";
	}

	@RequestMapping(value = "/dangkythi", method = RequestMethod.POST)
	public String regExam(@RequestParam("kyThi") int kyThi,
			@RequestParam("hocVien") int hocVien) {
		DangKyThiId dkId = new DangKyThiId(kyThi, hocVien);
		new KyThiBUS().register(dkId);

		return "redirect:/quantri/dangkythi";
	}

	@RequestMapping(value = "/kythi", method = RequestMethod.GET)
	public String listKyThi(ModelMap m) {
		List<KyThi> lst = new KyThiBUS().getStarted();

		m.addAttribute("lst", lst);
		return "kythiquantri";
	}

	@RequestMapping(value = "/kythi/{id}", method = RequestMethod.GET)
	public String listDangKyThi(ModelMap m, @PathVariable("id") int kyThi) {
		List<DangKyThi> lst = new KyThiBUS().getReg(kyThi);

		return "dangkythiquantri";
	}

	@RequestMapping(value = "/capnhapdiem", method = RequestMethod.POST)
	public String updateScore(@RequestParam("kyThi") int kyThi,
			@RequestParam("hocVien") int hocVien,
			@RequestParam("diem") float diem) {

		return "redirect:/quantri/";
	}
}
