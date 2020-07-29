<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
if(username.isEmpty() || password.isEmpty() )
{
	response.sendRedirect("Loginpage.jsp");
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


	//PreparedStatement ps=con.prepareStatement("Select * from MAILCASTINGUSER where EMAILADD = ? and PASSWORD =?");
	PreparedStatement ps=myConn.prepareStatement("Select accountno from accountsecure where username = ? and password =?");

	ps.setString(1,username);
	ps.setString(2,password);
	
	ResultSet rs=ps.executeQuery();
	status=rs.next();
	
	


if(status)
{
	String accountno =rs.getString("accountno");
	
	session.setAttribute("accountno",accountno);
	response.sendRedirect("Abs.jsp");
	
	//RequestDispatcher req = request.getRequestDispatcher("Abs.jsp");
	//req.forward(request, response);
}
else
{
	response.sendRedirect("Loginpage.jsp");
}
}

%>

</body>
</html>
