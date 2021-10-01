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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

/* .text-card {
	width: 250px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	text-align: center;
}

.heading {
	background-color: #FF9129;
    color: white;
    padding: 10px 10px;
    font-size: 30px;
}

.text-box {
	padding: 10px;
} */
.card {
	border: 1px solid #d3d3d3;
	border-radius: .25rem;
	height: 230px;
	width: 250px;
	padding: 20px;
	margin-right: 100px;
	cursor: pointer;
	box-shadow: inset 0 -3em 3em rgba(0, 0, 0, 0.1), 0 0 0 2px
		rgb(255, 255, 255), 0.3em 0.3em 1em rgba(0, 0, 0, 0.3);
}

a {
	text-decoration: none;
	color: red;
	padding: 10px;
}

h3 {
	font-size: 32px;
}

.grid-container {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	grid-gap: 20px;
	margin-bottom: 50px;
}
</style>
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
			<div class="grid-container" id="gridOne">
				<div class="card" id="employeebtn1">
					<a href="Paggination.jsp"><h3>Employee List</h3></a>
				</div>
				<div class="card" id="addemployeebtn1">
					<a href="AddEmployee.jsp"><h3>Add Employee</h3></a>
				</div>
				<div class="card" id="addprojectbtn1">
					<a href="AddProject.jsp"><h3>Add Project</h3></a>
				</div>
			</div>
			<div class="grid-container" id="gridTwo">
				<div class="card" id="addmanagerbtn1">
					<a href="AddManager.jsp"><h3>Add Manager</h3></a>
				</div>
				<div class="card" id="projectbtn1">
					<a href="#"><h3>View Project</h3></a>
				</div>
				<div class="card" id="managerbtn1">
					<a href="#"><h3>View Manager</h3></a>
				</div>
			</div>

			<%-- <div id="employeeShow">
				<jsp:include page="Paggination.jsp"></jsp:include>
			</div> --%>

			<%
				EmployeeDAO employeeDaoObject = new EmployeeDAO();
			HashMap<Integer, String> mapObject = new HashMap<Integer, String>(employeeDaoObject.getProjectNames());//Creating HashMap  
			ArrayList<Manager> arraylistObject = new ArrayList<Manager>(employeeDaoObject.getManagerNames());
			// out.println("manager name  :"+arraylistObject.get(1).getManagerName());
			%>

			<div class="row-3" id="projectShow">
				<h3>Project Names</h3>
				<div class="column-3">
					<table class="content">
						<thead>
							<tr>
								<th><b>PROJECTID</b></th>
								<th><b>PROJECT NAME</b></th>
								<th><b>EDIT</b></th>
							</tr>
						</thead>
						<tbody>
							<%
								for (Map.Entry<Integer, String> projectIdAndName : mapObject.entrySet()) {
							%>
							<tr>
								<td><%=projectIdAndName.getKey()%></td>
								<td><%=projectIdAndName.getValue()%></td>
								<td><a
									href="AddProject.jsp?id=<%=projectIdAndName.getKey()%>"
									style="color: red;">EDIT</a></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>


			<div class="row-4" id="managerShow">
					<h3>Manager Names</h3>
					<div class="column-4">
						<table class="content">
							<thead>
								<tr>
									<th><b>MANAGERID</b></th>
									<th><b>MANAGER NAME</b></th>
									<th><b>EDIT</b></th>
								</tr>
							</thead>
							<tbody>
								<%
									int did = 5;
								List<Employee> nlist = employeeDaoObject.getAllEmployeesById(did);
								for (Employee e : nlist) {
								%>
								<tr>
									<td><%=e.getEmployeeId()%></td>
									<td><%=e.getFirstName() + " " + e.getLastName()%></td>
									<td><a href="AddManager.jsp" style="color: red;">EDIT</a></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>

		</div>
	</div>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#projectShow").hide();
			$("#managerShow").hide();
			$("#employeeShow").hide();
			$("#employeebtn1").click(function() {
				$("#projectShow").hide();
				$("#employeeShow").show();
				$("#managerShow").hide();
				$("#gridOne").hide();
				$("#gridTwo").hide();
			});
			$("#projectbtn1").click(function() {
				$("#projectShow").show();
				$("#managerShow").hide();
				$("#employeeShow").hide();
				$("#gridOne").hide();
				$("#gridTwo").hide();
			});
			$("#managerbtn1").click(function() {
				$("#managerShow").show();
				$("#projectShow").hide();
				$("#employeeShow").hide();
				$("#gridOne").hide();
				$("#gridTwo").hide();
			});
		});
	</script>
</body>
</html>