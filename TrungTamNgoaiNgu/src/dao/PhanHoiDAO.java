package dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.PhanHoiHocVien;
import pojo.PhanHoiHocVienId;
import utils.ConnectionFactory;
import utils.DateFormat;

public class PhanHoiDAO {
	@SuppressWarnings("unchecked")
	public List<PhanHoiHocVien> getAll() {
		List<PhanHoiHocVien> lst = new ArrayList<PhanHoiHocVien>();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			lst = sess.createCriteria(PhanHoiHocVien.class).list();
			sess.getTransaction().commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lst;
	}

	@SuppressWarnings("unchecked")
	public List<PhanHoiHocVien> getAllNew(int quantity) {
		List<PhanHoiHocVien> lst = new ArrayList<PhanHoiHocVien>();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			Query query = sess
					.createQuery("from PhanHoiHocVien order by thoiGian desc");
			lst = query.setMaxResults(quantity).list();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lst;
	}

	@SuppressWarnings("unchecked")
	public List<PhanHoiHocVien> getAll(int month, int year) {
		List<PhanHoiHocVien> lst = new ArrayList<PhanHoiHocVien>();
		Date date = new Date();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();
		System.out.println(month);
		System.out.println(year);

		try {
			sess.getTransaction().begin();
			Query query = sess
					.createQuery("from PhanHoiHocVien where month(thoiGian)=:month and year(thoiGian)=:year");
			query.setParameter("month", month);
			query.setParameter("year", year);

			lst = query.list();

			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lst;
	}

	public PhanHoiHocVien get(int hocVien, String thoiGian) {
		PhanHoiHocVienId phId = new PhanHoiHocVienId(hocVien,
				new DateFormat().getDateTimeNoSplit(thoiGian));
		PhanHoiHocVien ph = null;
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			ph = (PhanHoiHocVien) sess.get(PhanHoiHocVien.class, phId);
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ph;
	}

	public boolean remove(int hocVien, String thoiGian) {
		PhanHoiHocVienId phId = new PhanHoiHocVienId(hocVien,
				new DateFormat().getDateTimeNoSplit(thoiGian));
		PhanHoiHocVien ph = null;
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			ph = (PhanHoiHocVien) sess.load(PhanHoiHocVien.class, phId);
			sess.delete(ph);
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
