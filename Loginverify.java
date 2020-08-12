package krishna;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 

public class Loginverify extends HttpServlet {
 
   
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session=request.getSession();
		Connection myConn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		if(username.isEmpty() || password.isEmpty() )
		{
			response.sendRedirect("Loginpage.jsp");
			
		}
		else
		{
			
		boolean status=false;
		String dbUrl = "jdbc:mysql://localhost:3306/demo";
		String user = "client";		
		String pass = "client";
	
			try {
				Class.forName("com.mysql.jdbc.Driver");
			
		 myConn = DriverManager.getConnection(dbUrl, user, pass);


			
			 ps=myConn.prepareStatement("Select accountno from accountsecure where username = ? and password =?");

			ps.setString(1,username);
			ps.setString(2,password);
			
			rs=ps.executeQuery();
			status=rs.next();
			}
			catch (Exception exc) {
				exc.printStackTrace();
			}
			
			
			
			
			


		if(status)
		{
			String accountno=null;
			try {
				accountno = rs.getString("accountno");
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			session.setAttribute("accountno",accountno);
			response.sendRedirect("Abs.jsp");
			
		}
		else
		{
			response.sendRedirect("Loginpage.jsp");
		}
		}

	}
 
}
