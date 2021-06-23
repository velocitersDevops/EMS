<%@ page import="com.velociter.ems.model.*" %>
<%@ page import="com.velociter.ems.database.Operations" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.ListIterator" %>
<%  ArrayList<Country>  countryObject=null;%>

 <%
  // Project projectObject = new Project(); 
   Operations operationObject = new Operations();
   HashMap<Integer,String> mapObject=new HashMap<Integer,String>();//Creating HashMap  
  //out.println("project data  :"+operationObject.getProjectName());
   mapObject = operationObject.getProjectName();
  
   ArrayList<Manager>  arraylistObject=null; 
   arraylistObject = operationObject.getManagerList();
  // out.println("manager name  :"+arraylistObject.get(1).getManagerName());
  //getting country code (ISD code) from country table
  countryObject=operationObject.getCountryCodeList();
   %>

<!DOCTYPE html>
<html>
<head>
<script src="js/JsProperties.js"></script>
<title>Register Page</title>
<style>
table {
  border: 6px solid black;
  border-collapse: collapse;
}

table.center {
  margin-left: auto; 
  margin-right: auto;
}
table.left {
  margin-left: auto; 
  margin-right: auto;
  border: 0px solid black;
}
</style>


<style type="text/css">
 .multipleSelection {
            width: 170px;
            background-color: #f8f8ff;
        }
        .selectBox {
            position: relative;
        }
        .selectBox select {
            width: 90%;
            font-weight: bold;
        }
        
        #checkBoxes {
            display: none;
            border: 1px #8DF5E5 solid;
        }
         
        #checkBoxes label:hover {
            background-color: #f0ffff;
        }
        #checkBoxes label {
        font-size: 10px;
        }
        div.scroll {
		    padding:4px;
		    background-color: white;
			width: 170px;
			height: 60px;
			overflow-y: auto;
			text-align:justify
		}

</style>
<script>
function validateForm() {
  var salutation = document.forms["regiserForm"]["salutation"].value;
  var firstName  = document.forms["regiserForm"]["firstname"].value;
  var middleName = document.forms["regiserForm"]["middlename"].value;
  var lastName   = document.forms["regiserForm"]["lastname"].value;
  var email   = document.forms["regiserForm"]["email"].value;
//   var countryCode=document.forms["regiserForm"]["countrycode"].value;
  var mobileNumber   = document.forms["regiserForm"]["mobile"].value;
  //var alterContactNumber   = document.forms["regiserForm"]["altercontactno"].value;
  var managerName   = document.forms["regiserForm"]["managername"].value;
  var dateOfJoin   = document.forms["regiserForm"]["dateofjoin"].value;
  var projectids   = document.forms["regiserForm"]["ceckvalues"].value;
  var password   = document.forms["regiserForm"]["passsword"].value;
  var confirmpassword   = document.forms["regiserForm"]["confirmpassword"].value;
  
  
  var myDateOFjoin = new Date(dateOfJoin);
  var currentDate = new Date();
  var checkString = /^[a-zA-Z]+$/;
  var mailformat = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;   
  var checkNamewithspace =/^[a-zA-Z\s]*$/;
  var pattern = /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
  var passwordPattern =  /^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,12}$/;
  
//   var options = document.getElementById('projectIds').selectedOptions;
//   var values = Array.from(options).map(({ value }) => value);
//   console.log(values);

  
 
   if (salutation == "") {
        alert("salutation must be filled out");
        document.regiserForm.salutation.focus();
        return false;
      }
      else if(!(salutation.match(checkString))) {
 	    alert("salutation should be containt only characters ");
 	    document.regiserForm.firstname.focus();
 	    return false;
       }
      else if (firstName == "") {
	    alert("First Name must be filled out");
	    document.regiserForm.firstname.focus();
	    return false;
	  }
      else if(!(firstName.match(checkString))) {
	    alert("First Name should be containt only characters ");
	    document.regiserForm.firstname.focus();
	    return false;
      }
       else if( lastName == "") {
   	    alert("Last Name must be filled out");
   	    document.regiserForm.lastname.focus();
   	    return false;
      }
       else if(!(lastName.match(checkString))) {
   	    alert("Last Name should be containt only characters ");
   	    document.regiserForm.lastname.focus();
   	    return false;
      }
       else if( email == "") {
   	    alert("Email must be filled out Like This 'xyz12@gmail.com'");
   	    document.regiserForm.email.focus();
   	    return false;
     }
       else if(!(email.match(mailformat)))
     {
        alert("You have entered an invalid email address!");    //The pop up alert for an invalid email address
        document.regiserForm.email.focus();
        return false;
     }
      
      
       else if (mobileNumber == "" ) {
  		 alert("Mobile Number must be filled out! ");
  		 document.regiserForm.mobile.focus();
  		 return false;
  	}
       else if (mobileNumber.length  < limitForCondition.mobileNumberLimit) {
  		 alert("Mobile Number should not be less than 10 digit  ! ");
  		 document.regiserForm.mobile.focus();
  		 return false;
  	}
      else if( managerName === "Select Manager") {
	    alert("Manager Name must be filled out");
	    document.regiserForm.managername.focus();
	    return false;
    }
      else if(!(managerName.match(checkNamewithspace))) {
	    alert("Manager Name Should be contains Only character and space");
	    document.regiserForm.managername.focus();
	    return false;
    }
      else if( dateOfJoin == "") {
  	    alert("Date Of Joining must be filled out");
  	    return false;
    }
     else if(myDateOFjoin > currentDate ){
  	   alert("You cannot Enter Date Of Joining More Than Current Date");
  	   document.regiserForm.dateofjoin.focus();
  	   return false;
    }
     else if(projectids === "Select Project" ){
   	  alert("Project Name must be filled out");
   	  document.regiserForm.projectIds.focus();
   	  return false;
   	}
