package dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.HighScoreModel;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.DangKyKhoaHoc;
import pojo.DangKyKhoaHocId;
import pojo.DangKyThi;
import pojo.DangKyThiId;
import pojo.KyThi;
import utils.ConnectionFactory;

public class KyThiDAO {

	@SuppressWarnings("unchecked")
	public List<KyThi> getAll() {
		List<KyThi> lst = new ArrayList<KyThi>();

		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		sess.getTransaction().begin();
		lst = sess.createCriteria(KyThi.class).list();
		sess.getTransaction().commit();

		return lst;
	}

	public List<KyThi> getStarted() {
		List<KyThi> lst = new ArrayList<KyThi>();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			Query query = sess
					.createQuery("from KyThi where thoiGianThi < :date");
			query.setParameter("date", new Date());
			lst = query.setMaxResults(5).list();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lst;
	}

	public DangKyThi getDangKy(DangKyThiId id) {
		DangKyThi dk = null;
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();
		try {
			sess.getTransaction().begin();
			dk = (DangKyThi) sess.get(DangKyThi.class, id);
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dk;
	}

	public boolean addDangKy(DangKyThiId id) {
		DangKyThi dk = new DangKyThi();
		dk.setId(id);
		dk.setDaDangKy(0);
		boolean success = false;

		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			sess.save(dk);
			sess.getTransaction().commit();
			success = true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sess.getTransaction().rollback();
		}

		return success;
	}

	@SuppressWarnings("unchecked")
	public List<DangKyThi> getUnReg() {
		List<DangKyThi> lst = new ArrayList<DangKyThi>();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			Query query = sess.createQuery("from DangKyThi where daDangKy=0");
			lst = query.list();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lst;
	}

	public List<DangKyThi> getReg(int idKyThi) {
		List<DangKyThi> lst = new ArrayList<DangKyThi>();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			Query query = sess
					.createQuery("from DangKyThi where daDangKy=1 and kyThi=:idKyThi");
			query.setString("idKyThi", Integer.toString(idKyThi));
			lst = query.list();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lst;
	}

	public List<HighScoreModel> getHighScore(List<KyThi> lstKt) {
		List<HighScoreModel> lstScore = new ArrayList<HighScoreModel>();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		sess.getTransaction().begin();
		for (KyThi kt : lstKt) {
			Query query = sess
					.createQuery("from DangKyThi where idKyThi=:idKt order by diem desc");
			DangKyThi dkT = (DangKyThi) query.uniqueResult();
			HighScoreModel hs = new HighScoreModel();
			hs.setTenKyThi(kt.getTen());
			hs.setHoTen(dkT.getHocVien().getHoTen());
			hs.setIdHocVien(dkT.getHocVien().getId());
			hs.setDiem(dkT.getDiem().toString());

			lstScore.add(hs);
		}

		return lstScore;
	}

	public boolean register(DangKyThiId dkId) {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			DangKyThi dk = (DangKyThi) sess.load(DangKyThi.class, dkId);
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

	public boolean updateScore(DangKyThiId id, double diem) {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			DangKyThi dk = (DangKyThi) sess.get(DangKyThi.class, id);

			if (dk != null) {
				dk.setDiem(diem);
				sess.save(dk);
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
