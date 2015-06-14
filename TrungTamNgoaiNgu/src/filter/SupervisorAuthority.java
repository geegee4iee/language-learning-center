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
@WebFilter(filterName = "StaffAuthority", urlPatterns = { "/bangiamdoc/*" })
public class SupervisorAuthority implements Filter {

	/**
	 * Default constructor.
	 */
	public SupervisorAuthority() {
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
		HttpServletResponse rs = (HttpServletResponse) response;
		HttpSession session = rq.getSession();

		if (session.getAttribute("accStaff") == null) {
			rs.sendRedirect(rq.getContextPath() + "/tknhanvien/dangnhap");
			/*String id = CookieHelper.getCookie("accStaff", rq);
			System.out.println(id);

			if (id != null) {
				SessionUserModel user = new TaiKhoanBUS().getSession(id);
				session.setAttribute("accStaff", user);

				if (user.getPermission() != 3) {
					rs.sendRedirect(rq.getContextPath() + "/home/khongco");
				}
			} else {
				rs.sendRedirect(rq.getContextPath() + "/tknhanvien/dangnhap");
			}*/
		} else {
			SessionUserModel user = (SessionUserModel) session
					.getAttribute("accStaff");

			if (user.getPermission() != 3) {
				rs.sendRedirect(rq.getContextPath() + "/home/khongco");
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