//     else if(values.length > limitForCondition.projectLimit){
// 	  alert("You Can select only 1 projects.");
// 	  document.regiserForm.projectIds.focus();
// 	  return false;
// 	}
//     else if(values.length == limitForCondition.projectzero){
//       alert("Please select atlest 1 project");
//       document.regiserForm.projectIds.focus();
//       return false;
//     }
     else if( password == "") {
 	    alert("Password must be filled out");
 	    document.regiserForm.passsword.focus();
 	    return false;
   }
   else if( password.length < limitForCondition.passwordMinLmit ) {
 	    alert("Password should not be less then 8 characters.");
 	    document.regiserForm.passsword.focus();
 	    return false;
   }
   else if( password.length > limitForCondition.passwordMaxLmit ) {
 	    alert("Password should not be grater then 12 characters.");
 	    document.regiserForm.passsword.focus();
 	    return false;
   }
   else if(!(password.match(passwordPattern))) {
 	    alert("Password Allow only a-z,A-Z,0-9, -@ % etc ");
 	    document.regiserForm.passsword.focus();
 	    return false;
   }
   else if( confirmpassword == "") {
 	    alert("Confirm Password must be filled out");
 	    document.regiserForm.confirmpassword.focus();
 	    return false;
   }
   else if( confirmpassword != password ) {
 	    alert("Password And Confirm Password must & Should be Same");
 	    document.regiserForm.confirmpassword.focus();
 	    return false;
   }
  

}

//Change the type of input to password or text
function mouseoverevent() {  
var getPasword = document.getElementById("typepass");  
if (getPasword.type === "password") {  
  getPasword.type = "text";  
} else {  
  getPasword.type = "password";  
}  
}  

function mouseOut() {  
var getPasword = document.getElementById("typepass");  
if (getPasword.type === "text") {  
  getPasword.type = "password";  
} else {  
  getPasword.type = "text";  
}  
}  

function validMobileNumber()
{
	var mobileNumbersRegEx = /[A-Za-z\s]+$/ ;
 	var Mobilenumber  =  document.forms["regiserForm"]["mobile"].value;
	if (Mobilenumber.length>=10 )
	{
		 alert("Mobile Number should not be more than 10 digit  ! ");
		 document.regiserForm.mobile.focus();
		 return false;
	}
      if(Mobilenumber.match(mobileNumbersRegEx))
      {
	    alert("Only allow Numbers !");
	    document.regiserForm.mobile.focus();
	    return false;
       }
}


</script>
 <script>
        var show = true;
  
        function showCheckboxes() {
            var checkboxes =  document.getElementById("checkBoxes");
  
            if  (show){
                checkboxes.style.display = "block";
                show = false;
            } else {
                checkboxes.style.display = "none";
                show = true;
            }
        }
    </script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/16.0.8/css/intlTelInput.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/16.0.8/js/intlTelInput-jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var code = "+91"; // Assigning value from model.
            $('#txtPhone').val(code);
            $('#txtPhone').intlTelInput({
                autoHideDialCode: false,
                autoPlaceholder: "ON",
                dropdownContainer: document.body,
                formatOnDisplay: false,
                hiddenInput: "full_number",
                initialCountry: "auto",
                nationalMode: false,
                placeholderNumberType: "MOBILE",
                preferredCountries: ['US'],
                separateDialCode: true,
                utilsScript: "js/utils.js"
                
            });
            $('#manager').click(function(){
          	  $('#dialCode').val($("#txtPhone").intlTelInput("getSelectedCountryData").dialCode);
          	  $('#mobileNumber').val($('#txtPhone').val());
          	 
          	 }); 
        });
    </script>

</head>
<body>
 <jsp:include page="HomePageHeader.jsp"></jsp:include> 
