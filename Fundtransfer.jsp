<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body>
<h1>FUND TRANSFERING</h1>

 <%
 
 int racno =Integer.parseInt(request.getParameter("racno"));
 if(racno<=9999 )
 {
 	response.sendRedirect("Abs.jsp");
 	//RequestDispatcher req = request.getRequestDispatcher("Loginpage.jsp");
 	//req.include(request, response);
 }
 else
 {
 	
 boolean status=false;
 String dbUrl = "jdbc:mysql://localhost:3306/demo";
 String user = "client";		
 String pass = "client";
 Class.forName("com.mysql.jdbc.Driver");

 Connection myConn = DriverManager.getConnection(dbUrl, user, pass);


 	
 	PreparedStatement ps=myConn.prepareStatement("Select accountno from accountsecure where accountno = ?");

 	ps.setInt(1,racno);
 	
 	
 	ResultSet rs=ps.executeQuery();
 	status=rs.next();
 	
 	


 if(status)
 {
	 
 int bal;

	 session = request.getSession();
	 String accountno =(String) session.getAttribute("accountno");
	 
	 


	 Statement myStmt = myConn.createStatement();


	 ResultSet myRs = myStmt.executeQuery("select * from accountbalance where accountno ="+accountno);


	  myRs.next();
	  bal = myRs.getInt("balance");
	  
	  if(bal>=1000)
	  {
		  int a=1000;
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
		 response.sendRedirect("Transactiondetails.jsp");
 	
 	//RequestDispatcher req = request.getRequestDispatcher("Abs.jsp");
 	//req.forward(request, response);
 }
 else
 {
 	response.sendRedirect("Abs.jsp");
 }
 }
 }
 
 
%>
 


</body>
</html>