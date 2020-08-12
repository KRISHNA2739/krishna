package krishna;
import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 

 
public class Fundtransfer extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Connection myConn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		 int racno =Integer.parseInt(request.getParameter("racno"));
		 if(racno<=9999 )
		 {
		 	response.sendRedirect("Abs.jsp");
		 	
		 }
		 else
		 {
		 	
		 boolean status=false;
		 
		 String dbUrl = "jdbc:mysql://localhost:3306/demo";
		 String user = "client";		
		 String pass = "client";
		try
		{
		 Class.forName("com.mysql.jdbc.Driver");

		  myConn = DriverManager.getConnection(dbUrl, user, pass);


		 	
		  ps=myConn.prepareStatement("Select accountno from accountsecure where accountno = ?");

		 	ps.setInt(1,racno);
		 	
		 	
		 	 rs=ps.executeQuery();
		 	status=rs.next();
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
		 	
		 	


		 if(status)
		 {
			 
		 int bal=0;

			 
			 String accountno =(String) session.getAttribute("accountno");
			 
			 

try {
			 Statement myStmt = myConn.createStatement();


			 ResultSet myRs = myStmt.executeQuery("select * from accountbalance where accountno ="+accountno);


			  myRs.next();
			  bal = myRs.getInt("balance");
}
catch (Exception exc) {
	exc.printStackTrace();
}
			  
			  if(bal>=1000)
			  {
				  int a=1000;
				  try
				  {
				  PreparedStatement es=myConn.prepareStatement("insert into transcations (accountno, tacno, amount,td) values (?,?,?,CURRENT_TIMESTAMP)");

					es.setString(1,accountno);
					es.setInt(2,racno);
					es.setInt(3,a);
					
				 es.executeUpdate();
				 es=myConn.prepareStatement("update accountbalance set balance= balance-? where accountno=?");

					es.setString(2,accountno);
					es.setInt(1,a);
					
				es.executeUpdate();
			 	
				es=myConn.prepareStatement("update accountbalance set balance= balance+? where accountno=?");

					
					es.setInt(2,racno);
					es.setInt(1,a);
					
				 es.executeUpdate();
				  
			  }
				catch (Exception exc) {
					exc.printStackTrace();
				}
				 response.sendRedirect("Transactiondetails.jsp");
		 	
		 	
		 }
		 else
		 {
		 	response.sendRedirect("Abs.jsp");
		 }
		 }
		 }
}

}