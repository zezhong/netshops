package ser;

import impl.adminDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class adminDeleteOrders extends HttpServlet {


	public adminDeleteOrders() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		

		request.setCharacterEncoding("utf-8");
		String orderId=request.getParameter("orderId");
		adminDao admindao=new adminDao();
	
			try {
				admindao.deleteOrders(orderId);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("成功执行删除订单的功能");
	
			response.sendRedirect(request.getContextPath()+"/adminShowOrders.jsp");
	}


	public void init() throws ServletException {
	}

}
