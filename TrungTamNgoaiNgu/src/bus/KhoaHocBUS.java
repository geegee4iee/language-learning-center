package bus;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.KhoaHocManagerModel;
import pojo.KhoaHoc;
import dao.KhoaHocDAO;

public class KhoaHocBUS {

	public List<KhoaHoc> getAll() {
		return new KhoaHocDAO().getAll();
	}

	public List<KhoaHoc> get(String content) {
		return new KhoaHocDAO().get(content);
	}

	public List<KhoaHoc> getStarted() {
		List<KhoaHoc> lstKh = new KhoaHocDAO().getAll();
		List<KhoaHoc> lstCurKh = new ArrayList<KhoaHoc>();
		Date curDate = new Date();

		for (KhoaHoc kh : lstKh) {
			if (curDate.compareTo(kh.getNgayBatDau()) >= 0) {
				lstCurKh.add(kh);
			}
		}

		return lstCurKh;
	}

	public List<KhoaHoc> getStarted(List<KhoaHoc> lstKh) {
		List<KhoaHoc> lstCurKh = new ArrayList<KhoaHoc>();
		Date curDate = new Date();

		for (KhoaHoc kh : lstKh) {
			if (curDate.compareTo(kh.getNgayBatDau()) >= 0) {
				lstCurKh.add(kh);
			}
		}

		return lstCurKh;
	}

	public List<KhoaHoc> getStarted(int subject) {
		List<KhoaHoc> lstKh = new KhoaHocDAO().getAll(subject);
		List<KhoaHoc> lstCurKh = new ArrayList<KhoaHoc>();
		Date curDate = new Date();

		for (KhoaHoc kh : lstKh) {
			if (curDate.compareTo(kh.getNgayBatDau()) >= 0) {
				lstCurKh.add(kh);
			}
		}

		return lstCurKh;
	}

	public List<KhoaHoc> getUnStartKhoaHoc() {
		List<KhoaHoc> lstKh = new KhoaHocDAO().getAll();
		List<KhoaHoc> lstCurKh = new ArrayList<KhoaHoc>();
		Date curDate = new Date();

		for (KhoaHoc kh : lstKh) {
			if (curDate.compareTo(kh.getNgayBatDau()) < 0) {
				lstCurKh.add(kh);
			}
		}

		return lstCurKh;
	}

	public List<KhoaHoc> getUnStartKhoaHoc(List<KhoaHoc> lstKh) {
		List<KhoaHoc> lstCurKh = new ArrayList<KhoaHoc>();
		Date curDate = new Date();

		for (KhoaHoc kh : lstKh) {
			if (curDate.compareTo(kh.getNgayBatDau()) < 0) {
				lstCurKh.add(kh);
			}
		}

		return lstCurKh;
	}

	public List<KhoaHoc> getUnStartKhoaHoc(int subject) {
		List<KhoaHoc> lstKh = new KhoaHocDAO().getAll(subject);
		List<KhoaHoc> lstCurKh = new ArrayList<KhoaHoc>();
		Date curDate = new Date();

		for (KhoaHoc kh : lstKh) {
			if (curDate.compareTo(kh.getNgayBatDau()) < 0) {
				lstCurKh.add(kh);
			}
		}

		return lstCurKh;
	}

	public List<KhoaHoc> getRegByHocVien(int idHocVien) {
		return new KhoaHocDAO().getRegByHocVien(idHocVien);
	}

	public List<KhoaHoc> getAll(int chudeId) {
		return new KhoaHocDAO().getAll(chudeId);
	}

	public KhoaHoc getById(int id) {
		return new KhoaHocDAO().getById(id);
	}

	public boolean update(KhoaHocManagerModel model) {
		return new KhoaHocDAO().update(model);
	}

	public boolean add(KhoaHocManagerModel khM) {
		return new KhoaHocDAO().add(khM);
	}
}
