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
<jsp:scriptlet>String username = (String) session.getAttribute(EmployeeInterface.ADMINNAME);
//Integer empid =session.getAttribute(EmployeeInterface.EMPLOYEEID);
if (username == null) {
	response.sendRedirect("adminPage.jsp");
}</jsp:scriptlet>
<jsp:scriptlet>int pageNumber = 1;

if (request.getParameter("page") != null) {
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

System.out.println(((java.util.List) session.getAttribute("EmpList")).size());
String myUrl = "AdminWelcomePage.jsp?page=" + nextPage;
String prevUrl = "AdminWelcomePage.jsp?page=" + prevPage;
System.out.println(myUrl);
System.out.println(prevUrl);

pageContext.setAttribute("myUrl", myUrl);
pageContext.setAttribute("prevUrl", prevUrl);</jsp:scriptlet>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Page</title>
<style type="text/css">

/*----------------- card table design----------------------*/
/* .card {
	border-collapse: collapse;
	margin: 25px 0;
	font-size: 0.9em;
	min-width: 400px;
	border-radius: 5px 5px 0 0;
	overflow: hidden;
} */
</style>
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>
</head>
<body style="font-family: Futara;">
	<%
		response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire", 0);
	%>
	<div class="row">
		<div class="column right">
			<div class="box">
				<div id="employeeShow">
					<h3>Employee List</h3>
					<jsp:useBean id="EmpList" scope="session" type="java.util.List"></jsp:useBean>
					<table class="content">
						<!-- border="1" cellpadding="5" cellspacing="5" -->
						<thead style="position: static;">
							<tr>
								<td><b>FIRST NAME</b></td>
								<td><b>LAST NAME</b></td>
								<td><b>MOBILE NO</b></td>
								<td><b>EMAIL ID</b></td>
								<td><b>DATE OF JOINING</b></td>
								<td><b>VEIW DETAILS</b></td>
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
								<li class="prev"><a href="${pageScope.prevUrl}" id="prev"><i
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
												<td><a id="pageClick" onclick="formPage(${i});" href="#">${i}</a></td>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<!-- onclick="return formSubmit();" href="AdminWelcomePage.jsp?page=${i}" 
									onclick="ChangeUrl('Page', 'AdminWelcomePage.jsp?page=${i}');"
									href="javascript:ChangeUrl('Page', 'AdminWelcomePage.jsp?page=${i}');"
									onclick="return formSubmit(${i},'AdminWelcomePage.jsp?page=${i}');" 
								-->
								</tr>
							</table>
							<c:if test="${page lt noOfPages}">
								<li class="next"><a href="${pageScope.myUrl}" id="next"><i
										class="fa fa-arrow-right" aria-hidden="true"></i></a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script language="Javascript" type="text/javascript">
		/* $(document).ready(function() {
			$('#pageClick').on('click', function() {
				alert('onclick is working.');
				miniReport(pageNumber, url); //Your function 
			});
		}); */

		/* function miniReport(pageNumber, url) {
			alert(pageNumber);
			$.ajax({
				url : "AdminWelcomePage.jsp?page=" + pageNumber,
				data : {
					pageNumber : "pageNumber"
				},
				success : function(data) {
					alert(pageNumber - "returned");
				}
			});
		} */

		/* function formPage(pageNumber) {
			alert(pageNumber);
			$.post("AdminWelcomePage.jsp?page="+pageNumber, {
				pageNumber : "pageNumber"
			}, function(data, status) {
				alert("Data: " + data + "\nStatus: " + status);
			});
		} */
		
		function miniReport(pageNumber, url) {
			alert(pageNumber);
			alert(url);
		     $.ajax({
		        url: url,
		        timeout:30000,
		        type: "POST",
		        data: {
		            'pageNumber': pageNumber
		       },
		        success: function(msg){
		            if (msg.ws_resultat.result_ok==true)
		            {
		                alert('success!');
		                window.open("AdminWelcomePage.jsp");
		            }
		        },
		            error: function(jqXHR, textStatus)
		          {
		            	alert("Browser does not support HTML5.");   
		          }
		    });
		}

		function formSubmit(pageNumber, url) {
			/* alert(pageNumber);
			alert(url); */
			$.ajax({
				url : "AdminWelcomePage.jsp?page=" + pageNumber,
				data : {
					pageNumber : "pageNumber"
				},
				success : function(data) {
					alert(data);
				}
			});
		};

	</script>
</body>
</html>