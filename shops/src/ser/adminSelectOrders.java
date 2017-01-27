package ser;

import impl.adminDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import proj.Orders;
import proj.Product;

public class adminSelectOrders extends HttpServlet {

	
	public adminSelectOrders() {
		super();
	}

	
	public void destroy() {
		super.destroy();
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		request.setCharacterEncoding("utf-8");
		adminDao admindao=new adminDao();
		List< Orders> list = null;

		try {
			list=admindao.selectOrder();
		//	System.out.println(list.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("servlet÷¥––≥…π¶");
		
		HttpSession session=request.getSession();
		session.setAttribute("OrdersList", list);
			
		request.getRequestDispatcher("/adminShowOrders.jsp").forward(request,response);
		
	}

	
	public void init() throws ServletException {
		
	}

}
