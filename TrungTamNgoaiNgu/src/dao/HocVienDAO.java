package dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.HocVien;
import utils.ConnectionFactory;

public class HocVienDAO {

	public HocVien getHocVien(String taikhoan){
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();
		HocVien hv = null;

		// Get trainee information
		try {
			sess.getTransaction().begin();
			Query query = sess.createQuery("from HocVien where taiKhoan = :taikhoan");
			query.setString("taikhoan", taikhoan);
			hv = (HocVien) query.uniqueResult();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return hv;
	}
}
