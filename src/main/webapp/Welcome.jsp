<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.velociter.ems.database.EmployeeDAO"%>
<%@ page import="com.velociter.ems.model.Family"%>
<%@ page import="com.velociter.ems.model.Employee"%>
<%@ page import="com.velociter.ems.model.Address"%>
<%@ page import="com.velociter.ems.model.PersonalInformation"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="com.velociter.ems.interfaces.EmployeeInterface"%>
<jsp:scriptlet>String firstName = (String) session.getAttribute(EmployeeInterface.FIRSTNAME);
//Integer empid =session.getAttribute(EmployeeInterface.EMPLOYEEID);
if (firstName == null) {
	response.sendRedirect("Login.jsp");
}</jsp:scriptlet>
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
	/* border: 2px solid #000;
	padding: 8px; */
	/* border-bottom: 2px solid;
	padding: 10px;
	position: relative;
	weight: 100px; */
	    content: "";
    position: absolute;
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
}

/* .row .column .box {
	width: 950px;
	height: 500px;
	margin: 70px;
	padding: 50px;
	border: 2px solid #000;
	box-sizing: border-box;
	Overflow-y: scroll;
} */
.row .column h4 {
	text-align: right;
	margin: 20px 114px;
	color: red;
}

.row .column h3 {
	margin: 50px 58px;
}

.row .column .box a {
	text-decoration: none;
	font-size: 20px;
	padding: 6px;
	margin: 40px 182px;
	float: right;
	border: 2px solid #000;
	color: #000;
}

.row .column .vl {
	border-right: 6px solid green;
	height: 500px;
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
</style>
</head>
<jsp:include page="Header.jsp"></jsp:include>
<body style="font-family: Futara;">
	<%
		response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire", 0);
	%>

	<%
		try {
		EmployeeDAO employeeDaoObject = new EmployeeDAO();
		ArrayList<Employee> employeeObject = new ArrayList<Employee>(employeeDaoObject.getEmployeeList());
		int empid = (int) session.getAttribute(EmployeeInterface.EMPLOYEEID);
		Employee employeeList = employeeDaoObject.getEmployeeDetails(empid);
	%>
	<div class="row">
		<div class="column left">

			<table style="text-align: center;">
				<tr>
					<th><a href="EmployeeList.jsp">View List of Employee</a></th>
				</tr>
			</table>
		</div>

		<div class="column right">
			<h4>
				Welcome <%=employeeList.getFirstName()%>
				<%=employeeList.getLastName()%>
			</h4>
			<h3>My Profile</h3>
			<div class="box">

				<fieldset>
					<legend>Employee Details:</legend>
					<table>

						<tr>
							<td><label>Salutation:</label></td>
							<td>
								<%
									String salutationdata = (employeeList.getSalutation() != null) ? employeeList.getSalutation() : "NA";
								%> <%=salutationdata%>
							</td>
						</tr>
						<tr>
							<td><label>First Name:</label></td>
							<td>
								<%
									String firstnamedata = (employeeList.getFirstName() != null) ? employeeList.getFirstName() : "NA";
								%> <%=firstnamedata%>
							</td>
						</tr>
						<tr>
							<td><label>Middle Name:</label></td>
							<td>
								<%
									String middlenamedata = (employeeList.getMiddleName() != null) ? employeeList.getMiddleName() : "NA";
								%> <%=middlenamedata%>
							</td>
						</tr>
						<tr>
							<td><label>Last Name:</label></td>
							<td>
								<%
									String lastnamedata = (employeeList.getLastName() != null) ? employeeList.getLastName() : "NA";
								%> <%=lastnamedata%>
							</td>
						</tr>
						<tr>
							<td><label>Country Code:</label></td>
							<td>
								<%
									String isdcode = (employeeList.getisdCode() != null) ? employeeList.getisdCode() : "NA";
								%> <%="" + isdcode%>
							</td>
						</tr>
						<tr>
							<td><label>Mobile No:</label></td>
							<td>
								<%
									String mobiledata = (employeeList.getMobileNumber() != 0) ? mobiledata = Long.toString(employeeList.getMobileNumber())
										: "NA";
								%> <%=mobiledata%>
							</td>
						</tr>
						<tr>
							<td><label>Alternate No.:</label></td>
							<td>
								<%
									String alternateContactdata = (employeeList.getAlternateContactNumber() != 0)
										? alternateContactdata = Long.toString(employeeList.getAlternateContactNumber())
										: "NA";
								%> <%=alternateContactdata%>
							</td>
						</tr>
						<tr>
							<td><label>Email:</label></td>
							<td>
								<%
									String emaildata = (employeeList.getEmailId() != null) ? employeeList.getEmailId() : "NA";
								%> <%=emaildata%></td>
						</tr>
						<tr>
							<td><label>Project ID:</label></td>
							<td>
								<%
									String projectIdData = (employeeList.getProjectId() != 0)
										? projectIdData = Integer.toString(employeeList.getProjectId())
										: "NA";
								%> <%=projectIdData%>
							</td>
						</tr>
						<tr>
							<td><label>Manager Name:</label></td>
							<td>
								<%
									String managerNamedata = (employeeList.getDesignationName() != null) ? employeeList.getDesignationName() : "NA";
								%> <%=managerNamedata%>
							</td>
						</tr>
						<tr>
							<td><label>Date Of Join:</label></td>
							<td>
								<%
									String dojData = (employeeList.getDateOfJoining() != null) ? employeeList.getDateOfJoining() : "NA";
								%> <%=dojData%>
							</td>
						</tr>
						<tr>
							<td><label>Creation Date:</label></td>
							<td>
								<%
									String creationData = (employeeList.getCreationDate() != null) ? employeeList.getCreationDate() : "NA";
								%> <%=creationData%>
							</td>
						</tr>
						<tr>
							<td><label>Last Modified Date:</label></td>
							<td>
								<%
									String lastModifiedData = (employeeList.getLastModifiedDate() != null) ? employeeList.getLastModifiedDate() : "NA";
								%> <%=lastModifiedData%>
							</td>
						</tr>

						<jsp:scriptlet>} catch (Exception e) {
e.printStackTrace();
}</jsp:scriptlet>
					</table>

				</fieldset>

				<a href="EditEmployeeDetails.jsp">Edit My Profile</a>
			</div>
		</div>
	</div>
</body>
<jsp:include page="Footer.jsp"></jsp:include>
</html>