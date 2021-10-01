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
body {
	margin: 8px;
	height: 100vh;
	overflow-y: scroll;
	overflow-x: hidden; /* hides the horizontal scroll bar */
}

* {
	box-sizing: border-box;
}

.row {
	height: 100vh;
}

/* .column {
	float: left;
	padding: 10px;
	height: 100vh;
} */

/* .left {
	width: 20%;
}
 */
.right {
	width: 100%;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.row .column table th {
	content: "";
	position: inherit;
	left: 20px;
	/* bottom: 0; */
	height: 38px;
	margin: 0px -10px;
	width: 294px;
	border-bottom: 2px solid #000;
}

.row .column table th a {
	/* border-bottom: 2px solid; */
	text-decoration: none;
	font-size: 20px;
	font-family: none;
	color: red;
}

.activelink {
	color: #fff;
	background-color: #000;
}

.row .column h4 {
	text-align: right;
	margin: 20px 114px;
	color: red;
}

.row .column h3 {
	margin: 50px 0px;
}

.row .column .vl {
	border-right: 6px solid green;
	height: 500px;
}

.column .box {
	/*  border: 1px solid; */
	margin: 58px 60px;
}

/*---------------*/
table.center {
	margin-left: auto;
	margin-right: auto;
}

table {
	width: 100%;
	margin-bottom: 50px;
}

fieldset {
	/*     background-color: #eeeeee;   */
	/* background-color: white; */
	width: 80%;
	margin: -20px 50px;
}

legend {
	background-color: gray;
	color: white;
	padding: 1px 3px;
}

input {
	margin: 3px;
}

ul {
	height: 50px;
	padding: 0px 5px;
	margin: -37px -4px;
	width: auto;
	float: left;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

ul li {
	list-style: none;
	padding: 5px 10px;
	font-weight: bold;
	border: 1px solid #ccc;
	background-color: #000;
}

ul li i {
	color: #fff;
}

table tr td a {
	text-decoration: none;
	padding: 5px 10px;
	font-weight: bold;
	/* border: 1px solid #ccc; */
	color: #000;
}

.active {
	border: 1px solid;
	padding: 5px 10px;
	background-color: #000;
	color: #fff;
}
/*-----------------table design----------------------*/
.content {
	border-collapse: collapse;
	margin: 25px 0;
	font-size: 0.9em;
	min-width: 400px;
	border-radius: 5px 5px 0 0;
	overflow: hidden;
}

.content thead tr {
	background-color: #000;
	color: #ffffff;
	text-align: left;
	font-weight: bold;
}

.content th, .content td {
	padding: 12px 15px;
}

.content tbody tr {
	border-bottom: 1px solid #dddddd;
}

.content tbody tr:nth-of-type(even) {
	background-color: #f3f3f3;
}

.content tbody tr:last-of-type {
	border-bottom: 2px solid #000;
}

.content tbody tr.r {
	font-weight: bold;
	color: #1B1464;
}

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
<jsp:include page="AdminHeader.jsp"></jsp:include>
<body style="font-family: Futara;">
	<%
		response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire", 0);
	%>
	<div class="row">
		<div class="column left">
			
		</div>

		<div class="column right">
			<h4>Welcome Admin</h4>
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
												<td><a href="Paggination.jsp?page=${i}">${i}</a></td>
											</c:otherwise>
										</c:choose>
									</c:forEach>
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

</body>
<jsp:include page="Footer.jsp"></jsp:include>
</html>