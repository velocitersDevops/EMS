<%@page import="com.velociter.ems.model.Employee"%>
<jsp:scriptlet>

 String firstName =(String)session.getAttribute("firstName");

   if(firstName==null)
   {
	   response.sendRedirect("Login.jsp");
   }
</jsp:scriptlet>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Page</title>
<link href="exstyle/style.css" rel="stylesheet">


</head>
<body>




      
     <jsp:include page="Header.jsp"></jsp:include>
     
    
 <div class="navbar">
 <h3>Welcome :<jsp:expression>firstName</jsp:expression></h3>
 </div>
 
 <div class="content">
     <div class="section1" >
     
     </div>
     
       <div class="section2">
       <br><br><br><br>
       <a href="EmployeeList.jsp" style="padding-left:300px">Click here to view List of Employee</a>
       </div>
 </div>
 
 
 <jsp:include page="Footer.jsp"></jsp:include>

      
      
</body>
</html>