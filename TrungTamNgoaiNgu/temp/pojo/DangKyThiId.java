package pojo;

// Generated Jun 3, 2015 6:16:54 PM by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * DangKyThiId generated by hbm2java
 */
@Embeddable
public class DangKyThiId implements java.io.Serializable {

	private int idKyThi;
	private int idHocVien;

	public DangKyThiId() {
	}

	public DangKyThiId(int idKyThi, int idHocVien) {
		this.idKyThi = idKyThi;
		this.idHocVien = idHocVien;
	}

	@Column(name = "IdKyThi", nullable = false)
	public int getIdKyThi() {
		return this.idKyThi;
	}

	public void setIdKyThi(int idKyThi) {
		this.idKyThi = idKyThi;
	}

	@Column(name = "IdHocVien", nullable = false)
	public int getIdHocVien() {
		return this.idHocVien;
	}

	public void setIdHocVien(int idHocVien) {
		this.idHocVien = idHocVien;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof DangKyThiId))
			return false;
		DangKyThiId castOther = (DangKyThiId) other;

		return (this.getIdKyThi() == castOther.getIdKyThi())
				&& (this.getIdHocVien() == castOther.getIdHocVien());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getIdKyThi();
		result = 37 * result + this.getIdHocVien();
		return result;
	}

}
