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

		</div>
	</div>
</body>
</html>