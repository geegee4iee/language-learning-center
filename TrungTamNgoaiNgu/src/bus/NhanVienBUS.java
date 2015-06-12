package bus;

import java.math.BigDecimal;
import java.util.List;

import model.NhanVienManagerModel;
import dao.NhanVienDAO;
import pojo.NhanVien;

public class NhanVienBUS {
	public List<NhanVien> getAll() {
		return new NhanVienDAO().getAll();
	}

	public boolean add(NhanVienManagerModel nvM) {
		return new NhanVienDAO().add(nvM);
	}

	public boolean updateSalary(int nhanVien, BigDecimal luong) {
		return new NhanVienDAO().updateSalary(nhanVien, luong);
	}
}
