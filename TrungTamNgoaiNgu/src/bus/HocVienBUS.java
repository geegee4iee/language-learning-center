package bus;

import model.HocVienInfoModel;
import pojo.HocVien;
import utils.DateFormat;
import dao.HocVienDAO;

public class HocVienBUS {

	public HocVien getHocVien(String taikhoan) {
		HocVien hv = new HocVienDAO().getHocVien(taikhoan);

		return hv;
	}

	public HocVienInfoModel toHocVienInfo(HocVien hv) {
		HocVienInfoModel model = new HocVienInfoModel();
		model.setId(hv.getId());
		model.setHoTen(hv.getHoTen());
		model.setDiaChi(hv.getDiaChi());
		model.setSoDienThoai(hv.getSoDienThoai());
		model.setNgaySinh(new DateFormat().getDateString(hv.getNgaySinh(),
				DateFormat.FORMAT_2));

		return model;
	}

	public boolean updateInfo(HocVienInfoModel model) {
		return new HocVienDAO().updateInfo(model);
	}
}
