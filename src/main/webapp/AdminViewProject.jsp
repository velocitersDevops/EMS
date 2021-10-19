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
	EmployeeDAO employeeDaoObject = new EmployeeDAO();
ServletContext context = getServletContext();
int managerId = Integer.parseInt(context.getInitParameter("managerId"));
System.out.println("Manager ID From WEB.XML : " + managerId);
session.setAttribute("ManList", employeeDaoObject.getAllEmployeesById(managerId));
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

			<%
				HashMap<Integer, String> mapObject = new HashMap<Integer, String>(employeeDaoObject.getProjectNames());//Creating HashMap  
			ArrayList<Manager> arraylistObject = new ArrayList<Manager>(employeeDaoObject.getManagerNames());
			%>

			<div class="row-3">
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
		</div>
	</div>
</body>
</html>