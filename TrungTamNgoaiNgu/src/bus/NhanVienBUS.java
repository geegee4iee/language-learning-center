package bus;

import java.math.BigDecimal;
import java.util.List;

import model.NhanVienInfoModel;
import model.NhanVienManagerModel;
import dao.NhanVienDAO;
import pojo.NhanVien;
import utils.DateFormat;

public class NhanVienBUS {
	public NhanVien get(int nhanVien) {
		return new NhanVienDAO().get(nhanVien);
	}

	public NhanVienInfoModel getInfoModel(int idNhanVien) {
		NhanVien nv = new NhanVienDAO().get(idNhanVien);
		NhanVienInfoModel model = new NhanVienInfoModel();
		model.setId(nv.getId());
		model.setHoTen(nv.getHoTen());
		model.setDiaChi(nv.getDiaChi());
		model.setSoDienThoai(nv.getSoDienThoai());
		model.setNgaySinh(new DateFormat().getDateString(nv.getNgaySinh(),
				DateFormat.FORMAT_2));

		return model;
	}

	public boolean update(NhanVienInfoModel model) {
		return new NhanVienDAO().update(model);
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
