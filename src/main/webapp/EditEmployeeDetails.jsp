
<%@page import="java.sql.*"%>
<%@page import="com.velociter.ems.database.DatabaseConnection"%>
<%@page import="com.velociter.ems.database.Operations"%>
<%@page import="com.velociter.ems.model.Employee"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@page import="com.velociter.ems.model.Family"%>
<%@page import="com.velociter.ems.model.*"%>
<%@page import="java.util.*"%>
<%  ArrayList<Manager>  managerObject=null;%>
<%  ArrayList<Project>  projectObject=null;%>
<jsp:scriptlet>

   Integer empId=(Integer)session.getAttribute("empId");
   Integer familyId=(Integer)session.getAttribute("familyId");
   
</jsp:scriptlet>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">


<link rel="stylesheet" href=
"https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css">
  
    <script src=
"https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js">
    </script>
  
    <script src=
"https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js">
    </script>
  
    <!-- Default bootstrap CSS link taken from the 
        bootstrap website-->
    <link rel="stylesheet" href=
"https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  
    <script src=
"https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js">
    </script>

<script>
        $(document).ready(function() {
            $("#").select2({
               
            });
        })
    </script>



<style>
* {
  box-sizing: border-box;
}

body {
  background-color: #f1f1f1;
}

#editForm {
  background-color: #ffffff;
  margin: 100px auto;
  font-family: Raleway;
  padding: 40px;
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
  font-family: Raleway;
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



<jsp:scriptlet>
	Operations operationObject=new Operations();
	Employee employee=operationObject.getEmployeeDetailsByEmployeeId(empId);
	managerObject=operationObject.getManagerList();
	projectObject=operationObject.getProjectList();
</jsp:scriptlet>
        
        <%
HashMap<Integer,String> mapObject=new HashMap<Integer,String>();//Creating HashMap  
//out.println("project data  :"+operationObject.getProjectName());
 mapObject = operationObject.getProjectName();

%>
        <jsp:include page="Header.jsp"></jsp:include>


<form id="editForm" action="EditEmployeeDetailsServlet" method="POST" onsubmit="return validateForm()">
  <h1>Edit Employee Details:</h1>
  <!-- One "tab" for each step in the form: -->
  <div class="tab">First Name
  
    <p><input  disabled="disabled" value=<%= employee.getFirstName()%> placeholder="First name..." oninput="this.className = ''" name="firstName"></p>
   Middle Name: <p><input disabled="disabled" value=<%= employee.getMiddleName()%> placeholder="Middle name..." oninput="this.className = ''" name="middleName"></p>
   Last Name <p><input disabled="disabled" value=<%= employee.getLastName()%> placeholder="Last name..." oninput="this.className = ''" name="lastName"></p>
   Email Id<p><input disabled="disabled" value=<%= employee.getEmailId()%> placeholder="Email Id..." oninput="this.className = ''" name="emailId"></p>
   Mobile Number <p><input disabled="disabled" value=<%= employee.getMobileNumber()%> placeholder="Mobile Number..." oninput="this.className = ''" name="mobileNumber"></p>
   Alternate Mobile Number  <p><input value=<%= employee.getAlternateContactNumber()%> placeholder="Alternate Mobile Num..." oninput="this.className = ''" name="alternateMobileNumber"></p>
    ManagerName 
    <div class="input-group" style="width:600px">
<%--      <p><input multiple="multiple" value=<%=employee.getManagerName() %> placeholder="Manager name..." oninput="this.className = ''" name="managerName" list="list"></p>  --%>
      <select name="managerName" class="custom-select" id="inputGroupSelect04" aria-label="Example select with button addon">
       <%for(int i=0;i<managerObject.size();i++){ %>
       <option><%=managerObject.get(i).getManagerName() %></option>
       <%} %>
       </select>
       </div>    
  <br>
<%--  Project Name  <p><input  value=<%= employee.getProjectId() %> placeholder="Project name..." oninput="this.className = ''" name="projectId"  ></p> --%>

Project Name <div   class="input-group " style="width:600px">
               <select   name="projectName" multiple="multiple" class="custom-select selectpicker" id="inputGroupSelect05" aria-label="Example select with button addon">
                       <%  for(Map.Entry<Integer,String> projectIdAndName : mapObject.entrySet()) 
                          {%> 
                            <option value="<%= projectIdAndName.getKey() %>" > <%=projectIdAndName.getValue() %><br> </option>                 
                          <%}%> 
                          
                      </select>
                      </div><br>
  
   Date Of Joining <p><input  disabled="disabled" type="date" value=<%= employee.getDateOfJoining()%>  placeholder="Date of joining..." oninput="this.className = ''"  name="dateOfJoining"></p>
    
  </div>
  <jsp:include page="Footer.jsp"></jsp:include>
  <jsp:scriptlet>
  
  
  Family family=operationObject.getFamilyDetailsByFamilyId(familyId);
  if(familyId!=0 && family!=null)
  {
	   family=operationObject.getFamilyDetailsByFamilyId(familyId);
  
  </jsp:scriptlet>
  <div class="tab">Family Details:<br><br>
   Father Name <p><input placeholder="Father name..."  value=<%= family.getFatherName()%>  oninput="this.className = ''" name="fatherName"></p>
   Mother Name <p><input placeholder="Mother name..."  value=<%= family.getMotherName()%>   oninput="this.className = ''" name="motherName"></p>
   Spouse Name <p><input placeholder="Spouse name..."  value=<%= family.getSpouseName()%>  oninput="this.className = ''" name="spouseName"></p>
  </div>
 <jsp:scriptlet>
  }
  
  else
  {
 </jsp:scriptlet>
 
  <div class="tab">Family Details:
    <p><input placeholder="Father name..."    oninput="this.className = ''" name="fatherName"></p>
    <p><input placeholder="Mother name..." oninput="this.className = ''" name="motherName"></p>
    <p><input placeholder="Spouse name..." oninput="this.className = ''" name="spouseName"></p>
  </div>
  
  <jsp:scriptlet>
}
  </jsp:scriptlet>
 
  <div style="overflow:auto;">
    <div style="float:right;decoration:none">
      <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
      <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
    </div>
  </div>
  <!-- Circles which indicates the steps of the form: -->
  <div style="text-align:center;margin-top:40px;">
    <span class="step"></span>
    <span class="step"></span>
    
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
  
  var options = document.getElementById('inputGroupSelect05').selectedOptions;
  var values = Array.from(options).map(({ value }) => value);
  console.log(values);
  
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
	  var alternateMobileNumber=y[1].value;
      var firstNamePattern="[a-zA-Z]{3,30}";
      
	     if(!alternateMobileNumber.match(firstNamePattern))
    	  {
    	   alert("Please enter valid name");
    	   valid=false;
    	  }
	     else if(values.length == limitForCondition.projectzero){
	         alert("Please select atlest 1 project");
	         valid=false;
	       }
	     else if(values.length > limitForCondition.projectLimit){
	   	  alert("You Can select only 1 projects.");
	   	 valid=false;
	   	  
	   	}
	    

	  
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
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

</body>
</html>
