<%

String message=(String)session.getAttribute("message");

if(message!=null)
    {
	out.print(message);
	session.removeAttribute("message");
	}
%>