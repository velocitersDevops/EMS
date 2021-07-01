<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.velociter.ems.database.Operations"%>
<%@page import="com.velociter.ems.database.EmployeeDAO"%>
<%@page import="com.velociter.ems.model.Employee"%>
<%@page import="com.velociter.ems.interfaces.EmployeeInterface"%>

<jsp:scriptlet>
String firstName=(String)session.getAttribute(EmployeeInterface.FIRSTNAME);
//Integer empid =session.getAttribute(EmployeeInterface.EMPLOYEEID);

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
<style>
th,td
{
padding: 10px;
        border: 1px solid black;
        border-collapse: collapse;
}  
</style> 
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="exstyle/style.css">
<title>Employee List</title>
</head>
<body>

<%
  response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expire", 0);
%>
 

<jsp:include page="Header.jsp"></jsp:include>
<div class="navbar">
  <h3><a href="EditEmployeeDetails.jsp"style="float:right;padding-right:60px;text-decoration:none">Edit</a></h3>

</div>

<center>
<h2>Employee List</h2>
<br><br>
<div style="overflow-y:auto;height:400px;border:solid black 2px;width:850px">
     <table >
            <thead style="position:static;">
               <tr>
                  <td><b>FIRST NAME</b></td>
                  <td><b>LAST NAME</b></td>
                  <td><b>MOBILE NO</b></td>
                  <td><b>EMAIL ID</b></td>
                  <td><b>DATE OF JOINING</b></td>
                  <td><b>VEIW DETAILS</b></td>
               </tr>
               </thead>
               <% 
               try
               {
            	 EmployeeDAO employeeDaoObject = new EmployeeDAO();
            	 ArrayList<Employee> employeeObject = new ArrayList<Employee>(employeeDaoObject.getEmployeeList());
                 for( Employee employeeList:employeeObject)
                 {
                %>
               
               <tr>
                    <td><jsp:expression>employeeList.getFirstName()</jsp:expression></td>
                    <td><jsp:expression>employeeList.getLastName()</jsp:expression></td>
                    <td><jsp:expression>employeeList.getMobileNumber()</jsp:expression></td>
                    <td><jsp:expression>employeeList.getEmailId()</jsp:expression></td>
                    <td><jsp:expression>employeeList.getDateOfJoining()</jsp:expression></td>
                     <%int employeeId =employeeList.getEmployeeId(); %> 
                    <td><a href="EmployeeDetails.jsp?empid=<%=employeeId %>" style="color:red" >View Details</a></td>
               </tr>
               <jsp:scriptlet>
               
                  }
               }
               catch(Exception e)
               {
            	  e.printStackTrace() ;
               }
            	  </jsp:scriptlet>
               
               
                     
               
            
     </table>
     </div>
     <br><br>
     
     </center>
   
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
       <jsp:include page="Footer.jsp"></jsp:include>
    
</body>
</html>