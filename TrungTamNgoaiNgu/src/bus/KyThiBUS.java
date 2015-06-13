package bus;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.HighScoreModel;
import dao.KyThiDAO;
import pojo.DangKyThi;
import pojo.DangKyThiId;
import pojo.KyThi;

public class KyThiBUS {

	public List<KyThi> getAll() {
		return new KyThiDAO().getAll();
	}

	public List<HighScoreModel> getHighScore() {
		List<KyThi> lst = new KyThiDAO().getStarted();

		return new KyThiDAO().getHighScore(lst);
	}

	public List<KyThi> getUnStart() {
		List<KyThi> lst = new KyThiDAO().getAll();
		List<KyThi> lstUn = new ArrayList<KyThi>();
		Date curDate = new Date();

		for (KyThi kt : lst) {
			if (curDate.compareTo(kt.getThoiGianThi()) < 0) {
				lstUn.add(kt);
			}
		}

		return lstUn;
	}

	public List<DangKyThi> getReg(int kyThi) {
		return new KyThiDAO().getReg(kyThi);
	}

	public List<KyThi> getStarted() {
		List<KyThi> lst = new KyThiDAO().getAll();
		List<KyThi> lstUn = new ArrayList<KyThi>();
		Date curDate = new Date();

		for (KyThi kt : lst) {
			if (curDate.compareTo(kt.getThoiGianThi()) >= 0) {
				lstUn.add(kt);
			}
		}

		return lstUn;
	}

	public boolean updateScore(DangKyThiId id, double diem) {
		return new KyThiDAO().updateScore(id, diem);
	}

	public boolean isExistDangKy(DangKyThiId id) {
		if (new KyThiDAO().getDangKy(id) == null) {
			return false;
		} else {
			return true;
		}
	}

	public boolean addDangKy(DangKyThiId id) {
		return new KyThiDAO().addDangKy(id);
	}

	public List<DangKyThi> getUnReg() {
		return new KyThiDAO().getUnReg();
	}

	public boolean register(DangKyThiId dkId) {
		return new KyThiDAO().register(dkId);
	}
}
