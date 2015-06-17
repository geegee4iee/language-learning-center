package bus;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.HighScoreModel;
import model.KythiManagerModel;
import dao.KyThiDAO;
import pojo.DangKyThi;
import pojo.DangKyThiId;
import pojo.KyThi;
import utils.DateFormat;

public class KyThiBUS {

	public List<KyThi> getAll() {
		return new KyThiDAO().getAll();
	}

	public boolean add(KythiManagerModel model) {
		return new KyThiDAO().add(model);
	}

	public boolean update(KythiManagerModel model) {
		return new KyThiDAO().update(model);
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

	public List<KyThi> getStarted(List<KyThi> lst) {
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

	public List<KyThi> getRegByHocVien(int idHocVien) {
		return new KyThiDAO().getRegByHocVien(idHocVien);
	}

	public List<DangKyThi> getScores(int idHocVien) {
		List<DangKyThi> lstDk = new KyThiDAO().getScores(idHocVien);
		Date curDate = new Date();
		List<DangKyThi> lstDkStarted = new ArrayList<DangKyThi>();
		for (DangKyThi dk : lstDk) {
			KyThi kt = dk.getKyThi();

			if (curDate.compareTo(kt.getThoiGianThi()) >= 0) {
				lstDkStarted.add(dk);
			}
		}

		return lstDkStarted;
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

	public KyThi get(int idKyThi) {
		return new KyThiDAO().get(idKyThi);
	}

	public KythiManagerModel getKyThiModel(int idKyThi) {
		KyThi kt = get(idKyThi);
		KythiManagerModel model = new KythiManagerModel();
		model.setId(kt.getId());
		model.setDiaDiem(kt.getDiaDiem());
		model.setTen(kt.getTen());
		model.setThoiGianThi(new DateFormat().getDateString(
				kt.getThoiGianThi(), DateFormat.FORMAT_3));

		return model;
	}

	public boolean removeReg(DangKyThiId dkId) {
		return new KyThiDAO().removeReg(dkId);
	}

	public boolean remove(int idKyThi) {
		return new KyThiDAO().remove(idKyThi);
	}
}
