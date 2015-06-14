package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieHelper {
	final static int maxAge = 30 * 24 * 60 * 60;

	public static void saveCookie(String cookieName, String value,
			HttpServletResponse respond) {
		Cookie cookie = new Cookie(cookieName, value);
		cookie.setMaxAge(maxAge);
		cookie.setPath("/TrungTamNgoaiNgu/");
		respond.addCookie(cookie);
	}

	public static void expireCookie(String cookieName,
			HttpServletResponse respond) {
		Cookie cookie = new Cookie("accStaff", "");
		cookie.setMaxAge(0);
		cookie.setPath("/TrungTamNgoaiNgu/");
		respond.addCookie(cookie);
	}

	public static String getCookie(String cookieName, HttpServletRequest request) {
		String value = null;
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			int length = cookies.length;
			for (int i = 0; i < length; i++) {

				if (cookies[i].getName().equals(cookieName) == true) {
					value = cookies[i].getValue();
					break;
				}
			}
		}

		return value;
	}
}
