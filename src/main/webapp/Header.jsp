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
      
      <div  class="header">
      <div class="headerImage"><img src="exstyle/Images/CompaneyLogo.png" class="headerImage" >
      <p style="text-align:center;padding-left:400px;float:left;font-size:30px">Employee Management System </p>
      
      </div>
      <a  href="LogoutServlet" style="float:right;padding-right:35px;padding-top:30px;text-decoration:none">Logout</a>
 </div>
</body>
</html>