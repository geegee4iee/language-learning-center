package dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.ChuDe;
import pojo.KhoaHoc;
import utils.ConnectionFactory;

public class ThongKeDAO {
	@SuppressWarnings("unchecked")
	public int byYear(int khoa) {
		List<KhoaHoc> lst = new ArrayList<KhoaHoc>();
		int total = 0;
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			Query query = sess.createQuery("from KhoaHoc where Khoa=:khoa");
			query.setString("khoa", Integer.toString(khoa));
			lst = query.list();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		for (KhoaHoc kh : lst) {
			total += kh.getDangKyKhoaHocs().size();
		}

		return total;
	}

	public int byCourse(int khoaHoc) {
		int total = 0;
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			KhoaHoc kh = (KhoaHoc) sess.load(KhoaHoc.class, khoaHoc);
			total = kh.getDangKyKhoaHocs().size();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return total;
	}

	public int bySubject(int chuDe) {
		int total = 0;
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();
		Set<KhoaHoc> lstKh = new HashSet<KhoaHoc>();

		try {
			sess.getTransaction().begin();
			ChuDe cd = (ChuDe) sess.load(ChuDe.class, chuDe);
			lstKh = cd.getKhoaHocs();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		for (KhoaHoc kh : lstKh) {
			total += byCourse(kh.getId());
		}

		return total;
	}
}
