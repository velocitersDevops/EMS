<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.velociter.ems.database.Operations"%>
<%@page import="com.velociter.ems.model.Employee"%>
<%  ArrayList<Employee>  employeeObject=null;%>

<jsp:scriptlet>


String firstName=(String)session.getAttribute("firstName");

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
<link rel="stylesheet" href="exstyle/style.css">
<title>Employee List</title>
</head>
<body>

 

<jsp:include page="Header.jsp"></jsp:include>
<div class="navbar">
  <h3><a href="EditEmployeeDetails.jsp"style="float:right;padding-right:60px;text-decoration:none">Edit</a></h3>

</div>

<center>
<h2>Employee List</h2>
<br><br>

     <table  >
            <thead>
               <tr>
                  <td>FIRST NAME</td>
                  <td>LAST NAME</td>
                  <td>MOBILE NO</td>
                  <td>EMAIL ID</td>
                  <td>DATE OF JOINING</td>
                  <td>VEIW DETAILS</td>
               </tr>
               <jsp:scriptlet>
               
               
               try
               {
            	   
            	   Operations operationObject=new Operations();
            	   
            	 
            	   employeeObject= operationObject.getEmployeeList();
              
       		 
                  for( Employee employeeList:employeeObject)
                	  
       	
                  {
       			 
       		 
               </jsp:scriptlet>
               
               <tr>
                    <td><jsp:expression>employeeList.getFirstName()</jsp:expression></td>
                    <td><jsp:expression>employeeList.getLastName()</jsp:expression></td>
                    <td><jsp:expression>employeeList.getMobileNumber()</jsp:expression></td>
                    <td><jsp:expression>employeeList.getEmailId()</jsp:expression></td>
                    <td><jsp:expression>employeeList.getDateOfJoining()</jsp:expression></td>
                    <td><a href="" style="color:red">View Details</a></td>
               </tr>
               <jsp:scriptlet>
               
                  }
               }
               catch(Exception e)
               {
            	
            	  e.printStackTrace() ;
               }
            	  </jsp:scriptlet>
               
               
                     
               
            </thead>
     </table>
     <br><br>
     
     </center>
   
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
       <jsp:include page="Footer.jsp"></jsp:include>
    
</body>
</html>