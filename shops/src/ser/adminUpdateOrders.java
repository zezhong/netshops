package ser;

import impl.adminDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import proj.Orders;

public class adminUpdateOrders extends HttpServlet {

	
	public adminUpdateOrders() {
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
		Orders order=new Orders();
		
		order.setOrderId(Integer.valueOf(request.getParameter("orderId")));
		order.setUserId(Integer.valueOf(request.getParameter("userId")));
		
		order.setOrderDate(request.getParameter("orderDate"));
		
	
	
		order.setTotalPrice(Integer.valueOf(request.getParameter("totalPrice")));
		
		adminDao admindao=new adminDao();
		try {
			admindao.updateOrders(order);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/adminShowOrders.jsp").forward(request,response);
	}

	
	public void init() throws ServletException {
		
	}

}
