package utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptPassword {

	public static String md5(String pwd) {
		String encrypt = pwd;
		try {
			byte[] bytePwd = pwd.getBytes("UTF-8");

			MessageDigest dig = MessageDigest.getInstance("md5");
			byte[] byteEncrypted = dig.digest(bytePwd);

			encrypt = new String(byteEncrypted, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return encrypt;
	}
}
