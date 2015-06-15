package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import model.ChuDeManagerModel;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.ChuDe;
import pojo.KhoaHoc;
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

	public ChuDeManagerModel get(int idChuyenDe) {
		ChuDeManagerModel model = new ChuDeManagerModel();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			ChuDe cd = (ChuDe) sess.get(ChuDe.class, idChuyenDe);
			model.setId(cd.getId());
			model.setTen(cd.getTen());
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return model;
	}

	public boolean add(ChuDeManagerModel model) {
		ChuDe cd = new ChuDe();
		cd.setTen(model.getTen());
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			sess.save(cd);
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sess.getTransaction().rollback();

			return false;
		}

		return true;
	}

	public boolean update(ChuDeManagerModel model) {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			ChuDe cd = (ChuDe) sess.load(ChuDe.class, model.getId());
			cd.setTen(model.getTen());
			sess.update(cd);
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sess.getTransaction().rollback();

			return false;
		}

		return true;
	}

	public boolean remove(int idChuyenDe) {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		sess.getTransaction().begin();
		ChuDe cd = (ChuDe) sess.get(ChuDe.class, idChuyenDe);
		if (cd.getNhanVien() == null) {
			Set<KhoaHoc> lstKh = cd.getKhoaHocs();
			ChuDeDAO dao = new ChuDeDAO();
			for (KhoaHoc kh : lstKh) {
				dao.remove(kh.getId());
			}

			sess.delete(cd);
			sess.getTransaction().commit();
		} else {
			sess.getTransaction().commit();
			return false;
		}

		return true;
	}
}
