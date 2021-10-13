<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>

<fmt:setBundle basename="label" />

<!DOCTYPE html>
<html>
<head>
<link href="exstyle/style.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style>
input {
	font-family: Futara;
}
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
       $('#login').click(function()
       {
    	   var email=$('#email').val();
           var pwd=$('#password').val();
    	   var emailpattern = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
   		var passwordpattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{5,15}$/;

   		if (!email.match(emailpattern)) {
   			alert("<fmt:message key="label.enter_email"></fmt:message>");
   			return flag;
   		}
   		if (!pwd.match(passwordpattern)) {
			alert("Password should contain atleast one LowerCase ,UpperCase,Digit,Special Character and length should be more than 5");
			return flag;
		}
   		else
   			{
   			//alert("hii");          
          //alert(email+" "+pwd);
          $.ajax({
               type: "POST",
               url:"LoginServlet",
               data:{"email":email,"password":pwd},
               success: function (data) { 
                  if(data=='True'){
                    $(location).attr('href','Welcome.jsp');
                  }else{
                      alert('Please Enter valid email and password');
                  }
               }
             });  
    		   }         
           });
         });
   </script>


<script> 
 	function validation() {
		var email = document.email.value;
		alert(email);
		var password = document.loginform.password.value;
 		var flag = false;

		var emailpattern = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
		var passwordpattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{5,15}$/;

 		if (!email.match(emailpattern)) {
 			alert("<fmt:message key="label.enter_email"></fmt:message>");
 			return flag;
 		}

 		if (!password.match(passwordpattern)) {
 			alert("Password should contain atleast one LowerCase ,UpperCase,Digit,Special Character and length should be more than 5");
 			return flag;
 		}
 	}
 </script> 
<title>Login Page</title>
<link rel="stylesheet" href="exstyle/style.css">

<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
</head>

<body style="font-family: Futara">

	<%
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expire", 0);
	%>

	<jsp:include page="HomePageHeader.jsp"></jsp:include>
	<h2 style="text-color: green; padding-left: 300px"><jsp:include
			page="Message.jsp"></jsp:include></h2>
<!-- 	<form style="width: 300px; padding-top: 100px; padding-left: 250px" -->
<!-- 		 name="loginform" id="" -->
<!-- 		onsubmit="return validation()"> -->
		<div style="padding-left: 500px;width: 300px; padding-top: 100px;" name="loginform">
          
			<fieldset>
				<!-- Legend tag using -->
				<b></b>
				<legend>
					Login:</b>
				</legend>

				<table>
					<tr>
						<td><b><fmt:message key="label.emailid"></fmt:message><b></td>
						<td><input type="text" name="email" id="email"><span
							id="emailerror"></span></td>
					</tr>

					<tr>
						<td><b><fmt:message key="label.password"></fmt:message></b></td>
						<td><input type="password" name="password" id="password" onkeypress = " return validation() "><span
							id="passworderror"></span></td>
					</tr>
					<tr>
						<td><button type="submit" id="login" >Submit</button></td>

					</tr>


				</table>
			</fieldset>
		</div>
	
	
	
	<br>
	<br>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>