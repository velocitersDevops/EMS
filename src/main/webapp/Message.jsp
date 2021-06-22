
<%@page import="com.velociter.ems.model.EmployeeInterface"%>
<%

String message=(String)session.getAttribute(EmployeeInterface.MESSAGE);

if(message!=null)
    {
	out.print(message);
	session.removeAttribute(EmployeeInterface.MESSAGE);
	}
%>