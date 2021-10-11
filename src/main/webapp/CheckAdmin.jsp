
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
String username = (String) session.getAttribute(EmployeeInterface.ADMINNAME);
//out.println("first name is :"+firstName);
if (username == null) {
	response.sendRedirect("AdminPage.jsp");
}
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expire", 0);

Employee employee = new Employee();
EmployeeDAO employeeDaoObject = new EmployeeDAO();

int empId = Integer.parseInt(request.getParameter("id")); 
session.setAttribute("id", empId);
System.out.println("EmployeeID  : " + empId);
System.out.println("IDS is : " + empId);
employee = employeeDaoObject.getFourIds(empId); //getting Id's of employee to display his data in page
int personalInfoId = employee.getPersonalInfoId(); //personalInfoId of employee from employee table
int familyId = employee.getFamilyId(); //familyId of employee from employee table
int addressId = employee.getAddressId(); //address Id of employee from employee table

System.out.println("personalInfoId is :" + personalInfoId);
System.out.println(" familyId is :" + familyId);
System.out.println("addressId is :" + addressId);

ServletContext context = getServletContext();
int managerId = Integer.parseInt(context.getInitParameter("managerId"));
System.out.println("Manager ID From WEB.XML : " + managerId);
List<Employee> empManagerObject = employeeDaoObject.getAllEmployeesById(managerId);
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
<title>EditEmployeeDetails Page</title>
<script src="js/JsProperties.js"></script>
<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css">

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
	display: none;
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
	<%
		employeeDaoObject = new EmployeeDAO();
	employee = employeeDaoObject.getEmployeeDetails(empId);
	ArrayList<Designation> designationObject = new ArrayList<Designation>(employeeDaoObject.getDesignationNames());
	HashMap<Integer, String> mapObject = new HashMap<Integer, String>(employeeDaoObject.getProjectNames());//Creating HashMap
	System.out.println("    addressId is :" + addressId);

	//out.println("project data  :"+operationObject.getProjectName());
	PersonalInformation personalinfoObject = new PersonalInformation();
	System.out.println("personal info id  data :" + personalInfoId);
	Address getAddressObject = new Address();
	System.out.println("address  id  data :" + addressId);
	//out.println("employee Data "+employee.toString());
	%>
	<jsp:include page="AdminHeader.jsp"></jsp:include>
	<form id="editForm" action="EditEmployeeDetailsServlet" method="POST"
		onsubmit="return validateForm()">
		<h1>Edit Employee Details:</h1>
		<!-- One "tab" for each step in the form: -->
		<div class="tab">

			<fmt:message key="label.firstName"></fmt:message>
			<p>
				<input disabled="disabled" value=<%=employee.getFirstName()%>
					placeholder="First name..." oninput="this.className = ''"
					name="firstName">
			</p>
			<fmt:message key="label.middleName"></fmt:message>
			<p>
				<input disabled="disabled" value=<%=employee.getMiddleName()%>
					placeholder="Middle name..." oninput="this.className = ''"
					name="middleName">
			</p>
			<fmt:message key="label.lastName"></fmt:message>
			<p>
				<input disabled="disabled" value=<%=employee.getLastName()%>
					placeholder="Last name..." oninput="this.className = ''"
					name="lastName">
			</p>
			<fmt:message key="label.emailid"></fmt:message>
			<p>
				<input disabled="disabled" value=<%=employee.getEmailId()%>
					placeholder="Email Id..." oninput="this.className = ''"
					name="emailId">
			</p>
			<fmt:message key="label.mobileNo"></fmt:message>
			<p>
				<input disabled="disabled" value=<%=employee.getMobileNumber()%>
					placeholder="Mobile Number..." oninput="this.className = ''"
					name="mobileNumber">
			</p>
			<fmt:message key="label.AltermobileNo"></fmt:message>
			<%
				if (employee.getAlternateContactNumber() == 0) {
			%>
			<p>
				<input id="alternateMobileNumber" placeholder="NA (Not Available)"
					oninput="this.className = ''" name="alternateMobileNumber">
			</p>
			<%
				} else {
			%>
			<p>
				<input id="alternateMobileNumber"
					value=<%=employee.getAlternateContactNumber()%>
					placeholder="Alternate Mobile Number not available..."
					oninput="this.className = ''" name="alternateMobileNumber">
			</p>
			<%
				}
			%>
			<fmt:message key="label.designationName"></fmt:message>
			<div class="input-group" style="width: 600px">
				<%--      <p><input multiple="multiple" value=<%=employee.getManagerName() %> placeholder="Manager name..." oninput="this.className = ''" name="managerName" list="list"></p>  --%>
				<select name="designationName" class="custom-select"
					id="inputGroupSelect04"
					aria-label="Example select with button addon">
					<%--       <option selected><%=employee.getManagerName() %></option> --%>
					<%
						for (int i = 0; i < designationObject.size(); i++) {
						String name = designationObject.get(i).getDesignationName();
						String name1 = employee.getDesignationName();
					%>
					<%--        <option selected><%=employee.getManagerName() %></option> --%>
					<%
						if (designationObject.get(i).getDesignationName().equals(employee.getDesignationName())) {
					%>
					<option selected><%=employee.getDesignationName()%></option>
					<%
						} else {
					%>
					<option><%=designationObject.get(i).getDesignationName()%></option>
					<%
						}
					}
					%>
				</select>
			</div>
			<br>


			<fmt:message key="label.managerName"></fmt:message>
			<div class="input-group" style="width: 600px">
				<%--      <p><input multiple="multiple" value=<%=employee.getManagerName() %> placeholder="Manager name..." oninput="this.className = ''" name="managerName" list="list"></p>  --%>
				<select name="managerName" class="custom-select"
					id="inputGroupSelect04"
					aria-label="Example select with button addon">
					<%--       <option selected><%=employee.getManagerName() %></option> --%>
					
					<%-- <%
						for (Employee e : empManagerObject) {
					%> --%> 
					
					<option selected><%=employee.getManagerName()%></option>
					<%
					for (Employee e : empManagerObject) {
						if (e.getFirstName().equals(employee.getFirstName())) {
					%>
					<option selected><%=e.getFirstName() + " " + e.getLastName()%></option>
					<%
						} else {
					%>
					<option><%=e.getFirstName() + " " + e.getLastName()%></option>
					<%
						}
					}
					%>
					
					
					
					<%-- <option value="<%=e.getFirstName() + " " + e.getLastName()%>">
										<%=e.getFirstName() + " " + e.getLastName()%><br>
					</option>
					<%
					}
					%>  --%>
					<%-- <%
						for (int i = 0; i < empManagerObject.size(); i++) {
						String name = empManagerObject.get(i).getManagerName();
						String name1 = employee.getManagerName();
					%>
					<option selected><%=employee.getManagerName()%></option>
					<%
						if (empManagerObject.get(i).getManagerName().equals(employee.getManagerName())) {
					%>
					<option selected><%=employee.getManagerName()%></option>
					<%
						} else {
					%>
					<option><%=empManagerObject.get(i).getManagerName()%></option>
					<%
						}
					}
					%>  --%>
				</select>
			</div>
			<br>


			<%--  Project Name  <p><input  value=<%= employee.getProjectId() %> placeholder="Project name..." oninput="this.className = ''" name="projectId"  ></p> --%>

			<fmt:message key="label.projectName"></fmt:message>
			<div class="input-group " style="width: 600px">
				<select name="projectName" class="custom-select selectpicker"
					id="inputGroupSelect05"
					aria-label="Example select with button addon">
					<%
						for (Map.Entry<Integer, String> projectIdAndName : mapObject.entrySet()) {
					%>
					<%
						if (projectIdAndName.getKey() == employee.getProjectId()) {
					%>
					<option selected value="<%=projectIdAndName.getKey()%>">
						<%=projectIdAndName.getValue()%></option>
					<%
						} else {
					%>
					<option value="<%=projectIdAndName.getKey()%>">
						<%=projectIdAndName.getValue()%></option>
					<%
						}
					}
					%>

				</select>
			</div>
			<br>

			<fmt:message key="label.joinDate"></fmt:message>
			<p>
				<input type="text" disabled="disabled"
					value="<%=employee.getDateOfJoining()%>"
					placeholder="Date of joining..." oninput="this.className = ''"
					name="dateOfJoining">
			</p>

		</div>

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

		<%
			personalinfoObject = employeeDaoObject.getPersonalInformation(personalInfoId);
		if (personalinfoObject != null) {
			// System.out.println("personalinfoObject data  :"+personalinfoObject.toString());
		%>
		<div class="tab">
			Personal Information :<br> <br> <input type="hidden"
				name="personalinfoid" value="<%=personalInfoId%>">
			<fmt:message key="label.nationality"></fmt:message>
			<p>
				<input disabled="disabled"
					value="<%=personalinfoObject.getNationality()%>"
					placeholder="Nationality..." oninput="this.className = ''"
					id="nationality" name="nationality">
			</p>
			<fmt:message key="label.dob"></fmt:message>
			<p>
				<input disabled="disabled"
					value="<%=personalinfoObject.getDateOfBirth()%>"
					placeholder="Date of Birth" oninput="this.className = ''"
					id="dobdate" name="dateOfbirth">
			</p>
			<fmt:message key="label.sex"></fmt:message>
			<p>
				<select disabled="disabled" name="sex"
					value="<%=personalinfoObject.getSex()%>" style="width: 90px;"font-size:9px">
					<option value="Male">Male</option>
					<option value="Female">Female</option>
				</select>
			</p>
			<fmt:message key="label.panNumber"></fmt:message>
			<p>
				<input disabled="disabled"
					value="<%=personalinfoObject.getPanNumber()%>"
					placeholder="PAN Number..." oninput="this.className = ''"
					id="pannumber" name="pannumber">
			</p>
			<fmt:message key="label.aadharNumber"></fmt:message>
			<p>
				<input disabled="disabled"
					value="<%=personalinfoObject.getAadharNumber()%>"
					placeholder="Aadhar Number..." oninput="this.className = ''"
					id="aadharnumber" name="aadharnumber">
			</p>
			<fmt:message key="label.passportNumber"></fmt:message>
			<b><lable style="color:green">(Optional)</lable></b>
			<%
				if (personalinfoObject.getPassportNumber() == null) {
			%>
			<p>
				<input placeholder="NA" id="passportnumber"
					oninput="this.className = ''" name="passportnumber">
			</p>
			<%
				} else {
			%>
			<p>
				<input placeholder="Enter Passport Number..." id="passportnumber"
					oninput="this.className = ''" name="passportnumber">
			</p>
			<%
				}
			%>
			<fmt:message key="label.BankAccNumber"></fmt:message>
			<p>
				<input value="<%=personalinfoObject.getBankAccountNumber()%>"
					placeholder="Bank Account Number..." oninput="this.className = ''"
					id="bankaccountNumber" name="bankaccountNumber">
			</p>
			<fmt:message key="label.maritalStatus"></fmt:message>
			<p>
				<select oninput="this.className = ''" name="marritalstatus">
					<option value="Single">Single</option>
					<option value="Married">Married</option>
				</select>
			</p>
		</div>
		<%
			} else {
		%>


		<div class="tab">
			Personal Information :<br> <br>
			<fmt:message key="label.nationality"></fmt:message>
			<p>
				<input placeholder="Nationality..." oninput="this.className = ''"
					id="nationality" name="nationality">
			</p>
			<fmt:message key="label.dob"></fmt:message>
			<p>
				<input type="date" placeholder="Date of Birth"
					oninput="this.className = ''" id="dobdate" name="dateOfbirth">
			</p>
			<fmt:message key="label.sex"></fmt:message>
			<p>
				<select name="sex" style="width: 90px;"font-size:9px" >
					<option value="Male">Male</option>
					<option value="Female">Female</option>
				</select>
			</p>
			<fmt:message key="label.panNumber"></fmt:message>
			<p>
				<input placeholder="PAN Number..." oninput="this.className = ''"
					id="pannumber" name="pannumber">
			</p>
			<fmt:message key="label.aadharNumber"></fmt:message>
			<p>
				<input placeholder="Aadhar Number..." oninput="this.className = ''"
					id="aadharnumber" name="aadharnumber">
			</p>
			<fmt:message key="label.passportNumber"></fmt:message>
			<b><lable style="color:green">(Optional)</lable></b>
			<p>
				<input value="" placeholder="Passport Number..." id="passportnumber"
					oninput="this.className = ''" name="passportnumber">
			</p>
			<fmt:message key="label.BankAccNumber"></fmt:message>
			<p>
				<input placeholder="Bank Account Number..."
					oninput="this.className = ''" id="bankaccountNumber"
					name="bankaccountNumber">
			</p>
			<fmt:message key="label.maritalStatus"></fmt:message>
			<p>
				<select oninput="this.className = ''" name="marritalstatus">
					<option value="Single">Single</option>
					<option value="Married">Married</option>
				</select>
			</p>
		</div>
		<%
			}
		%>
		<%
			if (addressId != 0) {
			getAddressObject = employeeDaoObject.getAddressDetails(addressId);
		%>
		<div class="tab">
			Address:<br> <br>

			<fmt:message key="label.country"></fmt:message>
			<p>
				<input value="<%=getAddressObject.getCountryName()%>"
					placeholder="Enter Country Name" oninput="this.className = ''"
					id="country" name="country"></input>
			</p>
			<fmt:message key="label.state"></fmt:message>
			<p>
				<input value="<%=getAddressObject.getStateName()%>"
					placeholder="Enter State/Province/Region..."
					oninput="this.className = ''" id="state" name="state">
			</p>
			<fmt:message key="label.city"></fmt:message>
			<p>
				<input value="<%=getAddressObject.getCityName()%>"
					placeholder="Enter City Name..." oninput="this.className =''"
					id="city" name="city">
			</p>
			<fmt:message key="label.houseNo"></fmt:message>
			<p>
				<input value="<%=getAddressObject.getHouseNumber()%>"
					placeholder="Enter House No..." oninput="this.className = ''"
					id="housenumber" name="housenumber">
			</p>
			<%
				String addressData = getAddressObject.getAddressLine1();
			if (addressData.indexOf('-') == -1) {
			%>
			<fmt:message key="label.addressLine1"></fmt:message>
			<p>
				<input value="<%=getAddressObject.getAddressLine1()%>"
					placeholder="Enter Address Line1..." oninput="this.className = ''"
					id="addressLine1" name="addressLine1">
			</p>
			<fmt:message key="label.addressLine2"></fmt:message>
			<b><lable style="color:green">(Optional)</lable></b>
			<p>
				<input placeholder="Enter Address Line2"
					oninput="this.className = ''" id="addressLine2" name="addressLine2">
			</p>
			<%
				} else {
			String[] bothAddresses = addressData.split("-");
			// out.println("address data :"+addressData);
			%>
			<fmt:message key="label.addressLine1"></fmt:message>
			<p>
				<input value="<%=bothAddresses[0]%>"
					placeholder="Enter Address Line1..." oninput="this.className = ''"
					id="addressLine1" name="addressLine1">
			</p>
			<fmt:message key="label.addressLine2"></fmt:message>
			<b><lable style="color:green">(Optional)</lable></b>
			<p>
				<input value="<%=bothAddresses[1]%>"
					placeholder="Enter Address Line2" oninput="this.className = ''"
					id="addressLine2" name="addressLine2">
			</p>
			<%
				}
			if (getAddressObject.getStreetNumber() != 0) {
			%>
			<fmt:message key="label.streetnumber"></fmt:message>
			<b><lable style="color:green">(Optional)</lable></b>
			<p>
				<input value="<%=getAddressObject.getStreetNumber()%>"
					placeholder="Enter Street Number" oninput="this.className = ''"
					id="streetnumber" name="streetnumber">
			</p>
			<%
				} else {
			%>
			<fmt:message key="label.streetnumber"></fmt:message>
			<b><lable style="color:green">(Optional)</lable></b>
			<p>
				<input placeholder="Enter Street Number"
					oninput="this.className = ''" id="streetnumber" name="streetnumber">
			</p>
			<%
				}
			%>
			<fmt:message key="label.pincode"></fmt:message>
			<p>
				<input value="<%=getAddressObject.getPincodeNumber()%>"
					placeholder="Enter Pin Code..." oninput="this.className =''"
					id="pincode" name="pincode">
			</p>
			<fmt:message key="label.addressType"></fmt:message>
			<p>
				<select oninput="this.className = ''" name="addressType">
					<option value="0">Permanent</option>
					<option value="1">Temporary</option>
				</select>
			</p>
		</div>
		<%
			} else {
		%>
		<div class="tab">
			Address:<br> <br>

			<fmt:message key="label.country"></fmt:message>
			<p>
				<input placeholder="Enter Country Name..."
					oninput="this.className = ''" id="country" name="country">
			</p>
			<fmt:message key="label.state"></fmt:message>
			<p>
				<input placeholder="Enter State..." oninput="this.className = ''"
					id="state" name="state">
			</p>
			<fmt:message key="label.city"></fmt:message>
			<p>
				<input placeholder="Enter City Name..." oninput="this.className =''"
					id="city" name="city">
			</p>
			<fmt:message key="label.houseNo"></fmt:message>
			<p>
				<input placeholder="Enter House No..." oninput="this.className = ''"
					id="housenumber" name="housenumber">
			</p>
			<fmt:message key="label.addressLine1"></fmt:message>
			<p>
				<input placeholder="Enter Address Line1..."
					oninput="this.className = ''" id="addressLine1" name="addressLine1">
			</p>
			<fmt:message key="label.addressLine2"></fmt:message>
			<b><lable style="color:green">(Optional)</lable></b>
			<p>
				<input placeholder="Enter Address Line2"
					oninput="this.className = ''" id="addressLine2" name="addressLine2">
			</p>
			<fmt:message key="label.streetnumber"></fmt:message>
			<b><lable style="color:green">(Optional)</lable></b>
			<p>
				<input placeholder="Enter Street Number"
					oninput="this.className = ''" id="streetnumber" name="streetnumber">
			</p>
			<fmt:message key="label.pincode"></fmt:message>
			<p>
				<input placeholder="Enter Pin Code..." oninput="this.className =''"
					id="pincode" name="pincode">
			</p>
			<fmt:message key="label.addressType"></fmt:message>
			<select oninput="this.className = ''" name="addressType">
				<option value="0">Permanent</option>
				<option value="1">Temporary</option>
			</select>
			</p>

		</div>
		<jsp:include page="Footer.jsp"></jsp:include>
		<%
			}
		%>

		<div style="overflow: auto;">
			<div style="float: right; decoration: none">
				<button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
				<button type="button" id="nextBtn" onclick="nextPrev(1)">Submit</button>
			</div>
		</div>
		<!-- Circles which indicates the steps of the form: -->
		<div style="text-align: center; margin-top: 40px;">
			<span class="step"></span> <span class="step"></span> <span
				class="step"></span> <span class="step"></span>

		</div>
	</form>

	<script>

