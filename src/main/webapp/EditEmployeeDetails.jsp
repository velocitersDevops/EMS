
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
   Integer personalInfoId = (Integer)session.getAttribute("personalInfoId");
   Integer addressId = (Integer)session.getAttribute("addressId");
</jsp:scriptlet>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<title>EditEmployeeDetails Page </title>
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
 PersonalInformation personalinfoObject = new PersonalInformation();
 personalinfoObject = operationObject.getPersonalInformation(personalInfoId);
 //out.println("personal info id  data :"+personalInfoId);

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
   Alternate Mobile Number (Optional)
   <% if(employee.getAlternateContactNumber()==0)
	   {%>
    <p><input id="alternateMobileNumber"  placeholder="NA (Not Available)" oninput="this.className = ''" name="alternateMobileNumber"></p>
   <% }
   else
   {%>
    <p><input id="alternateMobileNumber" value=<%=employee.getAlternateContactNumber() %>  placeholder="Alternate Mobile Number not available..." oninput="this.className = ''" name="alternateMobileNumber"></p>
   <%} %>
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
               <select   name="projectName"  class="custom-select selectpicker" id="inputGroupSelect05" aria-label="Example select with button addon">
                       <%  for(Map.Entry<Integer,String> projectIdAndName : mapObject.entrySet()) 
                          {%> 
                            <option value="<%= projectIdAndName.getKey() %>" > <%=projectIdAndName.getValue() %></option>                 
                          <%}%> 
                          
                      </select>
                      </div><br>
  
   Date Of Joining <p><input  disabled="disabled" type="date" value=<%= employee.getDateOfJoining()%>  placeholder="Date of joining..." oninput="this.className = ''"  name="dateOfJoining"></p>
    
  </div>
 
  <jsp:scriptlet>
  
  Family family=operationObject.getFamilyDetailsByFamilyId(familyId);
  if(familyId!=0 && family!=null)
  {
	   family=operationObject.getFamilyDetailsByFamilyId(familyId);
  
  </jsp:scriptlet>
  <div class="tab">Family Details:<br><br>
   Father Name <p><input id="fatherName" placeholder="Father name..."  value=<%= family.getFatherName()%>  oninput="this.className = ''" name="fatherName"></p>
   Mother Name <p><input id="motherName" placeholder="Mother name..."  value=<%= family.getMotherName()%>   oninput="this.className = ''" name="motherName"></p>
   Spouse Name <%if(family.getSpouseName()==null)
	   {%> 
   <p><input id="spouseName" placeholder="NA"  oninput="this.className = ''" name="spouseName"></p>
   <%} else { %>
   <p><input id="spouseName" placeholder="Enter spouse Name" value=<%=family.getSpouseName() %>    oninput="this.className = ''" name="spouseName"></p>
 <%} %> </div>
 <jsp:scriptlet>
  }
  
  else
  {
 </jsp:scriptlet>
 
  <div class="tab">Family Details:<br>
  Father Name  <p><input id="fatherName" placeholder="Father name..."    oninput="this.className = ''" name="fatherName"></p>
  Mother Name  <p><input id="motherName" placeholder="Mother name..." oninput="this.className = ''" name="motherName"></p>
  Spouse Name (Optional)  <p><input id="spouseName" placeholder="Spouse name..." oninput="this.className = ''" name="spouseName"></p>
  </div>
  
  <jsp:scriptlet>
}
  </jsp:scriptlet>
 
 <%
