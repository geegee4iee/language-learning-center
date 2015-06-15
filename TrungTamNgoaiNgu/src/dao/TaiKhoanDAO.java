package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.NhanVien;
import pojo.QuyenHan;
import pojo.TaiKhoan;
import utils.ConnectionFactory;
import utils.EncryptPassword;
import model.AccountUpdateModel;
import model.TaiKhoanManagerModel;

public class TaiKhoanDAO {
	public boolean add(TaiKhoanManagerModel tkM) {
		boolean flag = false;
		TaiKhoan tk = new TaiKhoan();
		tk.setId(tkM.getId());
		tk.setMatKhau(EncryptPassword.md5(tkM.getPassword()));
		tk.setQuyenHan(new QuyenHan(tkM.getPermission(), ""));

		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			NhanVien nv = (NhanVien) sess.load(NhanVien.class,
					tkM.getNhanVien());

			if (nv.getTaiKhoan() == null) {
				sess.save(tk);
				nv.setTaiKhoan(tk);
				sess.update(nv);
				sess.getTransaction().commit();
				flag = true;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sess.getTransaction().rollback();
			return flag;
		}

		return flag;
	}

	public TaiKhoan get(String id) {
		TaiKhoan tk = null;
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			tk = (TaiKhoan) sess.get(TaiKhoan.class, id);
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return tk;
	}

	public boolean updatePwd(AccountUpdateModel pwd) {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			TaiKhoan tk = (TaiKhoan) sess.load(TaiKhoan.class, pwd.getId());
			tk.setMatKhau(EncryptPassword.md5(pwd.getPasswordNew()));
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sess.getTransaction().rollback();

			return false;
		}

		return true;
	}
}
