package controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.ThongKeModel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pojo.ChuDe;
import pojo.KhoaHoc;
import pojo.PhanHoiHocVien;
import utils.DateFormat;
import bus.ChuDeBUS;
import bus.KhoaHocBUS;
import dao.PhanHoiDAO;
import dao.ThongKeDAO;

@Controller
@RequestMapping(value = "/bangiamdoc")
public class SupervisorController {

	// Action statistic counting number of students
	@RequestMapping(value = "/thongke", method = RequestMethod.GET)
	public String viewStatistic(ModelMap m) {
		int[] byYear = new int[6];
		List<KhoaHoc> lstKh = new KhoaHocBUS().getAll();
		List<ChuDe> lstCd = new ChuDeBUS().getAll();
		List<ThongKeModel> byCourse = new ArrayList<ThongKeModel>();
		List<ThongKeModel> bySubject = new ArrayList<ThongKeModel>();
		ThongKeDAO tkDao = new ThongKeDAO();

		for (int i = 0; i < 6; i++) {
			int year = 2014 + i;
			byYear[i] = tkDao.byYear(year);
		}

		// counting by course
		for (KhoaHoc kh : lstKh) {
			ThongKeModel tk = new ThongKeModel();
			tk.setTen(kh.getTen());
			tk.setSoLuong(kh.getDangKyKhoaHocs().size());
			byCourse.add(tk);
		}

		// counting by subject
		for (ChuDe cd : lstCd) {
			ThongKeModel tk = new ThongKeModel();
			tk.setTen(cd.getTen());
			tk.setSoLuong(tkDao.bySubject(cd.getId()));
			bySubject.add(tk);
		}

		m.addAttribute("byYear", byYear);
		m.addAttribute("byCourse", byCourse);
		m.addAttribute("bySubject", bySubject);

		return "thongke";
	}

	// Action get supervisor feedback's view no params
	@RequestMapping(value = "/phanhoi", method = RequestMethod.GET)
	public String viewFeedback(ModelMap m) {
		Date date = new Date();

		List<PhanHoiHocVien> lst = new PhanHoiDAO().getAll(date.getMonth() + 1,
				date.getYear() + 1900);
		m.addAttribute("lst", lst);

		return "superfeedback";
	}

	// The same with params
	@RequestMapping(value = "/phanhoi", method = RequestMethod.POST)
	public String viewFeedback(@RequestParam("date") String dateStr, ModelMap m) {
		Date date = new DateFormat().getDate(dateStr, new DateFormat().FM_MY);
		List<PhanHoiHocVien> lst = new PhanHoiDAO().getAll(date.getMonth() + 1,
				date.getYear() + 1900);
		m.addAttribute("lst", lst);

		return "superfeedback";
	}

	@RequestMapping(value = "/xemphanhoi", method = RequestMethod.GET)
	public String viewSingleFeedback(@RequestParam("thoiGian") String thoiGian,
			@RequestParam("hocVien") int hocVien, ModelMap m) {
		PhanHoiHocVien ph = new PhanHoiDAO().get(hocVien, thoiGian);

		m.addAttribute("obj", ph);

		return "superfeedbackcontent";
	}

}
