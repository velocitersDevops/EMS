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
.card {
	border: 1px solid #d3d3d3;
	border-radius: .25rem;
	height: 230px;
	width: 250px;
	padding: 20px;
	margin-right: 100px;
	/* cursor: pointer; */
	box-shadow: inset 0 -3em 3em rgba(0, 0, 0, 0.1), 0 0 0 2px
		rgb(255, 255, 255), 0.3em 0.3em 1em rgba(0, 0, 0, 0.3);
}

a {
	text-decoration: none;
	color: red;
	padding: 10px;
}

.card h3 {
	color: red;
	font-size: 28px;
	text-align: center;
}

h3 {
	font-size: 32px;
}

.grid-container {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	grid-gap: 20px;
	margin-bottom: 50px;
	/* margin: 76px 5px; */
}

/*-------------------------------------*/
/* @
keyframes spinner { 
	0% {
		transform: translate3d(-50%, -50%, 0) rotate(0deg);
	}
	100%{
		transform:translate3d(-50%,-50%,0)rotate(360deg);
	}
}
.spin::before {
	animation: 1.5s linear infinite spinner;
	animation-play-state: inherit;
	border: solid 5px #cfd0d1;
	border-bottom-color: red;
	border-radius: 50%;
	content: "";
	height: 40px;
	width: 40px;
	position: absolute;
	top: 50%;
	left: 55%;
	transform: translate3d(-50%, -50%, 0);
	will-change: transform;
} */
.spin{
	    margin-left: 460px;
    	/* margin-top: -210px; */
}
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
					<th class="activelink"><a href="javaScript:formAdminHome();">Home/Dashboard
					</a></th>
				</tr>
				<tr>
					<th><a href="javaScript:paggination(1);">Employee List</a></th>
				</tr>
				<tr>
					<th><a href="AddEmployee.jsp">Add Employee</a></th>
				</tr>
				<tr>
					<th><a href="javaScript:formProject();">Add Project</a></th>
				</tr>
				<tr>
					<th><a href="AddEmployee.jsp">Add Manager</a></th>
				</tr>
				<tr>
					<th><a href="javaScript:formViewProject();">View Project</a></th>
				</tr>
				<tr>
					<th><a href="javaScript:formViewManager();">View Manager</a></th>
				</tr>
			</table>
		</div>


		<%
			long employeeCount = EmployeeDAO.countEmployee();
		long projectCount = EmployeeDAO.countProject();
		long managerCount = EmployeeDAO.countManager();
		%>
		<div class="column right">
			<h4>
				Welcome
				<%=username%></h4>
			<div class="box">
				<div class="grid-container">
					<div class="card">
						<h3><%=employeeCount%></h3>
						<h3>No. Of Employee</h3>
					</div>
					<div class="card">
						<h3><%=projectCount%></h3>
						<h3>No. of Projects</h3>
					</div>
					<div class="card">
						<h3><%=managerCount%></h3>
						<h3>No. of Manager</h3>
					</div>
				</div>
				<!-- <div class="spin"></div> -->
				<div class="spin">
					<img style="height: 70px;" src="exstyle/Images/loader.gif">
				</div>
				<div id="test"></div>
			</div>
		</div>
	</div>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script type="text/javascript">
		window.onload=my_code();
		function my_code(){
			$(".spin").hide();
		}
		function formAdminHome() {
			$(".spin").show();
			$.post("AdminWelcomePageOne.jsp", {}, function(data, status) {
				$(".grid-container").hide();
				$(".spin").hide();
				$("#test").html(data);
			});
		}

		function formProject() {
			$(".spin").show();
			$.post("AddProject.jsp", {}, function(data, status) {
				$(".grid-container").hide();
				$(".spin").hide();
				$("#test").html(data);
			});
		}
		function formViewProject() {
			$(".spin").show();
			$.post("AdminViewProject.jsp", {}, function(data, status) {
				$(".grid-container").hide();
				$(".spin").hide();
				$("#test").html(data);
			});
		}

		function formViewManager() {
			$(".spin").show();
			$.post("AdminViewManager.jsp", {}, function(data, status) {
				$(".grid-container").hide();
				$(".spin").hide();
				$("#test").html(data);
			});
		}

		function paggination(page) {
			$(".spin").show();
			$.post("AdminEmployeeList.jsp?page=" + page, {
				page : "page"
			}, function(data, status) {
				$(".grid-container").hide();
				$(".spin").hide();
				$("#test").html(data);
			});
		}
	</script>
</body>
<jsp:include page="Footer.jsp"></jsp:include>
</html>