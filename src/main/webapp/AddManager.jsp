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
<title>Add Manager Page</title>
</head>
<body>
<jsp:include page="HomePageHeader.jsp"></jsp:include> 
<form action ="AddManagerServlet" method="post">
		<br><br><br><br><br>
	
			     <fieldset>
					<legend align="center">ADD MANAGER NAME</legend>
					<table align="center">
					<tr>
					 <td><label >Manager Name:</label> </td> <td><input type ="text" name ="managerName" size="30"> </td>
					<tr>
					 <td  align="center"><br><br><input type="submit" value="Submit" ></td> <td  align="center"><br><br><input type="Reset" value="Reset" > </td>
					</tr>
					</table>
		 	     </fieldset>
		 	     </form>
</body>
</html>