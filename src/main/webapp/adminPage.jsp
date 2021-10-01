<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<style>
    /*set border to the form*/
      
    form {
        border: 3px solid #f1f1f1;
            margin: 40px 446px;
    }
    /*assign full width inputs*/
      
    input[type=text],
    input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }
    /*set a style for the buttons*/
      
    button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
    }
    /* set a hover effect for the button*/
      
    button:hover {
        opacity: 0.8;
    }
    /*set extra style for the cancel button*/
      
    .cancelbtn {
        width: auto;
        padding: 10px 18px;
        background-color: #f44336;
    }
    /*centre the display image inside the container*/
      
    .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
    }
    /*set image properties*/
      
    img.avatar {
        width: 40%;
        border-radius: 50%;
    }
    /*set padding to the container*/
      
    .container {
        padding: 16px;
           /*  margin: 40px 500px; */
    }
    /*set the forgot password text*/
      
    span.psw {
        float: right;
        padding-top: 16px;
    }
    /*set styles for span and cancel button on small screens*/
      
    @media screen and (max-width: 300px) {
        span.psw {
            display: block;
            float: none;
        }
        .cancelbtn {
            width: 100%;
        }
    }
</style>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script> -->
<script>
$(document).ready(function(){
   $('#adminlogin').click(function()
   {
	   var username=$('#username').val();
       var pwd=$('#password').val();
       var dataString = 'username=' + username + '&pwd='
		+ pwd;
       alert(dataString);
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
</head>
<body style="font-family: Futara">
<%
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expire", 0);
	%>
	<jsp:include page="AdminHomePageHeader.jsp"></jsp:include>
    
	<h2 style="text-align: center; font-size: 40px;">Admin Form</h2>
	<!--Step 1 : Adding HTML-->
	<form action="AdminLogin" method="post"> 
	<!-- <form name="adminForm" action="" class="form" id="myForm" method="post"> -->
		<div class="container">
			<label><b>Username</b></label> <input type="text"
				placeholder="Enter Username" name="username" id="username" required> <label><b>Password</b></label>
			<input type="password" placeholder="Enter Password" name="password" id="password" required>

			<button type="submit" onclick="return formSubmit();" id="adminlogin">Login</button>
		</div>

		<!-- <div class="container" style="background-color: #f1f1f1">
			<button type="button" class="cancelbtn">Cancel</button>
			<span class="psw">Forgot <a href="#">password?</a></span>
		</div> -->
	</form>


	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>