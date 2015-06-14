package bus;

import java.util.List;

import dao.PhanHoiDAO;
import pojo.PhanHoiHocVien;

public class PhanHoiBUS {
	public List<PhanHoiHocVien> getAll() {
		return new PhanHoiDAO().getAll();
	}

	public PhanHoiHocVien get(int hocVien, String thoiGian) {
		return new PhanHoiDAO().get(hocVien, thoiGian);
	}

	public boolean remove(int hocVien, String thoiGian) {
		return new PhanHoiDAO().remove(hocVien, thoiGian);
	}

	public List<PhanHoiHocVien> getAllNew(int quantity) {
		return new PhanHoiDAO().getAllNew(quantity);
	}
}
