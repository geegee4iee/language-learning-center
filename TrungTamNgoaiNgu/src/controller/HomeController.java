package controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bus.KhoaHocBUS;
import pojo.KhoaHoc;

@Controller
@RequestMapping(value = "/home")
public class HomeController {

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model m) {
		List<KhoaHoc> lst = new KhoaHocBUS().getAll();
		m.addAttribute("lst", lst);
		return "index";
	}
	// sua o day
	// o day tiep
	@RequestMapping(value = "/khongco", method = RequestMethod.GET)
	public ResponseEntity<String> error() {
		return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
	}
}
