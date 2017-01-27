package ser;

import impl.adminDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class adminDeleteProduct extends HttpServlet {


	public adminDeleteProduct() {
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
		String productId=request.getParameter("productId");
		adminDao admindao=new adminDao();
	
			try {
				admindao.deleteProduct(productId);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	
			response.sendRedirect(request.getContextPath()+"/adminShowProduct.jsp");
	}

	
	public void init() throws ServletException {
		
	}

}
