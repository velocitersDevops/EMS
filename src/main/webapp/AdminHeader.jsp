<%@page import="com.velociter.ems.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<jsp:scriptlet>String username = (String) session.getAttribute("username");

if (username == null) {
	response.sendRedirect("adminPage.jsp");
}</jsp:scriptlet>

<link href="exstyle/style.css" rel="stylesheet">

<title></title>
</head>

<body style="font-family: Futara">

	<div class="header">
		<div class="headerImage">
			<img style="height: 180px; width: 180px;"
				src="exstyle/Images/logo.jfif">
		</div>

		<p
			style="text-align: center; padding-left: 300px; float: left; font-size: 30px; padding-top: 40px;">
			<font size="7" color="red" face="Castellar">Employee
				Management </font>
		</p>
		<a href="AdminWelcomePage.jsp"
			style="float: right; padding-right: 35px; padding-top: 140px; text-decoration: none; font-size: 20px; color: white;">Back</a>
		<a href="AdminLogoutServlet"
			style="float: right; padding-right: 35px; padding-top: 140px; text-decoration: none; font-size: 20px; color: white;">Logout</a>
		<a href="Welcome.jsp"
			style="float: right; padding-right: 35px; padding-top: 140px; text-decoration: none; font-size: 20px; color: white;">Home</a>

	</div>
</body>
</html>