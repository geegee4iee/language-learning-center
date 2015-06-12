package bus;

import java.util.List;

import model.LichHocManagerModel;
import dao.LichHocDAO;
import pojo.LichHoc;
import pojo.LichHocId;

public class LichHocBUS {
	public List<LichHoc> getAll(int idKhoaHoc) {
		return new LichHocDAO().getAll(idKhoaHoc);
	}

	public LichHoc get(LichHocId id) {
		return new LichHocDAO().get(id);
	}

	public boolean add(LichHocManagerModel lhM) {
		return new LichHocDAO().add(lhM);
	}

	public boolean update(LichHocManagerModel lhM) {
		return new LichHocDAO().update(lhM);
	}

	public boolean remove(LichHocId lhId) {
		return new LichHocDAO().remove(lhId);
	}
}
