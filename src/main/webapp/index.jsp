<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HomePage</title>


<style>
table.a {
	position: absolute;
	left: 980px;
	border: 2px solid black;
	top: 241px;
	
}

table.d {
	position: absolute;
	margin-left:975px;
	border: 2px solid black;
	margin-top: 85px;
	height: 50px;
	background-color:silver
}


table.tab {
	position: absolute;
	margin: auto;
	left: 510px;
	height: 501px;
	border: 2px solid black;
	top: 241px;
}

.buttonHolder {
	font-size: 18px;
	width: 65px;
	text-align: center;
	margin-left: 75px;
	margin-top: 16px;
	background-color: green;
	color: white;
}

.ancr {
	text-align: right;
}
    .vl {
  border-left: 2px solid #000;
  height: 40px;
}
</style>
</head>
<body style="font-family: Futara">
	<jsp:include page="HomePageHeader.jsp"></jsp:include>
	<table style="width:100%; background-color:red; height:40px; border: 2px solid black;">
	  <tr>
	    <th class="vl">Technology</th>
	    <th class="vl">Solutions</th>
	    <th class="vl">Company Policy</th>
	    <th class="vl">Contact Us</th>
	  </tr>
	</table>
	<table width="50%" style="float: left";>
		<tr class="text">
			<td float="left"><img src="exstyle/Images/HomePageImage.jfif"
				height="500px" width="500px"></img></td>
		</tr>
	</table>


	<table class="tab" width="35%" style="float: left">
		<tr>
			<td>
				<h2 align="center">About Employee Managment System</h2>
				<p>
					<strong><font size="3">An employee management
							system is a platform where all work-related as well as important
							personal details of an employee is stored and managed in a secure
							way. By using this system, you can manage admin activities in an
							easier and quicker way.</font></strong>
				</p>
			</td>
		</tr>
	</table>



	<form action="LoginServlet" method="POST" name="loginform" id="login"
		onsubmit="return validation()">
		<center>
			<table class="a" style="padding: 10px; padding-bottom: 487px;"
				width=27%>
              <table class="d" width=25% style=margin-left:985px;>
				<tr>
					<td><h2 style="margin-top: 80px;">Sign in here</h2></td>
				</tr>
				<tr>
					<td>Email id:</td>

					<td><input style="margin-bottom: 10px;" type="text"
						name="email" id="email" /><span id="emailerror"></span></td>
				</tr>

				<tr>
					<td>Password:</td>
					<td><input style="margin-bottom: 10px;" type="password"
						name="password" id="password"><span id="passworderror"></span></td>
				</tr>
				<tr>

					<!-- <input  type="submit" value="Sign in" class="buttonHolder"/> -->
					<!-- <td colspan="2" align="center"><br><br><input style="background:green;color:white; margin-left:80px;font-size:16px;" type="submit" value="Sign in"><br><br> </td> -->

					<td colspan="3" align="center"><input class="buttonHolder"
						type="submit" value="Sign in"></td>

				</tr>

				<tr>
					<!-- <td><a href="Register.jsp" class="ancr">click here to Registered</a></td> -->
					<td colspan="2"><h5 style="margin-top: 18px; margin-left:50px;" align="center">
							Not yet registered ? <a href="Register.jsp">click here to
								Registered</a>
						</h5></td>
				</tr>

				<tr>

					<td colspan="2"><h5 style="margin-top: 1px;" align="center">
							Forgot password ? <a href="">click here</a>
						</h5></td>
				</tr>
			</table>
			</table>
		</center>


	</form>



	<table style="float: clear; margin-bottom:10px;"></table>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr color="#525864" size="3" width="100%">
	<table width="30%" style="float: left;">
		<tr>
			<td><p>
					<strong><font size="4">Contact Us:</font></strong>
				</p>
				<p>
					3rd floor,Virtual Coworkspace,near C21 Mall, Indore.<br> Email
					Id: info@ems.com<br> US Office- 337 Russell St , Hadley MA
					1035<br>South Africa-300 Kempstone Road Port Elizabeth 6001
				</p></td>
		</tr>
	</table>


	<br>
	<br>
	<br>
	<br>
	<jsp:include page="Footer.jsp"></jsp:include>

	<!-- <script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();
		}
	</script> -->

	<script>
		$(document).ready(function() {
			$('#login').onsubmit(function() {
				var email = $('#email').val();
				var password = $('#password').val();
				$.ajax({
					type : "POST",
					url : "LoginServlet",
					data : {
						"email" : email,
						"password" : password
					},
					success : function(data) {
						if (data == 'True') {
							$(location).attr('href', 'Welcome.jsp');
						} else {
							alert('Invalid email and password....');
						}
					}
				});
			});
		});
	</script>

	<script>
		function validation() {

			var email = document.getElementById('email');
			var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

			if (!filter.test(email.value)) {
				alert('Please provide a valid email address');
				email.focus;
				return false;
			}
		}
	</script>

</body>
</html>