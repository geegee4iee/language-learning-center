package bus;

import dao.TaiKhoanDAO;
import model.TaiKhoanManagerModel;

public class TaiKhoanBUS {
	public boolean add(TaiKhoanManagerModel tkM) {
		return new TaiKhoanDAO().add(tkM);
	}
}
