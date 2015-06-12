package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.ChuDe;
import pojo.NhanVien;
import utils.ConnectionFactory;

public class ChuDeDAO {
	@SuppressWarnings("unchecked")
	public List<ChuDe> getAll() {
		List<ChuDe> lst = new ArrayList<ChuDe>();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			lst = sess.createCriteria(ChuDe.class).list();
			sess.getTransaction().commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lst;
	}

	@SuppressWarnings("unchecked")
	public List<ChuDe> getAll(int idStaff) {
		List<ChuDe> lst = new ArrayList<ChuDe>();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			Query query = sess
					.createQuery("from ChuDe where IdNhanVien=:idStaff");
			query.setParameter("idStaff", idStaff);
			lst = query.list();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lst;
	}

	@SuppressWarnings("unchecked")
	public List<ChuDe> getAllExcept(int idStaff) {
		List<ChuDe> lst = new ArrayList<ChuDe>();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			Query query = sess
					.createQuery("from ChuDe where IdNhanVien!=:idStaff");
			query.setParameter("idStaff", idStaff);
			lst = query.list();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lst;
	}

	public boolean changeStaff(int nhanVien, int chuDe) {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			NhanVien nv = (NhanVien) sess.load(NhanVien.class, nhanVien);
			ChuDe cd = (ChuDe) sess.load(ChuDe.class, chuDe);
			cd.setNhanVien(nv);
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
