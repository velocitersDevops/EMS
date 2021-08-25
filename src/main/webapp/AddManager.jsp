<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
input {
	font-family: Futara;
}

fieldset {
	height: 100%;
	width: 50%;
	background: #ffffff;
	margin-left: 310px;
}
</style>
<meta charset="ISO-8859-1">
<!-- <script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
 -->
<title>Add Manager Page</title>
</head>
<body style="font-family: Futara">
	<jsp:include page="HomePageHeader.jsp"></jsp:include>
	<form name="vinform" method="post">
		<br> <br> <br> <br> <br> <span id="amit">
		</span>
		<fieldset>
			<legend align="center">ADD MANAGER NAME</legend>
			<table align="center">
				<tr>
					<td><label>Manager Name:</label></td>
					<td><input type="text" id="txt_name" name="managerName"
						size="30"></td>
				<tr>
					<td align="center"><r> <br>
						<input type="submit" value="Submit" onClick="sendInfo()"></td>
					<td align="center"><br> <br> <input type="Reset"
						value="Reset"></td>
				</tr>
			</table>
		</fieldset>
	</form>
	<script>
		var request;
		function sendInfo() {
			var v = document.vinform.managerName.value;
			var url = "AddManagerServlet?val=" + v;

			if (window.XMLHttpRequest) {
				request = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				request = new ActiveXObject("Microsoft.XMLHTTP");
			}
			try {
				request.onreadystatechange = getInfo;
				request.open("POST", url, true);
				request.send();
				alert("Do You Want to Add Manager !!!!");
				console.log("register page");
				window.location.href='Register.jsp'; //whatever
			} catch (e) {
				alert("Unable to connect to server");
			}
		}

		function getInfo() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('amit').innerHTML = val;
			}
		}
	</script>
	<!-- <script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			$("#btn").click(function(){
				var vname = $("#txt_name").val();
					if(vname==''){
						alert("Please fill out the form");
					}else if(vname==''){alert('Name field is required')}
					else{
						$.post("AddManagerServlet", //Required URL of the page on server
						{name:vname},
					function(response,status){ // Required Callback Function
							$('#response pre').html( name );
					alert("*----Received Data----*nnResponse : " + response+"nnStatus : " + status);//"response" receives - whatever written in echo of above PHP script.
					$("#form")[0].reset();
					});
				}
			});
		});
	</script> -->
</body>
</html>