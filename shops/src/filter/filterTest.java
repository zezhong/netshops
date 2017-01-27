/*package filter;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class filterTest implements Filter {
	private FilterConfig config;

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub

		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		HttpSession session = request.getSession();
		
		String uri=request.getRequestURI();
		if(uri.contains("adminlogin.jsp") )
			arg2.doFilter(arg0, arg1);
		else{
			response.sendRedirect(request.getContextPath()+"/adminlogin.jsp");
			
		}
		
		
					
		
		}
		
	
		


	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}


}*/
