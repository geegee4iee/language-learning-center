package bus;

import pojo.HocVien;
import dao.HocVienDAO;

public class HocVienBUS {
	
	public HocVien getHocVien(String taikhoan){
		HocVien hv = new HocVienDAO().getHocVien(taikhoan);
		
		return hv;
	}
}
