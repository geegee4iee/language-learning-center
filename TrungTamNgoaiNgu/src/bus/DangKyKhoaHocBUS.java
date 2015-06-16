package bus;

import java.util.List;

import dao.DangKyKhoaHocDAO;
import pojo.DangKyKhoaHoc;
import pojo.DangKyKhoaHocId;

public class DangKyKhoaHocBUS {

	public boolean isExist(DangKyKhoaHocId id) {
		DangKyKhoaHoc dkKh = new DangKyKhoaHocDAO().getDangKyKhoaHoc(id);

		if (dkKh == null) {
			return false;
		} else {
			return true;
		}
	}

	public List<DangKyKhoaHoc> getUnReg() {
		return new DangKyKhoaHocDAO().getUnReg();
	}

	public boolean register(DangKyKhoaHocId dkId) {
		return new DangKyKhoaHocDAO().register(dkId);
	}

	public boolean removeReg(DangKyKhoaHocId dkId) {
		return new DangKyKhoaHocDAO().removeReg(dkId);
	}
}
