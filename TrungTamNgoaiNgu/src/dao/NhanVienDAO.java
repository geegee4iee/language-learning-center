package dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import model.NhanVienManagerModel;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.NhanVien;
import pojo.VaiTro;
import utils.ConnectionFactory;
import utils.DateFormat;

public class NhanVienDAO {
	@SuppressWarnings("unchecked")
	public List<NhanVien> getAll() {
		List<NhanVien> lst = new ArrayList<NhanVien>();
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			lst = sess.createCriteria(NhanVien.class).list();
			sess.getTransaction().commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lst;
	}

	public NhanVien get(int idNhanVien) {
		NhanVien nv = null;
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			nv = (NhanVien) sess.get(NhanVien.class, idNhanVien);
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return nv;
	}

	public boolean add(NhanVienManagerModel nvM) {
		NhanVien nv = new NhanVien();
		nv.setHoTen(nvM.getHoTen());
		nv.setDiaChi(nvM.getDiaChi());
		nv.setNgaySinh(new DateFormat().getDate(nvM.getNgaySinh()));
		nv.setSoDienThoai(nvM.getSoDienThoai());
		nv.setVaiTro(new VaiTro(1, ""));
		nv.setGioiTinh(nvM.getGioiTinh());
		nv.setLuong(new BigDecimal(0));

		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			sess.save(nv);
			sess.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sess.getTransaction().rollback();
			return false;
		}

		return true;
	}

	public boolean updateSalary(int nhanVien, BigDecimal luong) {
		SessionFactory fac = ConnectionFactory.getSessionFactory();
		Session sess = fac.openSession();

		try {
			sess.getTransaction().begin();
			NhanVien nv = (NhanVien) sess.load(NhanVien.class, nhanVien);
			nv.setLuong(luong);
			sess.update(nv);
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
