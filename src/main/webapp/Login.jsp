<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="ISO-8859-1">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"
></script>



<script>
    $(document).ready(function(){
       $('#login').onsubmit(function()
       {   
          var email=$('#email').val();
          var password=$('#password').val();
          $.ajax({
               type: "POST",
               url:"LoginServlet",
               data:{"email":email,"password":password},
               success: function (data) {
                  if(data=='True'){
                    $(location).attr('href','Welcome.jsp');
                  }else{
                      alert('Invalid email and password....');
                  }
               }
             });                                
           });
         });
   </script>


<script>
function validation()
{
	 var email=document.regform.email.value;
     var password=document.regform.password.value;
	
     var flag=false;
     
     var emailpattern=/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
     var passwordpattern= /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{5,15}$/;
     
     if(!email.match(emailpattern))
     {
    	 alert("Please enter valid Email"); 
         return flag;
     }
     
     if(!password.match(passwordpattern))
     {
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

<body>

  <%
  response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expire", 0);
%>

  <h2 style="text-color:green;padding-left:300px"><jsp:include page="Message.jsp"></jsp:include></h2>
      <form action="LoginServlet" method="POST" name="regform" id="login" onsubmit="return validation()"  >
        
            <fieldset>
                <!-- Legend tag useing -->
                <legend>Login:</legend>
                
                <table >
                
                <tr>
              <td>  Email ID:</td>
              <td><input type="text" name="email" id="email"><span id="emailerror"></span></td>
                </tr>
                
                <tr>
               <td> Password: </td>
               <td> <input type="password" name="password" id="password"><span id="passworderror"></span></td>
                </tr>
                <tr>
               <td><button type="submit" id="" >Submit </button></td>
              
                </tr>
                
                
                </table>
              </fieldset>  
        </form>
        
        
</body>
</html>