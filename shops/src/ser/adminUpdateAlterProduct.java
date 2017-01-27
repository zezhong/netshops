package ser;

import impl.adminDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import proj.Product;

public class adminUpdateAlterProduct extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public adminUpdateAlterProduct() {
		super();
	}

	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Product product=new Product();
		
		product.setProductId(request.getParameter("productId"));
		product.setCataId(Integer.valueOf(request.getParameter("cataId")));
		product.setProductName(request.getParameter("productName"));
		product.setCostPrice(Double.valueOf(request.getParameter("costPrice")));
		product.setMarketPrice(Double.valueOf(request.getParameter("marketPrice")));
		product.setQty(Integer.valueOf(request.getParameter("qty")));
		product.setDecribe(request.getParameter("decribe"));
		

		
		adminDao admindao=new adminDao();
		try {
			admindao.updateAlterProduct(product);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//response.sendRedirect(request.getContextPath()+"/adminShowProduct.jsp");
		request.getRequestDispatcher("/adminShowProduct.jsp").forward(request,response);
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
