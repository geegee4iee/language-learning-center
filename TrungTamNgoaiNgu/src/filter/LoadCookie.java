package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SessionUserModel;
import utils.CookieHelper;
import bus.TaiKhoanBUS;

/**
 * Servlet Filter implementation class StaffAuthority
 */
@WebFilter(filterName = "StaffAuthority", urlPatterns = { "/*" })
public class LoadCookie implements Filter {

	/**
	 * Default constructor.
	 */
	public LoadCookie() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest rq = (HttpServletRequest) request;
		HttpSession session = rq.getSession();

		if (session.getAttribute("accStaff") == null) {
			String id = CookieHelper.getCookie("accStaff", rq);

			if (id != null) {
				SessionUserModel user = new TaiKhoanBUS().getSession(id);
				session.setAttribute("accStaff", user);
			}
		}
		
		if(session.getAttribute("acc") == null){
			String id = CookieHelper.getCookie("acc", rq);

			if (id != null) {
				SessionUserModel user = new TaiKhoanBUS().getSession(id);
				session.setAttribute("acc", user);
			}
		}

		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
