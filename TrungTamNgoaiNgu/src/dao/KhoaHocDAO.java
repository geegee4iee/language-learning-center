package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import model.KhoaHocManagerModel;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.loader.plan.exec.query.spi.QueryBuildingParameters;

import pojo.ChuDe;
import pojo.DangKyKhoaHoc;
import pojo.KhoaHoc;
import pojo.LichHoc;
import pojo.NhanVien;
import pojo.ThongBaoKhoaHoc;
import utils.ConnectionFactory;
import utils.DateFormat;

public class KhoaHocDAO {
	@SuppressWarnings("unchecked")
	public List<KhoaHoc> getAll() {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();
		List<KhoaHoc> kh = new ArrayList<KhoaHoc>();

		try {
			sess.getTransaction().begin();
			kh = sess.createCriteria(KhoaHoc.class).list();
			sess.getTransaction().commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			sess.getTransaction().rollback();
			e.printStackTrace();
		}

		return kh;
	}

	@SuppressWarnings("unchecked")
	public List<KhoaHoc> getAll(int chudeId) {
		List<KhoaHoc> lst = new ArrayList<KhoaHoc>();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();
		ChuDe cd = new ChuDe();
		cd.setId(chudeId);

		try {
			sess.getTransaction().begin();
			Query query = sess.createQuery("from KhoaHoc where chuDe=:cd");
			query.setParameter("cd", cd);
			lst = query.list();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lst;
	}

	public KhoaHoc getById(int id) {
		KhoaHoc kh = null;
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			kh = (KhoaHoc) sess.get(KhoaHoc.class, id);
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return kh;
	}

	public boolean update(KhoaHocManagerModel model) {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();
		KhoaHoc kh = new KhoaHoc();

		try {
			sess.getTransaction().begin();
			kh = (KhoaHoc) sess.load(KhoaHoc.class, model.getId());
			sess.getTransaction().commit();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		kh.setNgayBatDau(new DateFormat().getDate(model.getNgayBatDau()));
		kh.setNgayKetThuc(new DateFormat().getDate(model.getNgayKetThuc()));
		kh.setId(model.getId());
		kh.setTen(model.getTen());
		kh.setKhoa(model.getKhoa());

		try {
			sess.getTransaction().begin();
			sess.update(kh);
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sess.getTransaction().rollback();

			return false;
		}

		return true;
	}

	public boolean add(KhoaHocManagerModel khM) {
		KhoaHoc kh = new KhoaHoc();
		ChuDe cd = new ChuDe();
		kh.setTen(khM.getTen());
		kh.setNgayBatDau(new DateFormat().getDate(khM.getNgayBatDau()));
		kh.setNgayKetThuc(new DateFormat().getDate(khM.getNgayKetThuc()));
		kh.setKhoa(khM.getKhoa());

		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			cd = (ChuDe) sess.load(ChuDe.class, khM.getChuDe());
			kh.setChuDe(cd);

			sess.save(kh);
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sess.getTransaction().rollback();
			return false;
		}

		return true;
	}

	@SuppressWarnings("unchecked")
	public List<KhoaHoc> getRegByHocVien(int idHocVien) {
		List<KhoaHoc> lstKh = new ArrayList<KhoaHoc>();
		List<DangKyKhoaHoc> lstDk = new ArrayList<DangKyKhoaHoc>();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			Query query = sess
					.createQuery("from DangKyKhoaHoc where idHocVien=:idHocVien and daDangKy=1");
			query.setInteger("idHocVien", idHocVien);
			lstDk = query.list();
			for (DangKyKhoaHoc dk : lstDk) {
				lstKh.add(dk.getKhoaHoc());
			}
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lstKh;
	}

	public List<KhoaHoc> get(String content) {
		List<KhoaHoc> lstKh = new ArrayList<KhoaHoc>();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			Query query = sess
					.createQuery("from KhoaHoc where ten like :content");
			query.setString("content",'%' + content.toLowerCase() + '%');
			lstKh = query.list();
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lstKh;
	}

	public boolean remove(int idKhoaHoc) {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			KhoaHoc kh = (KhoaHoc) sess.get(KhoaHoc.class, idKhoaHoc);
			Set<DangKyKhoaHoc> lstDk = kh.getDangKyKhoaHocs();
			Set<LichHoc> lstLh = kh.getLichHocs();
			Set<ThongBaoKhoaHoc> lstTb = kh.getThongBaoKhoaHocs();

			for (DangKyKhoaHoc dk : lstDk) {
				sess.delete(dk);
			}

			for (LichHoc lh : lstLh) {
				sess.delete(lh);
			}

			for (ThongBaoKhoaHoc tb : lstTb) {
				sess.delete(tb);
			}

			sess.delete(kh);
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
