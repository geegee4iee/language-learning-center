package controller;

import java.util.List;

import model.HighScoreModel;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bus.KhoaHocBUS;
import bus.KyThiBUS;
import bus.PhanHoiBUS;
import pojo.KhoaHoc;
import pojo.PhanHoiHocVien;

@Controller
@RequestMapping(value = "/home")
public class HomeController {

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model m) {
		List<KhoaHoc> lst = new KhoaHocBUS().getUnStartKhoaHoc();
		List<HighScoreModel> lstHs = new KyThiBUS().getHighScore();
		List<PhanHoiHocVien> lstPh = new PhanHoiBUS().getAllNew(3);

		m.addAttribute("lst", lst);
		m.addAttribute("lstHs", lstHs);
		m.addAttribute("lstPh", lstPh);
		return "index";
	}

	// sua o day
	// o day tiep tiep
	// daay
	// tiep
	@RequestMapping(value = "/khongco", method = RequestMethod.GET)
	public ResponseEntity<String> error() {
		return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
	}
}
