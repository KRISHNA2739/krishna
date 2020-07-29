<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TRANSACTION DETAILS</title>
</head>
<body>
<h1>THE LAST FIVE TRANSACTION DETAILS</h1>
<%

session = request.getSession();
String accountno = (String) session.getAttribute("accountno");

out.println("ACCOUNT NO "+accountno);
out.write("<br>");
String dbUrl = "jdbc:mysql://localhost:3306/demo";
String user = "client";		
String pass = "client";
Class.forName("com.mysql.jdbc.Driver");

Connection myConn = DriverManager.getConnection(dbUrl, user, pass);


Statement myStmt = myConn.createStatement();


ResultSet myRs = myStmt.executeQuery("select * from transcations where accountno ="
+accountno+
" ORDER BY tid DESC LIMIT 5"
);


while (myRs.next()) {
	
out.println(myRs.getString("tid") + ", " + myRs.getString("accountno")+ ", " + myRs.getString("tacno")+ ", " + myRs.getString("amount")+ ", " + myRs.getString("td")+"\n");
out.write("<br>");

}



 myRs = myStmt.executeQuery("select * from accountbalance where accountno ="+accountno);


 myRs.next();
 out.println("ACCOUNT BALANCE IS "+myRs.getInt("balance"));
 

%>

</body>
</html>