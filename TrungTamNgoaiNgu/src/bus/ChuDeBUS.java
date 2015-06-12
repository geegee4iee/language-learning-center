package bus;

import java.util.List;

import dao.ChuDeDAO;
import pojo.ChuDe;

public class ChuDeBUS {
	public List<ChuDe> getAll() {
		return new ChuDeDAO().getAll();
	}

	public List<ChuDe> getAll(int idStaff) {
		return new ChuDeDAO().getAll(idStaff);
	}

	public List<ChuDe> getAllExcept(int idStaff) {
		return new ChuDeDAO().getAllExcept(idStaff);
	}

	public boolean changeStaff(int nhanVien, int chuDe) {
		return new ChuDeDAO().changeStaff(nhanVien, chuDe);
	}
}
