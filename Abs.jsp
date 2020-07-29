<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ACCOUNT BALANCE SHEET</title>
</head>
<body>
<h1>ACCOUNT BALANCE SHEET</h1>

<%

if( session.getAttribute("accountno") == null)
{
	response.sendRedirect("Loginpage.jsp");
}
String accountno = (String) session.getAttribute("accountno");


out.println("ACCOUNT NO "+accountno);
String dbUrl = "jdbc:mysql://localhost:3306/demo";
String user = "client";		
String pass = "client";
Class.forName("com.mysql.jdbc.Driver");

Connection myConn = DriverManager.getConnection(dbUrl, user, pass);


Statement myStmt = myConn.createStatement();


ResultSet myRs = myStmt.executeQuery("select balance from accountbalance where accountno ="+accountno);


if (myRs.next()) {
	
out.println(myRs.getString("balance") );
}

%>
<form action="Fundtransfer.jsp" method="post">
   ENTER THE RECEIVER ACCOUNT NO <input type="text" name="racno" />
        <input type="submit" value="FUND TRANSFER" />
</form>
<form action="Transactiondetails.jsp" method="post">
   
        <input type="submit" value="TRANSACTIONS" />
</form>
<form action="Lout.jsp" method="post">
   
        <input type="submit" value="LOGOUT" />
        
</form>


</body>
</html>