<form  name="regiserForm" action="register" onsubmit="return validateForm()"  method ="post" >
<br>
		<table class="center" id="left1" style=" width :30%">
		<tr align="center">
		<td>
		
		<table  class ="left" >
		    <tr align="left">
				<td><h3><b>Register</b><br></h3></td> 
			</tr>
			<tr >
				<td><b>Salutation:</b></td>
				<td><input type="text" name ="salutation" style="width: 173px" placeholder="Enter Salutation" ></td>
			</tr>
			<tr >
				<td><b>First Name:</b></td>
				<td><input type="text" name ="firstname" style="width: 173px" placeholder="Enter first name" ></td>
			</tr>
			<tr>
				<td><b>Middle Name:</b></td>
				<td><input type="text" name ="middlename" style="width: 173px" placeholder="Enter middle name "></td>
			</tr>
			<tr>
				<td><b>Last Name:</b></td>
				<td><input type="text" name ="lastname" style="width: 173px" placeholder="Enter last name"></td>
			</tr>
			<tr>
				<td><b>Email:</b></td>
				<td><input type="text" name ="email" style="width: 173px" placeholder="Enter email id"></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td><b>Country Code:</b></td> -->
<!-- 				<td> -->
<!-- 				    <select style="font-size:11px; width: 180px;"  name="countrycode" id="countrycode"  style="width: 173px" >    -->
<!-- 				          <option>Select Country code</option> -->
<%-- 				           <%for(int i=0;i<countryObject.size();i++){ %> --%>
<%--        <option><%=countryObject.get(i).getIsdCode() %></option> --%>
<%--        <%} %> --%>
<!-- 				    </select> -->
				
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<td><b>Mobile Number:</b></td>
<!-- 				<td><input type="text" name ="mobile" style="width: 173px" onkeypress = " return  validMobileNumber() " placeholder="Enter mobile number"></td> -->
                    <td><input style="width:180px" type="tel" id="txtPhone"  name ="mobile" onkeypress = " return  validMobileNumber() "  placeholder="Mobile No...">
     <input type="hidden" id="dialCode" name="dialCode">
     <input type="hidden" id="mobileNumber" name="mobileNumber"></td>
			</tr>
			
			<tr>
				<td><b>Manager Name:</b></td>
<!-- 				<td><input type="text" id="managerName" name ="managername" style="width: 173px"  placeholder="Enter manager name"></td> -->
                    <td> 
                     <select style="font-size:11px; width: 180px;"  name="managername" id="manager"  style="width: 173px">
                           <option> Select Manager</option>
                           <% String managerName = null;
                           ListIterator<Manager> iterator = arraylistObject.listIterator();    
                            while (iterator.hasNext())  
                           {
                            	managerName = iterator.next().getManagerName();
                           %>  
                            <option value=" <%= managerName%>" > <%= managerName%><br> </option>      
                         <%}%>  
                    </select>  
                    
                    </td>
			</tr>
			<tr>
				<td><b>Date Of Join:</b></td>
				<td><input style="width: 173px" type="date" name ="dateofjoin"  ></td>
			</tr>
			<tr>
				<td><b>Select Project Name:</b></td>
 				<td>
                 <select style="font-size:11px;  width: 180px;" name="ceckvalues" id="projectIds"   style="width: 173px">
                  <option>Select Project</option>
                   <%  for(Map.Entry<Integer,String> projectIdAndName : mapObject.entrySet()) 
                   {%> 
                     <option value="<%= projectIdAndName.getKey() %>" > <%=projectIdAndName.getValue() %><br> </option>                 
                  <%}%> 
                 </select>  
				</td>
			</tr>
			<tr>
				<td><b>Password:</b></td>
				<td><input type="Password" name ="passsword" style="width: 173px"  id="typepass" placeholder="Enter password"></td>
			</tr>
			<tr>
			     <td></td>
			    <td><lable onmouseover="mouseoverevent()" onmouseout="mouseOut()" id="lableshowPassword">Show Password</lable></td>
			</tr>
			<tr>
				<td><b>Confirm Password:</b></td>
				<td><input type="Password" name ="confirmpassword" style="width: 173px" placeholder="Enter confirm password"></td>
			</tr>
			<tr>
				<td></td><td></td>
			</tr>
			<tr align="center" >
				<td colspan="2" align="center"><br><br><input style="background:green;color:white;" type="submit" value="Submit"><br><br> </td>
			</tr>
			<tr>
			  <td colspan="2"><h5 align = "center">Already have an account ? <a href="Login.jsp">Sign_in</a></h5></td> 
			</tr>
         </table>
		</td>
		</tr>
	
		</table> 
</form>
 <jsp:include page="Footer.jsp"></jsp:include> 
</body>
</html>
