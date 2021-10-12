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
<%
	EmployeeDAO employeeDaoObject = new EmployeeDAO();
ServletContext context = getServletContext();
int managerId = Integer.parseInt(context.getInitParameter("managerId"));
System.out.println("Manager ID From WEB.XML : " + managerId);
session.setAttribute("ManList", employeeDaoObject.getAllEmployeesById(managerId));
%>

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
					<a href="#"><h3>Employee List</h3></a>
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
					<a href="AddEmployee.jsp"><h3>Add Manager</h3></a>
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
					<jsp:useBean id="ManList" scope="session" type="java.util.List"></jsp:useBean>
					<table class="content">
						<thead>
							<tr>
								<th><b>MANAGERID</b></th>
								<th><b>MANAGER NAME</b></th>
								<th><b>EDIT</b></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ManList}" var="mngr">
								<tr>
									<td><c:out value="${mngr.employeeId}"></c:out></td>
									<td><c:out value="${mngr.firstName}   ${mngr.lastName}"></c:out></td>
									<td><a style="color: red;"
										href="<c:url value = "CheckAdmin.jsp?id=${mngr.employeeId}"/>">EDIT</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

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
											<td><a id="pageClick" href="AdminWelcomePage.jsp?page=${i}">${i}</a></td>
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
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script language="Javascript" type="text/javascript">
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
		/* function formSubmit() {
			alert("Page On IT!!!");
			const params = new URLSearchParams(window.location.search)
			alert(params); 
			var url = (location.origin).concat(location.pathname).concat(location.hash);
			alert(url); 
		}; */
		
		function ChangeUrl(title, url) {
		    if (typeof (history.pushState) != "undefined") {
		        var obj = { Title: title, Url: url };
		        history.pushState(obj, obj.Title, obj.Url);
		    } else {
		        alert("Browser does not support HTML5.");
		    }
		}
		
		/* function formSubmit(){
			for (let i = 0; i < 5; i++) {
				$("a").attr("href", "AdminWelcomePage.jsp?page="+i);
			}
		}; */
		
		function formSubmit(pageNumber,url){
			alert(pageNumber);
			alert(url);
			if (typeof (history.pushState) != "undefined") {
		        var obj = { Title: title, Url: url };
		        history.pushState(obj, obj.Title, obj.Url);
		        /* $("a").attr("href", "AdminWelcomePage.jsp?page="+pageNumber);  */
		        /* $("a[href]").attr("href", "AdminWelcomePage.jsp?page="+pageNumber); */
		        /* document.getElementById("mylink").href = "AdminWelcomePage.jsp?page="+pageNumber; */
		        $("a").attr("href", "AdminWelcomePage.jsp?page="+pageNumber);
		        alert("HII");
		        /* var link = document.getElementById("mylink");
		        link.setAttribute('href', "AdminWelcomePage.jsp?page="+pageNumber);
		        alert(link); */
		    } else {
		        alert("Browser does not support HTML5.");
		    }
			
		};
		/* 
		$(function () {
	        $("#pageClick").click(function () {
	            ChangeUrl('Page1', 'AdminWelcomePage.jsp?page=${i}');
	        });
	    });
		function somescript() {
			alert("Page On IT!!!");
			var query = new URLSearchParams();
			query.append("KEY", "VALUE");
			var url = "AdminWelcomePage.jsp?" + query.toString();
			alert(url);
    	} */
	</script>
</body>
</html>