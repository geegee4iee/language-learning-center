package dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.ThongBaoKhoaHoc;
import pojo.ThongBaoKhoaHocId;
import utils.ConnectionFactory;
import utils.DateFormat;

public class ThongBaoDAO {
	@SuppressWarnings("unchecked")
	public List<ThongBaoKhoaHoc> getAll(int khoaHoc) {
		List<ThongBaoKhoaHoc> lst = new ArrayList<ThongBaoKhoaHoc>();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			Query query = sess
					.createQuery("from ThongBaoKhoaHoc where IdKhoaHoc=:khoaHoc order by thoiGian desc");
			query.setString("khoaHoc", Integer.toString(khoaHoc));
			lst = query.list();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lst;
	}

	public boolean add(int khoaHoc, String noiDung) {
		ThongBaoKhoaHocId tbId = new ThongBaoKhoaHocId(khoaHoc, new Date());
		System.out.println(khoaHoc);
		ThongBaoKhoaHoc tb = new ThongBaoKhoaHoc();
		tb.setId(tbId);
		tb.setNoiDung(noiDung);

		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			sess.save(tb);
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sess.getTransaction().rollback();
			return false;
		}

		return true;
	}

	public boolean remove(int khoaHoc, String thoiGian) {
		ThongBaoKhoaHocId tbId = new ThongBaoKhoaHocId(khoaHoc,
				new DateFormat().getDate(thoiGian, new DateFormat().FORMAT_5));
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			ThongBaoKhoaHoc tb = (ThongBaoKhoaHoc) sess.get(
					ThongBaoKhoaHoc.class, tbId);

			if (tb != null) {
				sess.delete(tb);
			}

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
