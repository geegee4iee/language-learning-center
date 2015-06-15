package bus;

import java.util.List;

import model.ChuDeManagerModel;
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

	public boolean add(ChuDeManagerModel model) {
		return new ChuDeDAO().add(model);
	}

	public ChuDeManagerModel get(int idChuyenDe) {
		return new ChuDeDAO().get(idChuyenDe);
	}

	public boolean update(ChuDeManagerModel model) {
		return new ChuDeDAO().update(model);
	}
}
