<%@page import="java.sql.*"%>
<%@page import="com.velociter.ems.database.EmployeeDAO"%>
<%@page import="com.velociter.ems.model.Employee"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.velociter.ems.model.Family"%>
<%@page import="com.velociter.ems.model.*"%>
<%@page import="java.util.*"%>
<%@page import="com.velociter.ems.interfaces.EmployeeInterface"%>
<%
	String firstName = (String) session.getAttribute(EmployeeInterface.FIRSTNAME);
//out.println("first name is :"+firstName);
if (firstName == null) {
	response.sendRedirect("Login.jsp");
}
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expire", 0);

//getting session value by constants
Integer empId = (Integer) session.getAttribute(EmployeeInterface.EMPLOYEEID);
// Integer familyId=(Integer)session.getAttribute(EmployeeInterface.FAMILYID);
// Integer personalInfoId = (Integer)session.getAttribute(EmployeeInterface.PERSONALINFO_ID);
// Integer addressId = (Integer)session.getAttribute(EmployeeInterface.ADDRESSID);

Employee employee = new Employee();
EmployeeDAO employeeDaoObject = new EmployeeDAO();

employee = employeeDaoObject.getFourIds(empId); //getting Id's of employee to display his data in page
int personalInfoId = employee.getPersonalInfoId(); //personalInfoId of employee from employee table
int familyId = employee.getFamilyId(); //familyId of employee from employee table
int addressId = employee.getAddressId(); //address Id of employee from employee table

System.out.println("personalInfoId is :" + personalInfoId);
System.out.println(" familyId is :" + familyId);
System.out.println("addressId is :" + addressId);
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<fmt:setBundle basename="label" />
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<title>EditFamilyDetails Page</title>
<script src="js/JsProperties.js"></script>
<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js">
	
</script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js">
	
</script>

<!-- Default bootstrap CSS link taken from the 
        bootstrap website-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js">
	
</script>
<style>
* {
	box-sizing: border-box;
}

body {
	background-color: #f1f1f1;
	margin: auto;
}

#editForm {
	background-color: #ffffff;
	margin: 100px auto;
	font-family: Futara;
	padding: 5px;
	width: 50%;
	min-width: 300px;
}

h1 {
	text-align: center;
}

input {
	padding: 10px;
	width: 100%;
	font-size: 17px;
	font-family: Futara;
	border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
	background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
	
}

button {
	background-color: #04AA6D;
	color: #ffffff;
	border: none;
	padding: 10px 20px;
	font-size: 17px;
	font-family: Raleway;
	cursor: pointer;
}

button:hover {
	opacity: 0.8;
}

#prevBtn {
	background-color: #bbbbbb;
}

/* Make circles that indicate the steps of the form: */
.step {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbbbbb;
	border: none;
	border-radius: 50%;
	display: inline-block;
	opacity: 0.5;
}

.step.active {
	opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
	background-color: #04AA6D;
}
</style>
<script src="js/JsProperties.js"></script>
</head>
<body>

	<jsp:include page="Header.jsp"></jsp:include>
	<form id="editForm" action="" method="POST"> <!-- 
		onsubmit="return validateForm()" -->
		<h1>Edit Family Details:</h1>
		<jsp:scriptlet>Family family = null;
if (familyId != 0) {
	//family=operationObject.getFamilyDetailsByFamilyId(familyId);
	family = employeeDaoObject.getFamilyDetails(familyId);</jsp:scriptlet>
		<div class="tab">
			Family Details:<br> <br>
			<fmt:message key="label.fatherName"></fmt:message>
			<p>
				<input id="fatherName" placeholder="Father name..."
					value=<%=family.getFatherName()%> oninput="this.className = ''"
					name="fatherName">
			</p>
			<fmt:message key="label.moterName"></fmt:message>
			<p>
				<input id="motherName" placeholder="Mother name..."
					value=<%=family.getMotherName()%> oninput="this.className = ''"
					name="motherName">
			</p>
			<fmt:message key="label.spouseName"></fmt:message>
			<%
				if (family.getSpouseName() == null) {
			%>
			<p>
				<input id="spouseName" placeholder="NA"
					oninput="this.className = ''" name="spouseName">
			</p>
			<%
				} else {
			%>
			<p>
				<input id="spouseName" placeholder="Enter spouse Name"
					value=<%=family.getSpouseName()%> oninput="this.className = ''"
					name="spouseName">
			</p>
			<%
				}
			%>
		</div>
		<jsp:scriptlet>}

