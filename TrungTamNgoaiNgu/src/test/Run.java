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
		List<KyThi> lstKy = new KyThiDAO().getStarted();

		for (KyThi kt : lstKy) {
			System.out.println(kt.getTen());
		}
		
		List<HighScoreModel> lstHs = new KyThiBUS().getHighScore();
		
		for(HighScoreModel m:lstHs){
			System.out.println(m.getDiem());
		}

		System.out.println("Chào bạn");
		
		List<PhanHoiHocVien> lstPh = new PhanHoiBUS().getAllNew(5);
		for(PhanHoiHocVien ph:lstPh){
			System.out.println(ph.getNoiDung());
		}
	}

}
