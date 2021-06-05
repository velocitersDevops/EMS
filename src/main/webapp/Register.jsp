<%@ page import="com.velociter.ems.model.Project" %>
<%@ page import="com.velociter.ems.database.Operations" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

 <%
   Project projectObject = new Project(); 
   Operations operationObject = new Operations();
   HashMap<Integer,String> mapObject=new HashMap<Integer,String>();//Creating HashMap  
  //out.println("project data  :"+operationObject.getProjectName());
   mapObject = operationObject.getProjectName();
  
   %>

<!DOCTYPE html>
<html>
<head>
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
         #checkBoxes label {
            display: block;
        }
        #checkBoxes label:hover {
            background-color: #f0ffff;
        }
        #checkBoxes label {
        font-size: 9px;
        }
        div.scroll {
		    padding:4px;
		    background-color: white;
			width: 170px;
			height: 80px;
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
  var mobileNumber   = document.forms["regiserForm"]["mobile"].value;
  var alterContactNumber   = document.forms["regiserForm"]["altercontactno"].value;
  var managerName   = document.forms["regiserForm"]["managername"].value;
  var dateOfJoin   = document.forms["regiserForm"]["dateofjoin"].value;
  var projectIds   = document.forms["regiserForm"]["projectId"].value;
  var password   = document.forms["regiserForm"]["passsword"].value;
  var confirmpassword   = document.forms["regiserForm"]["confirmpassword"].value;
  
  
  var myDateOFjoin = new Date(dateOfJoin);
  var currentDate = new Date();
  var checkString = /^[a-zA-Z]+$/;
  var mailformat = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;   
  var checkNamewithspace =/^[a-zA-Z\s]*$/;
  var pattern = /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
  var passwordPattern =  /^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,12}$/;
  
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
       else if (mobileNumber.length<10 ) {
  		 alert("Mobile Number should not be less than 10 digit  ! ");
  		 document.regiserForm.mobile.focus();
  		 return false;
  	}
       else if (alterContactNumber == "" ) {
  		 alert("Alter Contact Number must be filled out! ");
  		 document.regiserForm.mobile.focus();
  		 return false;
    }
       else if (alterContactNumber.length<10) {
  		 alert("Alter Contact Number  should not be less than 10 digit  !");
  		 document.regiserForm.altercontactno.focus();
  		 return false;
  	}
      else if( managerName == "") {
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
     else if(myDateOFjoin > currentDate )
   {
  	   alert("You cannot Enter Date Of Joining More Than Current Date");
  	   document.regiserForm.dateofjoin.focus();
  	   return false;
   }

     else if( password == "") {
 	    alert("Password must be filled out");
 	    document.regiserForm.passsword.focus();
 	    return false;
   }
   else if( password.length < 8 ) {
 	    alert("Password should not be less then 8 characters");
 	    document.regiserForm.passsword.focus();
 	    return false;
   }
   else if( password.length >12 ) {
 	    alert("Password should not be grater then 12 characters");
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

function validAlterMobileNumber() 
{
	var mobileNumbersRegEx = /[A-Za-z\s]+$/ ;
	var alterMobilenumber  =  document.forms["regiserForm"]["altercontactno"].value;
	if (alterMobilenumber.length>=10) 
	{
		alert("Alter Contact Number  should not be more than 10 digit Only allow Numbers !");
		document.regiserForm.altercontactno.focus();
		return false;
    }
	if(alterMobilenumber.match(mobileNumbersRegEx))
	{
		alert("Only allow Numbers !");
	    document.regiserForm.altercontactno.focus();
	    return false;
    }
}

</script>
 <script>
        var show = true;
  
        function showCheckboxes() {
            var checkboxes =  document.getElementById("checkBoxes");
  
            if (show) {
                checkboxes.style.display = "block";
                show = false;
            } else {
                checkboxes.style.display = "none";
                show = true;
            }
        }
    </script>


</head>
<body>
<form  name="regiserForm" action="register" onsubmit="return validateForm()"  method ="post" >
<br>
		<table class="center" style=" width :30%">
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
			<tr>
				<td><b>Mobile Number:</b></td>
				<td><input type="text" name ="mobile" style="width: 173px" onkeypress = " return  validMobileNumber() " placeholder="Enter mobile number"></td>
			</tr>
			<tr>
				<td><b>Alternate Contact Number:</b></td>
				<td><input type="text" name ="altercontactno" style="width: 173px" onkeypress = "return validAlterMobileNumber()" placeholder="alternate contact no"></td>
			</tr>
			<tr>
				<td><b>Manager Name:</b></td>
				<td><input type="text" name ="managername" style="width: 173px"  placeholder="Enter manager name"></td>
			</tr>
			<tr>
				<td><b>Date Of Join:</b></td>
				<td><input style="width: 173px" type="date" name ="dateofjoin"  ></td>
			</tr>
			<tr>
				<td><b>Select Project:</b></td>
				<td> <div class="multipleSelection">
            <div class="selectBox" onclick="showCheckboxes()">
                <select name="projectids" style="width: 177px">
                    <option></option>
                </select>
                
            </div>
  
            <div id="checkBoxes">
                <label for="first">
                <div class="scroll">
                  <%  for(Map.Entry<Integer,String> projectIdAndName : mapObject.entrySet()) 
                  {%>  
		             <input type="checkbox" id="first"   name="projectId" value="<%= projectIdAndName.getKey() %>" /> <%=projectIdAndName.getValue() %> <br>        
                <%}%> 
			        </div>
                </label><br>
                  
               
            </div>
        </div>
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

</body>
</html>
