package pojo;

// Generated Jun 3, 2015 6:16:54 PM by Hibernate Tools 3.4.0.CR1

import java.io.Serializable;
import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * ThongBaoKhoaHoc generated by hbm2java
 */
@Entity
@Table(name = "ThongBaoKhoaHoc")
public class ThongBaoKhoaHoc implements java.io.Serializable {

	private ThongBaoKhoaHocId id;
	private KhoaHoc khoaHoc;
	private Serializable noiDung;

	public ThongBaoKhoaHoc() {
	}

	public ThongBaoKhoaHoc(ThongBaoKhoaHocId id, KhoaHoc khoaHoc) {
		this.id = id;
		this.khoaHoc = khoaHoc;
	}

	public ThongBaoKhoaHoc(ThongBaoKhoaHocId id, KhoaHoc khoaHoc,
			Serializable noiDung) {
		this.id = id;
		this.khoaHoc = khoaHoc;
		this.noiDung = noiDung;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "idKhoaHoc", column = @Column(name = "IdKhoaHoc", nullable = false)),
			@AttributeOverride(name = "thoiGian", column = @Column(name = "ThoiGian", nullable = false, length = 23)) })
	public ThongBaoKhoaHocId getId() {
		return this.id;
	}

	public void setId(ThongBaoKhoaHocId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "IdKhoaHoc", nullable = false, insertable = false, updatable = false)
	public KhoaHoc getKhoaHoc() {
		return this.khoaHoc;
	}

	public void setKhoaHoc(KhoaHoc khoaHoc) {
		this.khoaHoc = khoaHoc;
	}

	@Column(name = "NoiDung")
	public Serializable getNoiDung() {
		return this.noiDung;
	}

	public void setNoiDung(Serializable noiDung) {
		this.noiDung = noiDung;
	}

}
