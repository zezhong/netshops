package ser;

import impl.UserImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import proj.User;

public class UserSer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserSer() {
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
		System.out.println("entry");
		UserImpl userimpl = new UserImpl();
		request.setCharacterEncoding("utf-8");			
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String status = request.getParameter("status");
		if(status.equals("registe")){
			userimpl.registe(userId, name, password, gender,phone);
		}
		if(status.equals("entry")){
			boolean entry = userimpl.queryUser(userId,password);
			if(entry==true){
				HttpSession session = request.getSession();
				User user = new User();
				user.setUserId(userId);
				session.setAttribute("user",user);
				
				//如果把数据从Ser传递到视图页面中
				request.setAttribute("user", session);
				
				//页面之间跳转 ser-->jsp :此跳转是内部跳转不能跳转到工程外的页面
				RequestDispatcher dispatcher=request.getRequestDispatcher("/index.jsp");
			    dispatcher.forward(request, response);
				
			}
			else{
				response.sendRedirect("entry.jsp");
			}
		}
		if(status.equals("update")){
			userimpl.update(name,password,phone,userId);
			response.sendRedirect("index2.jsp");
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
