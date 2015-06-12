package bus;

import java.util.List;

import dao.KhoaHocDAO;
import dao.ThongBaoDAO;
import pojo.ThongBaoKhoaHoc;

public class ThongBaoBUS {
	public List<ThongBaoKhoaHoc> getAll(int khoaHoc) {
		return new ThongBaoDAO().getAll(khoaHoc);
	}

	public boolean add(int khoaHoc, String noiDung) {
		return new ThongBaoDAO().add(khoaHoc, noiDung);
	}

	public boolean remove(int khoaHoc, String thoiGian) {
		return new ThongBaoDAO().remove(khoaHoc, thoiGian);
	}
}
