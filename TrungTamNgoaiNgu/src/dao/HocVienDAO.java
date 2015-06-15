package dao;

import model.HocVienInfoModel;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.HocVien;
import utils.ConnectionFactory;
import utils.DateFormat;

public class HocVienDAO {

	public HocVien getHocVien(String taikhoan) {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();
		HocVien hv = null;

		// Get trainee information
		try {
			sess.getTransaction().begin();
			Query query = sess
					.createQuery("from HocVien where taiKhoan = :taikhoan");
			query.setString("taikhoan", taikhoan);
			hv = (HocVien) query.uniqueResult();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return hv;
	}

	public boolean updateInfo(HocVienInfoModel model) {
		HocVien hv = null;
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			hv = (HocVien) sess.load(HocVien.class, model.getId());
			hv.setHoTen(model.getHoTen());
			hv.setSoDienThoai(model.getSoDienThoai());
			hv.setDiaChi(model.getDiaChi());
			hv.setNgaySinh(new DateFormat().getDate(model.getNgaySinh(),
					DateFormat.FORMAT_2));

			sess.update(hv);
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
