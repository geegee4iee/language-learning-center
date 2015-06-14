package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptPassword {

	public static String md5(String pwd) {
		StringBuffer sb = new StringBuffer();
		try {
			byte[] bytePwd = pwd.getBytes();

			MessageDigest dig = MessageDigest.getInstance("md5");
			byte[] byteEncrypted = dig.digest(bytePwd);

			for (byte b : byteEncrypted) {
				sb.append(Integer.toHexString((int) (b & 0xff)));
			}
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return sb.toString();
	}
}
