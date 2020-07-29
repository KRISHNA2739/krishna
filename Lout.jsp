<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>	LOGOUT PAGE</title>
</head>
<body>
<%

session.removeAttribute("accountno");
session.invalidate();
response.sendRedirect("Loginpage.jsp");

%>

</body>
</html>
