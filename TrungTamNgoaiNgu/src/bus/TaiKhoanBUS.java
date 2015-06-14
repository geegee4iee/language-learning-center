package bus;

import java.util.Iterator;

import pojo.HocVien;
import pojo.NhanVien;
import pojo.TaiKhoan;
import dao.TaiKhoanDAO;
import model.SessionUserModel;
import model.TaiKhoanManagerModel;

public class TaiKhoanBUS {
	public boolean add(TaiKhoanManagerModel tkM) {
		return new TaiKhoanDAO().add(tkM);
	}

	public TaiKhoan get(String id) {
		return new TaiKhoanDAO().get(id);
	}

	public SessionUserModel getSession(String id) {
		SessionUserModel sessUser = null;
		TaiKhoan tk = new TaiKhoanDAO().get(id);

		if (tk != null) {
			sessUser = new SessionUserModel();
			sessUser.setId(tk.getId());
			sessUser.setPermission(tk.getQuyenHan().getId());

			if (tk.getHocViens().isEmpty() == true) {
				Iterator<NhanVien> iter = tk.getNhanViens().iterator();
				sessUser.setName(iter.next().getHoTen());
			} else {
				Iterator<HocVien> iter = tk.getHocViens().iterator();
				sessUser.setName(iter.next().getHoTen());
			}
		}

		return sessUser;
	}
}
