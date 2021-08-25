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
<title>Add Project Page</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
</head>
<body style="font-family: Futara">
	<jsp:include page="HomePageHeader.jsp"></jsp:include>
	<form class="form" id="myForm" action="" method="post">
		<br> <br> <br> <br> <br>
		<fieldset>
			<legend align="center">ADD PROJECT DETAILS</legend>
			<table align="center">
				<tr>
					<td><label>Project Name:</label></td>
					<td><input type="text" name="projectName" id="projectName"
						size="30"></td>
				</tr>
				<tr>
					<td><label>Project Descriptions :</label></td>
					<td><textarea name="description" id="description" rows="4"
							cols="32" style="overflow: auto; resize: none"> </textarea></td>
				</tr>
				<tr>
					<td><label>Project Start Date</label></td>
					<td><input type="date" name="startdate" id="startdate"></td>
				</tr>
				<tr>
					<td><label>Project End Date </label></td>
					<td><input type="date" name="enddate" id="enddate"></td>
				</tr>
				<tr>
					<td align="center"><br> <br> <input type="submit"
						value="Submit" onclick="return formSubmit();"></td>
					<td align="center"><br> <br> <input type="Reset"
						value="Reset"></td>
				</tr>
			</table>
		</fieldset>
	</form>
	<script>
		function formSubmit() {
			var projectName = document.getElementById("projectName").value;
			var description = document.getElementById("description").value;
			var startdate = document.getElementById("startdate").value;
			var enddate = document.getElementById("enddate").value;
			var dataString = 'projectName=' + projectName + '&description='
					+ description + '&startdate=' + startdate + '&enddate='
					+ enddate;
			alert("Do You Want to Add Project !!!!");
			jQuery.ajax({
				url : "AddProjectServlet",
				data : dataString,
				type : "POST",
				success : function(data) {
					$("#myForm").html(data);
					alert("Successfully Added Project !!!!");
				},
				error : function() {
					alert("Something Want Wrong !!!!");
				}
			});
			return true;
		}
	</script>

</body>
</html>