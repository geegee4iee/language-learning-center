package bus;

import java.math.BigDecimal;
import java.util.List;

import model.NhanVienManagerModel;
import dao.NhanVienDAO;
import pojo.NhanVien;

public class NhanVienBUS {
	public NhanVien get(int nhanVien) {
		return new NhanVienDAO().get(nhanVien);
	}

	public NhanVien get(String taiKhoan) {
		return new NhanVienDAO().get(taiKhoan);
	}

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