var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab


function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "Submit";
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    
    document.getElementById("editForm").submit();
     return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  
  var x, y, i, valid = true;
  
  var alternateMobileNumberPattern=/[A-Za-z\s]+$/;
  var familyNamePattern= /^[a-zA-Z\s]{3,}$/ ;
  var bankAccountNumberPatter = /[A-Za-z\s]+$/;
  var patternPassportNumber =/[A-Z]{1}[0-9]{7}/;
  var options = document.getElementById('inputGroupSelect05').selectedOptions;
  var alternateMobileNumber=document.getElementById('alternateMobileNumber').value;
  var spouseName=document.getElementById('spouseName').value;
  var values = Array.from(options).map(({ value }) => value);
  console.log(values);
  
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
        
      //validation for alternate Mobile Number and project  	
         if(alternateMobileNumber!=""&&alternateMobileNumber!=0)
        {
        	 if(alternateMobileNumber.match(alternateMobileNumberPattern))
    	  {
    	   alert("Please enter valid number");
    	   valid=false;
    	  }
        else if(alternateMobileNumber.length!=10)
        	  {
        	  alert("Please enter valid number");
        	  valid=false;
        	  }
        }
	     
         else if(values.length == limitForCondition.projectzero){
	         alert("Please select atlest 1 project");
	         valid=false;
	       }
         else if(values.length > limitForCondition.projectLimit){
	   	  alert("You Can select only 1 projects.");
	   	 valid=false;
	      } 
	   	

	 //validation for family details 
	 if(currentTab==1)
		 {
		 var fatherName=document.getElementById("fatherName").value;
		 var motherName=document.getElementById("motherName").value;
		 var spouseName=document.getElementById("spouseName").value;
		 if(!fatherName.match(familyNamePattern))
			 {
			 alert ("Please enter valid father name");
			 valid=false;
			 }
		 else if(!motherName.match(familyNamePattern))
			 {
			 alert("Please enter valid mother name");
			 valid=false;
			 }
		 if(spouseName!="")
			 {
		 if(!spouseName.match(familyNamePattern))
		 {
		 alert("Please enter valid spouse name");
		 valid=false;
		 }
		 }
		 }
	 
	
	// validation for Personal information fields
  	if(currentTab==2)
  		 {
  		  var  dob= document.getElementById("dobdate").value;
 		  var  panNumber= document.getElementById("pannumber").value;
 		  var  aadharNumber= document.getElementById("aadharnumber").value;
 		  var  passportNumber= document.getElementById("passportnumber").value;
 		  var  bankaccountNumber= document.getElementById("bankaccountNumber").value;
		  var  nationaLity = document.getElementById("nationality").value;
		  var  patternForPanNumber = /[A-Z]{5}[0-9]{4}[A-Z]{1}/;
		  var  patternForAadharNumber = /^[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}$/;
		  var  patternForPassport = /^[A-PR-WYa-pr-wy][1-9]\\d\\s?\\d{4}[1-9]$/;
		  var  patternForBankAccNumber = /^[3-9][0-9]$/;
		  var  patternForNationality =/^[a-zA-Z]$/;
		 
		  if(nationaLity =="")
	      {
	        alert("Nationality Must be Fill Out");
			valid=false;
	      }
		  else if(dob == "")
		  {
		     alert("Date Of Birth Must be Fill Out");
			 valid=false;
		  }
		  else if(panNumber == "")
		  {
		     alert("Pan Number Must be Fill Out");
			 valid=false;
		  }
		  else if(!(panNumber.match(patternForPanNumber))) 
		  {
			  alert("Please enter valid PAN Number(10 digits)");
			  valid=false;
		  }
		  else if(aadharNumber =="")
		  {
			   alert("Aadhar Number Must be Fill Out");
			   valid=false;
		  }
		  else if(!(aadharNumber.match(patternForAadharNumber))) 
		  {
			  alert("Please enter valid Aadhar Number(12 digits)");
			  valid=false;
		  }
           else if(bankaccountNumber =="")
		  {
			   alert("Bank Account Number Must be Fill Out");
			   valid=false;
		  }
            else if(!(bankaccountNumber.match(patternForBankAccNumber))) 
		  {
              if(bankaccountNumber.length >= limitForCondition.bankAccNumberlimit)
            	{
            	  alert("Please enter valid Bank Account  Number(Max 16 digits)");
       			  valid=false;
            	}
		 }  
 	}
	
	
 // validation for Address fields
  	if(currentTab==3)
  		 {
  		  var  country= document.getElementById("country").value;
          var  stateName= document.getElementById("state").value;
		  var  cityName = document.getElementById("city").value;
		  var  addressline1= document.getElementById("addressLine1").value;
		  var  pinCode= document.getElementById("pincode").value;
		  var  addressline1= document.getElementById("addressLine1").value;
          var  houseNo= document.getElementById("housenumber")
          var  patternForAddress = /^[a-zA-Z0-9\s,.]{3,}$/ ;
          var  patternForCountry =/[a-zA-Z]{4,}$/;
		  //alert(country);
		  if(country == "") 
		  {
		     alert("Country Must be Fill Out");
			 valid=false;
		  }
		  else if(!(country.match(patternForCountry)))
		  {
		     alert("In Country Name Allow Only Characters");
		     valid=false;
		  }
		  else if(stateName == "")
		  {
		     alert("State Must be Fill Out");
		     valid=false;
		  }
		  else if(cityName == "")
		  {
		     alert("City Must be Fill Out");
		     valid=false;
		  }
		  else if(!(cityName.match(patternForCountry)))
		  {
		     alert("In City Name Allow Only Characters");
		     valid=false;
		  }
		  else if(addressline1 == "")
		  {
		     alert("Address Line1 Must be Fill Out");
		     valid=false;
		  } 
		  else if(pinCode == "")
		  {
		     alert("PINCODE Must be Fill Out");
		     valid=false;
		  }
		  else if(pinCode.length != limitForCondition.pincodeLimit)
		  {
		     alert("PINCODE 	Must And Sould Be 6 Digit ");
		     valid=false;
		  }
		  
  		 }
 
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}
</script>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