else {</jsp:scriptlet>

		<div class="tab">
			Family Details:<br>
			<fmt:message key="label.fatherName"></fmt:message>
			<p>
				<input id="fatherName" placeholder="Father name..."
					oninput="this.className = ''" name="fatherName">
			</p>
			<fmt:message key="label.moterName"></fmt:message>
			<p>
				<input id="motherName" placeholder="Mother name..."
					oninput="this.className = ''" name="motherName">
			</p>
			<fmt:message key="label.spouseName"></fmt:message>
			<p>
				<input id="spouseName" placeholder="Spouse name..."
					oninput="this.className = ''" name="spouseName">
			</p>
		</div>

		<jsp:scriptlet>}</jsp:scriptlet>
		<div style="overflow: auto;">
			<div style="float: right; decoration: none">
				<button type="button" id="addButton" onclick="return formSubmit();">Add</button>
				<!-- <button type="button" id="editButton">Edit</button> -->
			</div>
		</div>
	</form>

	<script>
		/* $(document).ready(function() {
			$("#editButton").attr('disabled', 'disabled');
			$("#addButton").attr('disabled', 'disabled');
			var fatherName = document.getElementById("fatherName").value;
			var motherName = document.getElementById("motherName").value;
			var spouseName = document.getElementById("spouseName").value;
			var dataString = 'fatherName=' + fatherName + '&motherName='
					+ motherName + '&spouseName=' + spouseName;
			alert(dataString);
			if (!(fatherName == "" || motherName == "" || spouseName == "")) {
				$("#editButton").show();
				$("#addButton").hide();
	        }
	        else{      
	        	$("#addButton").show();
	        	$("#editButton").hide();
	        }
		});  */
		
		function formSubmit() {
			var fatherName = document.getElementById("fatherName").value;
			var motherName = document.getElementById("motherName").value;
			var spouseName = document.getElementById("spouseName").value;
			if (!fatherName.match(familyNamePattern)) {
				alert("Please enter valid father name");
				valid = false;
			} else if (!motherName.match(familyNamePattern)) {
				alert("Please enter valid mother name");
				valid = false;
			}
			if (spouseName != "") {
				if (!spouseName.match(familyNamePattern)) {
					alert("Please enter valid spouse name");
					valid = false;
				}
			} else {
				alert("Do You Want to Add Family!!!!");
				jQuery.ajax({
					url : "EditEmployeeDetailsServlet",
					data : dataString,
					type : "POST",
					success : function(data) {
						alert(data);
						if (data == 'True') {
							alert("Successfully Added Family!!");
						} else {
							alert("Something Want Wrong!!.")
						}
					} 
				}); 
			} 
			return true; 
		}
	    
		
		/* function validateForm() {
			var familyNamePattern = /^[a-zA-Z\s]{3,}$/;
			if (currentTab == 1) {
				var fatherName = document.getElementById("fatherName").value;
				var motherName = document.getElementById("motherName").value;
				var spouseName = document.getElementById("spouseName").value;
				if (!fatherName.match(familyNamePattern)) {
					alert("Please enter valid father name");
					valid = false;
				} else if (!motherName.match(familyNamePattern)) {
					alert("Please enter valid mother name");
					valid = false;
				}
				if (spouseName != "") {
					if (!spouseName.match(familyNamePattern)) {
						alert("Please enter valid spouse name");
						valid = false;
					}
				}
			}
		} */
	</script>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
