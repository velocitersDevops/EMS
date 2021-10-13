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
<%
String username = (String) session.getAttribute(EmployeeInterface.ADMINNAME);
//Integer empid =session.getAttribute(EmployeeInterface.EMPLOYEEID);
if (username == null) {
	response.sendRedirect("adminPage.jsp");
}
%>
<%-- <jsp:scriptlet>int pageNumber = 1;

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
pageContext.setAttribute("prevUrl", prevUrl);</jsp:scriptlet> --%>

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

.column {
	float: left;
	padding: 10px;
	height: 100vh;
}

.left {
	width: 20%;
	border-right: 2px solid #000;
}

.right {
	width: 80%;
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
			<table style="text-align: center;">
				<tr>
					<th class="activelink"><a href="#" id="employeebtn">Employee
							List</a></th>
				</tr>
				<tr>
					<th><a href="AddEmployee.jsp">Add Employee</a></th>
				</tr>
				<tr>
					<th><a href="AddProject.jsp">Add Project</a></th>
				</tr>
				<tr>
					<th><a href="AddManager.jsp">Add Manager</a></th>
				</tr>
				<tr>
					<th><a href="#" id="projectbtn">View Project</a></th>
				</tr>
				<tr>
					<th><a href="#" id="managerbtn">View Manager</a></th>
				</tr>
			</table>
		</div>



		<div class="column right">
			<h4>
				Welcome
				<%=username%></h4>
			<!-- <a href="AdminWelcomePage.jsp"
				style="margin: 70px; font-size: 20px; border: 1px solid; padding: 10px; color: red; text-decoration: none;">Back</a> -->
			<div class="box">
				<jsp:include page="AdminWelcomePageOne.jsp"></jsp:include>
				<div id="test"></div>
			</div>
		</div>
	</div>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#projectShow").hide();
			$("#managerShow").hide();
			$("#employeebtn").click(function() {
				$("#projectShow").hide();
				$("#employeeShow").show();
				$("#managerShow").hide();
				$("#gridOne").hide();
				$("#gridTwo").hide();
			});  
			/* $('#projectbtn').addClass("active"); */
			$("#backClick").click(function() {
				window.localStorage.clear();
			});  
			my_code();
			 $("#projectbtn").click(function() {
				$("#projectShow").show();
				$("#managerShow").hide();
				$("#employeeShow").hide();
				$("#gridOne").hide();
				$("#gridTwo").hide();
			}); 
			$("#managerbtn").click(function() {
				$("#managerShow").show();
				$("#projectShow").hide();
				$("#employeeShow").hide();
				$("#gridOne").hide();
				$("#gridTwo").hide();
			});
		});

		function my_code() {
			if (typeof (Storage) !== "undefined") {
				if (window.localStorage.getItem('content') == '#employeebtn') {
					$("#employeeShow").show();
					$("#gridOne").hide();
					$("#gridTwo").hide();
				} else if (window.localStorage.getItem('project') == '#projectbtn'){
					$("#projectShow").show();
					$("#managerShow").hide();
					$("#employeeShow").hide();
					$("#gridOne").hide();
					$("#gridTwo").hide();
				} else if (window.localStorage.getItem('manager') == '#managerbtn'){
					$("#managerShow").show();
					$("#projectShow").hide();
					$("#employeeShow").hide();
					$("#gridOne").hide();
					$("#gridTwo").hide();
				} else {
					$("#gridOne").show();
					$("#gridTwo").show();
				}
				
				$("#pageClick").click(function() {
					window.localStorage.setItem('content', '#employeebtn');
					window.localStorage.setItem('project', '#projectbtn');
					window.localStorage.setItem('manager', '#managerbtn');
					//window.localStorage.setItem('grid', '#grid');
					//$('#test').html(window.localStorage.getItem('content'));
					$("#gridOne").hide();
					$("#gridTwo").hide();
				});
			}
		};
	</script>

</body>
<jsp:include page="Footer.jsp"></jsp:include>
</html>