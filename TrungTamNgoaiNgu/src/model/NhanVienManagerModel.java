package model;

import java.math.BigDecimal;

public class NhanVienManagerModel {
	private int id;
	private int vaiTro;
	private String taiKhoan;
	private String hoTen;
	private String diaChi;
	private String soDienThoai;
	private BigDecimal luong;
	private String ngaySinh;
	private String gioiTinh;
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
	 * @return the vaiTro
	 */
	public int getVaiTro() {
		return vaiTro;
	}
	/**
	 * @param vaiTro the vaiTro to set
	 */
	public void setVaiTro(int vaiTro) {
		this.vaiTro = vaiTro;
	}
	/**
	 * @return the taiKhoan
	 */
	public String getTaiKhoan() {
		return taiKhoan;
	}
	/**
	 * @param taiKhoan the taiKhoan to set
	 */
	public void setTaiKhoan(String taiKhoan) {
		this.taiKhoan = taiKhoan;
	}
	/**
	 * @return the hoTen
	 */
	public String getHoTen() {
		return hoTen;
	}
	/**
	 * @param hoTen the hoTen to set
	 */
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	/**
	 * @return the diaChi
	 */
	public String getDiaChi() {
		return diaChi;
	}
	/**
	 * @param diaChi the diaChi to set
	 */
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	/**
	 * @return the soDienThoai
	 */
	public String getSoDienThoai() {
		return soDienThoai;
	}
	/**
	 * @param soDienThoai the soDienThoai to set
	 */
	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}
	/**
	 * @return the luong
	 */
	public BigDecimal getLuong() {
		return luong;
	}
	/**
	 * @param luong the luong to set
	 */
	public void setLuong(BigDecimal luong) {
		this.luong = luong;
	}
	/**
	 * @return the ngaySinh
	 */
	public String getNgaySinh() {
		return ngaySinh;
	}
	/**
	 * @param ngaySinh the ngaySinh to set
	 */
	public void setNgaySinh(String ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	/**
	 * @return the gioiTinh
	 */
	public String getGioiTinh() {
		return gioiTinh;
	}
	/**
	 * @param gioiTinh the gioiTinh to set
	 */
	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
}