if( personalinfoObject.getDateOfBirth()!=null && personalinfoObject.getSex() != null )
{
%>
  <div class="tab"> Personal Information :<br><br>
     <input type="hidden"   name="personalinfoid" value="<%=personalInfoId %>">
    Date Of Birth <p><input disabled="disabled"  value="<%=personalinfoObject.getDateOfBirth() %>"   placeholder="Date of Birth" oninput="this.className = ''" id ="dobdate" name="dateOfbirth"></p>
    Sex :  <p><select disabled="disabled" name="sex" value="<%=personalinfoObject.getSex() %>" style="width: 90px; style="font-size:9px">
                      <option  value="Male">Male </option>  
                      <option  value="Female">Female </option>    
                    </select></p>
    PAN Number<p><input disabled="disabled"  value="<%=personalinfoObject.getPanNumber() %>" placeholder="PAN Number..." oninput="this.className = ''"id ="pannumber" name="pannumber"></p>
    Aadhar Number<p><input disabled="disabled" value="<%=personalinfoObject.getAadharNumber() %>" placeholder="Aadhar Number..." oninput="this.className = ''" id ="aadharnumber" name="aadharnumber"></p>
    Passport Number<b><lable style="color:green">(Optional)</lable></b>
    <%if(personalinfoObject.getPassportNumber()==null)
	   {%> 
	   <p><input   placeholder="NA"  id ="passportnumber" oninput="this.className = ''" name="passportnumber"></p>
     <%} else { %>
        <p><input   placeholder="Enter Passport Number..."  id ="passportnumber" oninput="this.className = ''" name="passportnumber"></p>
     <%} %>
    Bank Account Number<p><input value="<%=personalinfoObject.getBankAccountNumber() %>" placeholder="Bank Account Number..."  id ="bankAccountNumber"oninput="this.className = ''"id ="bankaccountNumber" name="bankaccountNumber"></p>
    Nationality<p><input disabled="disabled"  value="<%=personalinfoObject.getNationality() %>" placeholder="Nationality..." oninput="this.className = ''" id ="nationality" name="nationality"></p>
    Marital Status <p><select    oninput="this.className = ''" name="marritalstatus"  >
                      <option  value="Single">Single </option>  
                      <option  value="Married">Married </option>    
                    </select></p>
    </div>
    <%} 
     else
     {%>
     
      
    <div class="tab"> Personal Information :<br><br>
   
    Date Of Birth <p><input  type="date"   placeholder="Date of Birth" oninput="this.className = ''" id ="dobdate"  name="dateOfbirth"></p>
    <p>Sex :  <select name="sex"  style="width: 90px; style="font-size:9px" >
                      <option  value="Male">Male </option>  
                      <option  value="Female">Female </option>    
                    </select></p>
    PAN Number<p><input  placeholder="PAN Number..." oninput="this.className = ''" id ="pannumber" name="pannumber"></p>
    AadharNumber<p><input  placeholder="Aadhar Number..." oninput="this.className = ''"  id ="aadharnumber" name="aadharnumber"></p>
    Passport Number<b><lable style="color:green">(Optional)</lable></b><p><input value="" placeholder="Passport Number..." id ="passportnumber" oninput="this.className = ''" name="passportnumber"></p>
    Bank Account Number<p><input  placeholder="Bank Account Number..." oninput="this.className = ''" id ="bankaccountNumber" name="bankaccountNumber"></p>
    Nationality<p><input  placeholder="Nationality..." oninput="this.className = ''" id ="nationality" name="nationality"></p>
    Marital Status <p><select      oninput="this.className = ''" name="marritalstatus" >
                      <option  value="Single">Single </option>  
                      <option  value="Married">Married </option>    
                    </select></p>
    </div>
     <% } 
     %>
     <%
     Address getAddressObject = new Address();
     getAddressObject = operationObject.getAddressDetails(addressId);
     if(getAddressObject.getAddressId() != 0 && getAddressObject.getAddressLine1() != null)
     {
     %>
  <div class="tab">Address:<br><br>
  
    Country<p><input value="<%=getAddressObject.getCountryName()  %>" placeholder="Enter Pin Code..." oninput="this.className = ''" id ="country" name="country"></p>
    State<p><input value="<%=getAddressObject.getStateName() %>" placeholder="Enter State/Province/Region..." oninput="this.className = ''"id ="state"  name="state"></p>
    City<p><input value="<%=getAddressObject.getCityName()  %>" placeholder="Enter City Name..." oninput="this.className =''"id ="city" name="city"></p>
    House Number<p><input value="<%=getAddressObject.getHouseNumber()  %>" placeholder="Enter House No..." oninput="this.className = ''"id ="housenumber" name="housenumber"></p>
      <% 
        String addressData =getAddressObject.getAddressLine1();
        String[] bothAddresses = addressData.split("-"); 
        out.println("address data :"+addressData); 
      %> 
    Address Line 1<p><input value="<%=bothAddresses[0]  %>" placeholder="Enter Address Line1..." oninput="this.className = ''"id="addressLine1" name="addressLine1"></p>
    Address Line 2<b><lable style="color:green">(Optional)</lable></b><p><input value="<%=bothAddresses[1] %>" placeholder="Enter Address Line2" oninput="this.className = ''"id="addressLine2" name="addressLine2"></p>
     Street Number<b><lable style="color:green">(Optional)</lable></b><p><input  placeholder="Enter Street Number" oninput="this.className = ''"id="streetnumber" name="streetnumber"></p>
    Pin Code<p><input value="<%=getAddressObject.getPincodeNumber()  %>" placeholder="Enter Pin Code..." oninput="this.className =''"id="pincode" name="pincode"></p>
    Address Type <p><select  oninput="this.className = ''" name="addressType"  >
                      <option  value="0">Permanent </option>  
                      <option  value="1">Temporary </option>    
                    </select>
                    </p>
   </div>
  <%}
     else
     {%>
      <div class="tab">Address:<br><br>
  
    Country<p><input  placeholder="Enter Country Name..." oninput="this.className = ''"id ="country" name="country"></p>
    State<p><input  placeholder="Enter State..." oninput="this.className = ''"id ="state" name="state"></p>
    City<p><input  placeholder="Enter City Name..." oninput="this.className =''" id ="city" name="city"></p>
    House Number<p><input  placeholder="Enter House No..." oninput="this.className = ''"id ="housenumber" name="housenumber"></p>
    Address Line 1<p><input  placeholder="Enter Address Line1..." oninput="this.className = ''"id="addressLine1" name="addressLine1"></p>
    Address Line 2<b><lable style="color:green">(Optional)</lable></b><p><input  placeholder="Enter Address Line2" oninput="this.className = ''"id="addressLine2" name="addressLine2"></p>
    Street Number<b><lable style="color:green">(Optional)</lable></b><p><input  placeholder="Enter Street Number" oninput="this.className = ''"id="streetnumber" name="streetnumber"></p>
    Pin Code<p><input  placeholder="Enter Pin Code..." oninput="this.className =''"id="pincode" name="pincode"></p>
    Address Type
    <select  oninput="this.className = ''" name="addressType"  >
                      <option  value="0">Permanent </option>  
                      <option  value="1">Temporary </option>    
                    </select>
                    </p>
  
   </div>
    <jsp:include page="Footer.jsp"></jsp:include>
   <%} %>
 
  <div style="overflow:auto;">
    <div style="float:right;decoration:none">
      <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
      <button type="button" id="nextBtn" onclick="nextPrev(1)">Submit</button>
    </div>
  </div>
  <!-- Circles which indicates the steps of the form: -->
  <div style="text-align:center;margin-top:40px;">
    <span class="step"></span>
    <span class="step"></span>
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
  
  var alternateMobileNumberPattern=/[A-Za-z\s]+$/;
  var familyNamePattern=/^[a-zA-Z]+$/;
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
          if(alternateMobileNumber.length!=10)
        	  {
        	  alert("Please enter valid number");
        	  valid=false;
        	  }
        }
	      if(values.length == limitForCondition.projectzero){
	         alert("Please select atlest 1 project");
	         valid=false;
	       }
	      if(values.length > limitForCondition.projectLimit){
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
		 if(!motherName.match(familyNamePattern))
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
		  var  nationalitY = document.getElementById("nationality").value;
		  var  patternForPanNumber = /[A-Z]{5}[0-9]{4}[A-Z]{1}/;
		  var  patternForAadharNumber = /^[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}$/;
		  var  patternForPassport = /^[A-PR-WYa-pr-wy][1-9]\\d\\s?\\d{4}[1-9]$/;
		  var  patternForBankAccNumber = /^[3-9][0-9]$/;
		  var  patternForNationality =/^[a-zA-Z]$/;
		  if(dob == "")
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
              if(bankaccountNumber.length >= 16 )
            	{
            	  alert("Please enter valid Bank Account  Number(Max 16 digits)");
       			  valid=false;
            	}
		 }
         else if(nationalitY =="")
         {
          alert("Nationality Must be Fill Out");
		  valid=false;
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
		  
		  if(country == "")
		  {
		     alert("Country Must be Fill Out");
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
