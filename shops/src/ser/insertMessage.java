package ser;

import impl.adminDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import proj.Orders;
import proj.User;
import proj.message;

public class insertMessage extends HttpServlet {

	
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
		message message1=new message();
		
		message1.setTitle(request.getParameter("title"));
		message1.setContent(request.getParameter("content"));
		 Date date=new Date();
		 SimpleDateFormat sdf =new SimpleDateFormat();
		 
		 
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		String userId=user.getUserId();
		
		
		System.out.println( "µÇÂ¼µÄIDÊÇ£º"+userId);
		
		
		message1.setUserId(userId);
		 
		String date1=sdf.format(date);
		message1.setTime(date1);
		
	
	
		
		
		adminDao admindao=new adminDao();
	
			try {
				admindao.insertMessage(message1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	
		request.getRequestDispatcher("/index.jsp").forward(request,response);
		
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
