<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
 fieldset {
      height: 100%;
      width: 50%;
      background: #ffffff;
    }
</style>
<meta charset="ISO-8859-1">
<title>Add Project Page</title>
</head>
<body>
 <jsp:include page="HomePageHeader.jsp"></jsp:include> 
<form action ="AddProjectServlet" method="post">
		<br><br><br><br><br>
	
			     <fieldset>
					<legend align="center">ADD PROJECT DETAILS</legend>
					<table align="center">
					<tr>
					 <td><label >Project Name:</label> </td> <td><input type ="text" name ="projectName" size="30"> </td>
					</tr>
					<tr>
					 <td><label >Project Descriptions :</label> </td> <td><textarea  name="description" rows="4" cols="32" style="overflow:auto;resize:none"> </textarea></td>
					</tr>
					<tr>
					 <td><label >Project Start Date</label> </td> <td><input type ="date" name ="startdate"> </td>
					</tr>
					<tr>
					 <td><label >Project End Date </label> </td> <td><input type ="date" name ="enddate"> </td>
					</tr>
					<tr>
					 <td  align="center"><br><br><input type="submit" value="Submit" ></td> <td  align="center"><br><br><input type="Reset" value="Reset" > </td>
					</tr>
					</table>
		 	     </fieldset>
</body>
</html>