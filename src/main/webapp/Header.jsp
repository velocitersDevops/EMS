<%@page import="com.velociter.ems.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<jsp:scriptlet>
    String firstName=(String)session.getAttribute("firstName");
 

   if(firstName==null)
   {
	   response.sendRedirect("Login.jsp");
   } 
   
    
</jsp:scriptlet>

  <link href="exstyle/style.css" rel="stylesheet">
  
<title>Header Page</title>
</head>

<body>
<div>
<table style= "background-color:black" >
<tr>
<td width="20%"><img src="exstyle/Images/logo.jfif" style="width=150px"></td>
<td width="80%"><h1 align="center"><font size="7" color="red" face="Castellar">EMPLOYEE MANAGMENT</font></h1></td>
<td width="20%" align="right"><a  href="LogoutServlet" ><font size="5" color="white">Logout</font></a></td>
</tr>
</table>
</div>
</body>
</html>