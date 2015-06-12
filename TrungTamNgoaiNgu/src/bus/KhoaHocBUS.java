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
