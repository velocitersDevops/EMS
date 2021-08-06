<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.velociter.ems.interfaces.EmployeeInterface"%>
    <%

   String firstName =(String)session.getAttribute(EmployeeInterface.FIRSTNAME);
   if(firstName==null)
   {
	   response.sendRedirect("Login.jsp");
   }
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Update Page</title>
</head>
 <jsp:include page="Header.jsp"></jsp:include>
<body align="center">
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expire", 0);
%>
<% int status=0;
 int statusdata =(Integer.parseInt(request.getParameter("status")));
 System.out.println("update status "+status); 
   if(statusdata ==1) 
 {%>  <br>
 	<h5 style='color: green; text-align:center;'>Records  Update SuccessFully !</h5>
 <%} else if(statusdata ==0)
 {
 %> <br>
 <h5 style='color: red; text-align:center;'>Records  Not Update  !</h5>
 <%}
 else if(statusdata ==2)
 {
 %> <br>
 <h5 style='color: green; text-align:center;'> Records insert SuccessFully !</h5>
 <%}
 else if(statusdata ==3)
 {
 %> <br>
 <h5 style='color: red; text-align:center;'> Records Not insert SuccessFully !</h5>
 <%}%>
</body>
</html>