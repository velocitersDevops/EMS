<%@page import="oracle.net.aso.a"%>
<%@page import="java.util.ListIterator"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="com.velociter.ems.model.Manager"%>
<%@page import="com.velociter.ems.model.Project"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.velociter.ems.database.EmployeeDAO"%>
<%@ page import="com.velociter.ems.model.Family"%>
<%@ page import="com.velociter.ems.model.Employee"%>
<%@ page import="com.velociter.ems.model.Address"%>
<%@ page import="com.velociter.ems.model.PersonalInformation"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="com.velociter.ems.interfaces.EmployeeInterface"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String username = (String) session.getAttribute(EmployeeInterface.ADMINNAME);
//Integer empid =session.getAttribute(EmployeeInterface.EMPLOYEEID);
if (username == null) {
	response.sendRedirect("adminPage.jsp");
}
EmployeeDAO employeeDaoObject = new EmployeeDAO();
ServletContext context = getServletContext();
int managerId = Integer.parseInt(context.getInitParameter("managerId"));
System.out.println("Manager ID From WEB.XML : " + managerId);
session.setAttribute("ManList", employeeDaoObject.getAllEmployeesById(managerId));

int pageNumber = 1;
if (request.getParameter("page") != null) {
	System.out.println("page value :"+request.getParameter("page"));
	session.setAttribute("page", request.getParameter("page"));
	pageNumber = Integer.parseInt(request.getParameter("page"));
} else {
	session.setAttribute("page", "1");
}
String nextPage = (pageNumber + 1) + "";
String prevPage = (pageNumber - 1) + "";
session.setAttribute("EmpList", EmployeeDAO.getPageData(pageNumber, EmployeeInterface.PAGE_SIZE));

long noOfRecords = EmployeeDAO.getNoOfRecords();
int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / EmployeeInterface.PAGE_SIZE);
request.setAttribute("noOfPages", noOfPages);

//  System.out.println(((java.util.List) session.getAttribute("EmpList")).size());
String myUrl = nextPage;
String prevUrl = prevPage;

System.out.println(myUrl);
System.out.println(prevUrl);

pageContext.setAttribute("myUrl", myUrl);
pageContext.setAttribute("prevUrl", prevUrl);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee List Page</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire", 0);
	%>
	<div class="row">
		<div class="column">
			<div id="employeeShow">
				<h3>Employee List</h3>
				<jsp:useBean id="EmpList" scope="session" type="java.util.List"></jsp:useBean>
				<table class="content">
					<thead style="position: static;">
						<tr>
							<td><b>FIRST NAME</b></td>
							<td><b>LAST NAME</b></td>
							<td><b>MOBILE NO</b></td>
							<td><b>EMAIL ID</b></td>
							<td><b>DATE OF JOINING</b></td>
							<td><b>VEIW DETAILS</b></td>
							<td><b>STATUS</b></td>
							<td><b>EDIT</b></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${EmpList}" var="emp" begin="0" end="10">
							<tr>
								<td><c:out value="${emp.firstName}"></c:out></td>
								<td><c:out value="${emp.lastName}"></c:out></td>
								<td><c:out value="${emp.mobileNumber}"></c:out></td>
								<td><c:out value="${emp.emailId}"></c:out></td>
								<td><c:out value="${emp.dateOfJoining}"></c:out></td>
								<td><a style="color: red;"
									href="<c:url value = "EmployeeDetails.jsp?empid=${emp.employeeId}"/>">View
										Details</a></td>
										
										 <c:if test="${emp.status == true}">
										 <td>
                                             <a style="color: green;"  href="javaScript:changeEmpStatus(${emp.employeeId},${emp.status});" id="changestatus">Activate</a>
                                          </td> 
									    
									    </c:if>  
								      <c:if test="${emp.status == false}">
										 <td>
									         <a style="color: red;"  href="javaScript:changeEmpStatus(${emp.employeeId},${emp.status});"  id="changestatus">DeActivate</a>
									       </td>
									    </c:if> 
						
								<td><a style="color: red;"
									href="<c:url value = "CheckAdmin.jsp?id=${emp.employeeId}"/>">Edit</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br> <br>
				<div>
					<ul class="pagination">
						<c:if test="${page != 1}">
							<li class="prev"><a href="javaScript:paggination(${pageScope.prevUrl});" id="prev"><i
									class="fa fa-arrow-left" aria-hidden="true"></i></a></li>
						</c:if>
						<table style="margin: 10px 3px;">
							<tr>
								<c:forEach begin="1" end="${noOfPages}" var="i">
									<c:choose>
										<c:when test="${page eq i}">
											<td class="active">${i}</td>
										</c:when>
										<c:otherwise>
											<td><a id="pageClick"
												href="javaScript:paggination(${i});">${i}</a></td>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tr>
						</table>
						<c:if test="${page lt noOfPages}">
							<li class="next"><a href="javaScript:paggination(${pageScope.myUrl});" id="next"><i
									class="fa fa-arrow-right" aria-hidden="true"></i></a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script>

function changeEmpStatus(id,status)
{ 
		var displayData;
		if(status == true)
			{
			displayData = "DeActivate";
			}else
				{
				displayData ="Activate"; 
				}
		var msg = null;
		if(status == false)
			{
			msg = "Activate";
			  var result = confirm("Are You Sure You Want To Activate This Employee ?");
			  if (result) 
			  {
	 		   var currentStatus ="deactivate";		
	 		   var url="ChangeStatusServlet?eid="+id+"&status="+currentStatus;  
	 		   if(window.XMLHttpRequest)
	 		   {  
	 		    request=new XMLHttpRequest();  
	 		   }   
	 		   else if(window.ActiveXObject)
	 		   {  
	 		    request=new ActiveXObject("Microsoft.XMLHTTP");  
	 		   }  
			 }
			  try{  
		 		   request.onreadystatechange=getInfo; 
		 		   request.open("GET",url,true);  
		 		   request.send();  
		 		   }
		 		   catch(e)
		 		   { 
		 			alert("Unable to connect to server");
		 	       }    
		 		   
		 		 function getInfo()
		 		 {  
		 			 var result=request.responseText;  
		 			 $("#changestatus").html(function employeeList(){
		 				$.post("AdminEmployeeList.jsp",{},function(data,status){
		 					$(".grid-container").hide();  
		 					$("#test").html(data);
		 				});
		 			});
		 		}
			}else
				{
			     	var result = confirm("Are You Sure You Want To DeActivate This Employee ?");
				    if (result) 
				    {
					  var currentStatus ="activate";		
				      var url="ChangeStatusServlet?eid="+id+"&status="+currentStatus;  
			 		   if(window.XMLHttpRequest)
			 		    {  
			 		     request=new XMLHttpRequest();  
			 		    }    
			 		    else if(window.ActiveXObject)
			 		    {  
			 		     request=new ActiveXObject("Microsoft.XMLHTTP");  
			 		    }  
				    }
 		try{  
 		   request.onreadystatechange=getInfo; 
 		   request.open("GET",url,true);  
 		   request.send();  
 		   }
 		   catch(e)
 		   { 
 			alert("Unable to connect to server");
 	       }    
 		   
 		 function getInfo()
 		 {  
 			 var result=request.responseText;  
	 			 $("#changestatus").html(function employeeList(){
$.post("AdminEmployeeList.jsp",{},function(data,status){
	$(".grid-container").hide();  
	$("#test").html(data);
});
});
 		}
	}
}
</script>
</body>
</html>