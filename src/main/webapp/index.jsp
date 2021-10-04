<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
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

.row table {
	width: 100%;
	background-color: red;
	height: 40px;
	border: 2px solid black;
}

.vl {
	border-left: 2px solid #000;
	height: 40px;
}

.row-1 {
	height: 60vh;
}

.column {
	float: left;
	/* padding: 10px; */
	height: 500px;
	border: 2px solid #000;
}

.left {
	width: 77%;
	/* background-color: #aaa; */
}

.right {
	width: 23%;
	/* background-color: #bbb; */
}

.row-1:after {
	content: "";
	display: table;
	clear: both;
}

.right .border {
	margin: 30px 14px;
	height: 444px;
	border: 2px solid #000;
	border-radius: 24px;
}
</style>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
</head>
<body style="font-family: Futara">
	<jsp:include page="HomePageHeader.jsp"></jsp:include>

	<div class="row">
		<table>
			<tr>
				<th class="vl">Technology</th>
				<th class="vl">Solutions</th>
				<th class="vl">Company Policy</th>
				<th class="vl">Contact Us</th>
			</tr>
		</table>
	</div>
	<div class="row-1">
		<div class="column left">
			<div class="curve">
				<table width="" style="float: left;">
					<tr class="text">
						<td float="left"><img src="exstyle/Images/HomePageImage.jfif"
							style="background-color: #8aa7ca; height: 492px; width: 350px; -moz-border-radius-bottomright: 25px 50px; border-bottom-right-radius: 500px 700px;"></img></td>
					</tr>
				</table>
			</div>
			<div class="tab" width="77%" style="float: left">
				<h2 align="center" style="margin-top: -472px;">About Employee
					Managment System</h2>
				<p style="margin-top: 28px;">
					<strong><font size="3">An employee management
							system is a platform where all work-related as well as important
							personal details of an employee is stored and managed in a secure
							way. By using this system, you can manage admin activities in an
							easier and quicker way.Many employers have suffered from data
							breaches, making your employee information fair game for online
							hackers. Relying on paper files can also expose personal
							information if it falls into the wrong hands. With an employee
							management system in place, protect private information like bank
							accounts, social security numbers, check stubs, and more with
							robust safety measures. Failing to do so can prove costly. </font></strong>
				</p>
			</div>
		</div>
		<div class="column right">
			<div class="border">
				<form class="form" id="myForm" name="loginForm" action=""
					method="post">
					<table class="box">
						<h2 style="margin: 50px 24px;">Employee Sign In Here</h2>
						<tr>
							<td>Email id:</td>
							<td><input style="margin-bottom: 10px;" type="text"
								name="email" id="email" /></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input style="margin-bottom: 10px;" type="password"
								name="password" id="password"></td>
						</tr>
						<tr>
							<td colspan="3" align="center"><input class="buttonHolder"
								type="submit" value="Sign in" onclick="return formSubmit();"></td>
						</tr>
						<tr>
							<td colspan="2"><h5
									style="margin-top: 18px; margin-left: 50px;" align="center">
									Not yet registered ? <a href="Register.jsp">click here to
										Registered</a>
								</h5></td>
						</tr>
						<tr>
							<td colspan="2"><h5 style="margin-top: 1px;" align="center">
									Forgot password ? <a href="#">click here</a>
								</h5></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<hr style="border-bottom: 4px solid #000;" />
	<div style="height: 25vh; margin-bottom: 23px;">
		<p>
			<strong><font size="4">Contact Us:</font></strong>
		</p>
		<p>
			3rd floor,Virtual Coworkspace,near C21 Mall, Indore.<br> Email
			Id: info@ems.com<br> US Office- 337 Russell St , Hadley MA 1035<br>South
			Africa-300 Kempstone Road Port Elizabeth 6001
		</p>
	</div>

	<script>
		function formSubmit() {
			var email = document.getElementById("email").value;
			var password = document.getElementById("password").value;
			var dataString = 'email=' + email + '&password=' + password;
			/* alert(dataString); */
			var emailpattern = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
			var passwordpattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{5,15}$/;

			if (email == "") {
				alert("email must be filled out");
				document.loginForm.email.focus();
				return false;
			} else if (!(email.match(emailpattern))) {
				alert("email should be containt only valid.");
				document.loginForm.email.focus();
				return false;
			} else if (password == "") {
				alert("password Name must be filled out");
				document.loginForm.password.focus();
				return false;
			} else if (!(password.match(passwordpattern))) {
				alert("password should be containt only valid.");
				document.loginForm.password.focus();
				return false;
			}else{
				jQuery.ajax({
					url : "LoginServlet",
					data : {
						"email" : email,
						"password" : password
						},
					type : "post",
					success : function(data) {
						if (data == 'True') {
							alert("You have Successfully Login!!!");
							$(location).attr('href', 'Welcome.jsp');
						} else {
							alert("Please Enter valid email and password.")
						}
					}
				});
			}
				return false;
		}
	</script>

	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>