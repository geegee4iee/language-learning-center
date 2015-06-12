package model;

import java.util.Date;

import pojo.KhoaHoc;
import utils.DateFormat;

public class KhoaHocManagerModel {
	
	public KhoaHocManagerModel(KhoaHoc kh){
		this.setTen(kh.getTen());
		this.setId(kh.getId());
		this.setKhoa(kh.getKhoa());
		this.setNgayBatDau(new DateFormat().formatDate(kh.getNgayBatDau().toString()));
		this.setNgayKetThuc(new DateFormat().formatDate(kh.getNgayKetThuc().toString()));
		this.chuDe = kh.getChuDe().getId();
	}
	
	public KhoaHocManagerModel(){}

	private int id;
	private String ten;
	private String ngayBatDau;
	private String ngayKetThuc;
	private int khoa;
	private int chuDe;
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	
	/**
	 * @return the ten
	 */
	public String getTen() {
		return ten;
	}
	/**
	 * @param ten the ten to set
	 */
	public void setTen(String ten) {
		this.ten = ten;
	}
	/**
	 * @return the ngayBatDau
	 */
	public String getNgayBatDau() {
		return ngayBatDau;
	}
	/**
	 * @param ngayBatDau the ngayBatDau to set
	 */
	public void setNgayBatDau(String ngayBatDau) {
		this.ngayBatDau = ngayBatDau;
	}
	/**
	 * @return the ngayKetThuc
	 */
	public String getNgayKetThuc() {
		return ngayKetThuc;
	}
	/**
	 * @param ngayKetThuc the ngayKetThuc to set
	 */
	public void setNgayKetThuc(String ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}
	/**
	 * @return the khoa
	 */
	public int getKhoa() {
		return khoa;
	}
	/**
	 * @param khoa the khoa to set
	 */
	public void setKhoa(int khoa) {
		this.khoa = khoa;
	}

	/**
	 * @return the chuDe
	 */
	public int getChuDe() {
		return chuDe;
	}

	/**
	 * @param chuDe the chuDe to set
	 */
	public void setChuDe(int chuDe) {
		this.chuDe = chuDe;
	}

	
}
