package ser;

import impl.ProductImpl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import proj.Product;
import proj.User;

public class ProductSer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ProductSer() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductImpl productimpl= new ProductImpl();
		request.setCharacterEncoding("utf-8");			
		String userId = request.getParameter("userId");
		String status = request.getParameter("status");
		String productId = request.getParameter("productId");
		String productPrice = request.getParameter("productPrice");
		String buyqty =request.getParameter("buyqty"); 
		String orderId =request.getParameter("OrderId");
//		String productName = request.getParameter(productName);
		
		String productName1 = request.getParameter("productName");
		if(status.equals("search1")){
			System.out.println(productName1+"+++++++");
			ArrayList<Product> products = productimpl.search(productName1);
			//如果把数据从Ser传递到视图页面中
			System.out.println(products.size());
			request.setAttribute("products", products);
			//页面之间跳转 ser-->jsp :此跳转是内部跳转不能跳转到工程外的页面
			RequestDispatcher dispatcher=request.getRequestDispatcher("/result.jsp");
			dispatcher.forward(request, response);
		}
		if(status.equals("search")){
			String productName=new String(request.getParameter("productName").getBytes("ISO-8859-1"),"utf-8");
			ArrayList<Product> products = productimpl.search(productName);
			//如果把数据从Ser传递到视图页面中
			System.out.println(products.size());
			request.setAttribute("products", products);
			//页面之间跳转 ser-->jsp :此跳转是内部跳转不能跳转到工程外的页面
			RequestDispatcher dispatcher=request.getRequestDispatcher("/result.jsp");
			dispatcher.forward(request, response);
		}
		if(status.equals("deleteOrder")){
			productimpl.deleteOrder(orderId);
			response.sendRedirect("goodsList.jsp");
		}
		if(status.equals("purchase")){
			if(userId.equals("null")){
				response.sendRedirect("entry.jsp");
			}else{
				String orderId2= productimpl.purchase(userId,productId,productPrice);
				productimpl.update(buyqty,orderId2);
				User user = new User();
				user.setUserId(userId);
//				//session.setAttribute(userId,user);
//				//如果把数据从Ser传递到视图页面中
				  request.setAttribute("user", user);
//				//页面之间跳转 ser-->jsp :此跳转是内部跳转不能跳转到工程外的页面
				RequestDispatcher dispatcher=request.getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
				
			}
			
		}
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
