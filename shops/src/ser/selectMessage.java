package ser;

import impl.adminDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import proj.message;

public class selectMessage extends HttpServlet {

	
	public void destroy() {
		
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		adminDao admindao=new adminDao();
		List< message> list = null;

	
			try {
				list=admindao.selectMessage();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(list.size());
	
	
		HttpSession session=request.getSession();
		session.setAttribute("messageList", list);
			
		request.getRequestDispatcher("/showMessage.jsp").forward(request, response);
	}

	
	public void init() throws ServletException {
	
	}

}
