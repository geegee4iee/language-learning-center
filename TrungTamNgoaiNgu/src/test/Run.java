package test;

import java.util.Date;
import java.util.List;

import dao.KyThiDAO;
import model.HighScoreModel;
import model.KhoaHocManagerModel;
import model.LichHocManagerModel;
import pojo.KhoaHoc;
import pojo.KyThi;
import pojo.PhanHoiHocVien;
import utils.DateFormat;
import bus.KhoaHocBUS;
import bus.KyThiBUS;
import bus.LichHocBUS;
import bus.PhanHoiBUS;

public class Run {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * LichHocManagerModel lh = new LichHocManagerModel(); lh.setBuoiHoc(2);
		 * lh.setKhoaHoc(1); lh.setPhongHoc("F23");
		 * lh.setThoiGianHoc("05/07/2015 7:28 PM"); LichHocBUS bus = new
		 * LichHocBUS(); bus.add(lh);
		 */
		List<KyThi> kh = new KyThiBUS().getRegByHocVien(1);
		
		for(KyThi k:kh){
			System.out.println(k.getTen());
		}
	}

}
