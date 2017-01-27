package ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import proj.admin;

import sun.security.pkcs11.Secmod.DbMode;

import com.mysql.jdbc.Connection;

import db.DBConn;
import impl.adminDao; 

public class adminServlet extends HttpServlet {


	public adminServlet() {
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
		String adminId =(String)request.getParameter("adminId");
		String adminPassword =(String)request.getParameter("adminPassword");
		request.getAttribute("");
		
		//System.out.println(adminId);
		//System.out.println(adminPassword);
		
	
		
		adminDao admindao=new adminDao();
		List<admin> list = null;
		
		
		try {
			list = admindao.query();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		for(int i=0;i<list.size();i++)
		{
			admin ad=list.get(i);
			
			String adminId1=ad.getAdminID();
			String adminPassword1=ad.getPassword();
			
			
			if(adminId1.equals(adminId) && adminPassword1.equals(adminPassword))
			{
				
				request.getRequestDispatcher("/adminMaintain.jsp").forward(request,response);
				
			}
			else
			response.sendRedirect(request.getContextPath()+"/adminlogin.jsp");
			
		}
			

	}


	public void init() throws ServletException {
	
	}

}
