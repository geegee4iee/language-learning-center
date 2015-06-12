package pojo;

// Generated Jun 3, 2015 6:16:54 PM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * TaiKhoan generated by hbm2java
 */
@Entity
@Table(name = "TaiKhoan")
public class TaiKhoan implements java.io.Serializable {

	private String id;
	private QuyenHan quyenHan;
	private String matKhau;
	private Date lastLogin;
	private Set nhanViens = new HashSet(0);
	private Set hocViens = new HashSet(0);

	public TaiKhoan() {
	}

	public TaiKhoan(String id, QuyenHan quyenHan, String matKhau) {
		this.id = id;
		this.quyenHan = quyenHan;
		this.matKhau = matKhau;
	}

	public TaiKhoan(String id, QuyenHan quyenHan, String matKhau,
			Date lastLogin, Set nhanViens, Set hocViens) {
		this.id = id;
		this.quyenHan = quyenHan;
		this.matKhau = matKhau;
		this.lastLogin = lastLogin;
		this.nhanViens = nhanViens;
		this.hocViens = hocViens;
	}

	@Id
	@Column(name = "Id", unique = true, nullable = false, length = 50)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "QuyenHan", nullable = false)
	public QuyenHan getQuyenHan() {
		return this.quyenHan;
	}

	public void setQuyenHan(QuyenHan quyenHan) {
		this.quyenHan = quyenHan;
	}

	@Column(name = "MatKhau", nullable = false)
	public String getMatKhau() {
		return this.matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "LastLogin", length = 23)
	public Date getLastLogin() {
		return this.lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "taiKhoan")
	public Set getNhanViens() {
		return this.nhanViens;
	}

	public void setNhanViens(Set nhanViens) {
		this.nhanViens = nhanViens;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "taiKhoan")
	public Set getHocViens() {
		return this.hocViens;
	}

	public void setHocViens(Set hocViens) {
		this.hocViens = hocViens;
	}

}
