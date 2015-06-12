package dao;

import java.util.ArrayList;
import java.util.List;

import model.LichHocManagerModel;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.LichHoc;
import pojo.LichHocId;
import utils.ConnectionFactory;
import utils.DateFormat;

public class LichHocDAO {

	@SuppressWarnings("unchecked")
	public List<LichHoc> getAll(int idKhoaHoc) {
		List<LichHoc> lst = new ArrayList<LichHoc>();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			Query query = sess
					.createQuery("from LichHoc where IdKhoaHoc=:idKhoaHoc");
			query.setString("idKhoaHoc", Integer.toString(idKhoaHoc));
			lst = query.list();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lst;
	}

	public LichHoc get(LichHocId id) {
		LichHoc lh = null;
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			lh = (LichHoc) sess.get(LichHoc.class, id);
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sess.close();
		}

		sess.close();
		return lh;
	}

	public boolean remove(LichHocId lhId) {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			LichHoc lh = (LichHoc) sess.get(LichHoc.class, lhId);
			sess.delete(lh);
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sess.getTransaction().rollback();
			return false;
		}

		return true;
	}

	public boolean update(LichHocManagerModel lhM) {
		LichHoc lh = get(new LichHocId(lhM.getKhoaHoc(), lhM.getBuoiHoc()));
		lh.setPhongHoc(lhM.getPhongHoc());
		lh.setThoiGianHoc(new DateFormat().getDateTime(lhM.getThoiGianHoc()));

		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			sess.update(lh);
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sess.getTransaction().rollback();
			return false;
		}

		return true;
	}

	public boolean add(LichHocManagerModel lhM) {
		boolean success = true;
		LichHoc lh = new LichHoc();
		lh.setThoiGianHoc(new DateFormat().getDateTime(lhM.getThoiGianHoc()));
		LichHocId lhId = new LichHocId();

		lhId.setBuoiHoc(lhM.getBuoiHoc());
		lhId.setIdKhoaHoc(lhM.getKhoaHoc());
		lh.setPhongHoc(lhM.getPhongHoc());
		lh.setId(lhId);

		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			LichHoc lhTemp = (LichHoc) sess.get(LichHoc.class, lhId);

			if (lhTemp == null) {
				sess.save(lh);
			} else {
				success = false;
			}

			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sess.getTransaction().rollback();
			return false;
		}

		return success;
	}
}
