package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.DangKyKhoaHoc;
import pojo.DangKyKhoaHocId;
import utils.ConnectionFactory;

public class DangKyKhoaHocDAO {
	public DangKyKhoaHoc getDangKyKhoaHoc(DangKyKhoaHocId id) {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();
		DangKyKhoaHoc dkKh = null;

		sess.getTransaction().begin();
		dkKh = (DangKyKhoaHoc) sess.get(DangKyKhoaHoc.class, id);
		sess.getTransaction().commit();

		return dkKh;
	}

	public List<DangKyKhoaHoc> getUnReg() {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();
		List<DangKyKhoaHoc> lst = new ArrayList<DangKyKhoaHoc>();

		try {
			sess.getTransaction().begin();
			Query query = sess
					.createQuery("from DangKyKhoaHoc where daDangKy=0");
			lst = query.list();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lst;
	}

	public boolean register(DangKyKhoaHocId dkId) {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			DangKyKhoaHoc dk = (DangKyKhoaHoc) sess.load(DangKyKhoaHoc.class,
					dkId);
			dk.setDaDangKy(1);
			sess.update(dk);
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sess.getTransaction().rollback();
			return false;
		}

		return true;
	}

	public boolean removeReg(DangKyKhoaHocId dkId) {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			DangKyKhoaHoc dk = (DangKyKhoaHoc) sess.load(DangKyKhoaHoc.class,
					dkId);
			sess.delete(dk);
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
