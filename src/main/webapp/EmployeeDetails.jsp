<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.velociter.ems.database.Operations" %>
    <%@ page import="com.velociter.ems.model.Family" %>
    <%@ page import="com.velociter.ems.model.Employee" %>
    <%@ page import="com.velociter.ems.model.Address" %>
    <%@ page import="com.velociter.ems.model.PersonalInformation" %>
    <%@ page import="java.util.ArrayList" %>
    <%@page import="com.velociter.ems.interfaces.EmployeeInterface"%>
    
    <%
    String firstName=(String)session.getAttribute(EmployeeInterface.FIRSTNAME);
    Integer employeeId =(Integer.parseInt(request.getParameter("empid")));
    // System.out.println("first name :"+firstName);
  if(firstName==null)
  {
   response.sendRedirect("Login.jsp");	
  }
  response.setHeader("Cache-Control", "no-cache");
  response.setHeader("Cache-Control", "no-store");
  response.setHeader("Pragma", "no-cache");
  response.setDateHeader("Expire", 0);
 
  
  // here we will get FamilyId,addressId,PersonalInfoId from employee table ,if we will get all id means added all details which id not get
  //  that simple means that information will not display.

   Employee employee=new Employee();
   Operations operationObject = new Operations();
   ArrayList<Integer> idData = new ArrayList<Integer>();
   idData = operationObject.getFourIds(employeeId);
   int empId =idData.get(0);
   int personalInfoId =idData.get(1);
   int familyId = idData.get(2);
   int addressId = idData.get(3);
 
    Employee employeeObject = new Employee();
    Family familyObject = new Family();
    Address addressObject = new Address();
    PersonalInformation personalObject = new PersonalInformation();
    
    //if required id is available then only allow to call relate method if required id is '0' then dont call the method
     
    if(empId !=0)
     {
    	 employeeObject = operationObject.getEmployeeDetailsByEmployeeId(employeeId);
    	 //System.out.println(" employee data :"+employeeObject.toString());
     }
     if(personalInfoId !=0)
     {
    	personalObject = operationObject.getPersonalInformation(employeeId);
    	//System.out.println(" personal data :"+personalObject.toString());
     }
     if(familyId != 0)
     {
     	 familyObject =  operationObject.getFamilyDetailsByFamilyId(employeeId);
     	 //System.out.println(" employee id  in family :"+employeeId);
     }
      if(addressId !=0)
     {
     	addressObject = operationObject.getAddressDetails(employeeId);
     	//System.out.println(" address data :"+addressObject.toString());
     }
    %>
   
<jsp:include page="Header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Details Page</title>
<style>

  table.center {  
    margin-left: auto;   
    margin-right: auto;  
  }  
 table {  
   width: 80%;  
  } 
 fieldset {  
/*     background-color: #eeeeee;   */
     background-color: white;   
    width:80%;  
 } 

  legend {  
   background-color: gray;  
   color: white;  
    padding: 1px 3px;  
 }  

  input {  
  margin: 3px;  
 }  
</style>
</head>
<body >
<br><br>
 <table class="center"> 

<div>
		<tr>
			<td>
			    <fieldset>
					<legend>Employee Details:</legend>
					<table>
					
					<tr>
					 <td> <label >Salutation:</label> </td> <td><%String salutationdata =(employeeObject.getSalutation() != null) ? employeeObject.getSalutation() : "NA";  %> <%=salutationdata %> </td>
					</tr>
					<tr>
					 <td><label >First Name:</label> </td> <td><%String firstnamedata =(employeeObject.getFirstName() != null) ? employeeObject.getFirstName() : "NA";  %> <%=firstnamedata  %> </td>
					</tr>
					<tr>
					 <td><label >Middle Name:</label> </td> <td><%String middlenamedata =(employeeObject.getMiddleName() != null) ? employeeObject.getMiddleName() : "NA";  %> <%=middlenamedata  %> </td>
					</tr>
					<tr>
					 <td><label >Last Name:</label> </td> <td><%String lastnamedata =(employeeObject.getLastName() != null) ? employeeObject.getLastName() : "NA";  %> <%=lastnamedata  %> </td>
					</tr>
					<tr>
					 <td><label >Mobile No:</label> </td> <td><%String mobiledata =(employeeObject.getMobileNumber() != 0) ? mobiledata=Long.toString(employeeObject.getMobileNumber() ): "NA";  %> <%=mobiledata  %> </td>
					</tr>
					<tr>
					 <td><label >Alternate No.:</label> </td> <td><%String alternateContactdata =(employeeObject.getAlternateContactNumber() != 0) ? alternateContactdata=Long.toString(employeeObject.getAlternateContactNumber() ): "NA";  %> <%=alternateContactdata  %> </td>
					</tr>
					<tr>
					 <td><label >Email:</label> </td> <td><% String emaildata =(employeeObject.getEmailId()!= null) ? employeeObject.getEmailId() : "NA";  %> <%= emaildata  %></td>
					</tr>
					<tr>
 					 <td><label >Project ID:</label> </td> <td><%String projectIdData =(employeeObject.getProjectId() != 0) ? projectIdData=Integer.toString(employeeObject.getProjectId()): "NA";  %> <%=projectIdData  %> </td> 
					</tr>
					<tr>
					 <td><label >Manager Name:</label> </td> <td> <% String managerNamedata =(employeeObject.getManagerName() != null) ? employeeObject.getManagerName() : "NA";  %> <%= managerNamedata  %> </td>
					</tr>
					<tr>
					 <td><label >Date Of Join:</label> </td> <td> <%String dojData=(employeeObject.getDateOfJoining() != null) ? employeeObject.getDateOfJoining() : "NA";  %> <%=dojData  %> </td>
					</tr>
					<tr>
					 <td><label >Creation Date:</label> </td> <td> <%String creationData=(employeeObject.getCreationDate() != null) ? employeeObject.getCreationDate() : "NA";  %> <%=creationData%> </td>
					</tr>
					<tr>
					 <td><label >Last Modified Date:</label> </td> <td> <%String lastModifiedData=(employeeObject.getLastModifiedDate() != null) ? employeeObject.getLastModifiedDate() : "NA";  %> <%=lastModifiedData  %> </td>
					</tr>
					</table>
					
			     </fieldset>
			</td>
			<td>
                 <fieldset>
					<legend>Personal Information:</legend>
					<table>
					<tr>
					 <td><label >DOB:</label> </td> <td><%String dobData=(personalObject.getDateOfBirth() != null) ? personalObject.getDateOfBirth() : "NA";  %> <%=dobData  %></td>
					</tr>
					<tr>
					 <td><label >Sex:</label> </td> <td><%String sexData=(personalObject.getSex() != null) ? personalObject.getSex() : "NA";  %> <%=sexData  %></td>
					</tr>
					<tr>
 					 <td><label >PAN Number:</label> </td> <td> <%String pandData = (personalObject.getPanNumber() != null ) ? personalObject.getPanNumber() : "NA";  %> <%=projectIdData  %></td> 
					</tr>                                       
					<tr>
					 <td><label >Aadhar Number:</label> </td> <td><%String aadharData =(personalObject.getAadharNumber() != 0) ? aadharData=Long.toString(personalObject.getAadharNumber() ): "NA";  %> <%=aadharData  %> </td>
					</tr>
					<tr>
					 <td><label >Passport Number::</label> </td> <td><%String passportData = (personalObject.getPassportNumber() != null ) ? personalObject.getPassportNumber() : "NA";  %> <%=passportData  %> </td>
					</tr>
					<tr>
					 <td><label >Bank Account Number:</label> </td> <td><%String bankAccDataata =(personalObject.getBankAccountNumber() != 0) ? bankAccDataata=Long.toString(personalObject.getBankAccountNumber() ): "NA";  %> <%=bankAccDataata  %> </td>
					</tr>
					<tr>
					 <td><label >Nationality:</label> </td> <td><%String nationalityData = (personalObject.getNationality()!= null ) ? personalObject.getNationality() : "NA";  %> <%=nationalityData  %> </td>
					</tr>
					<tr>
					 <td><label >Marital Status:</label> </td> <td><%String maritalStatusData = (personalObject.getMaritalStatus()!= null ) ? personalObject.getMaritalStatus() : "NA";  %> <%=maritalStatusData  %> </td>
					</tr>
					</table>
			     </fieldset>
			  </td>
		</tr>

		<tr>
             <td>
			     <fieldset>
					<legend>Family Details:</legend>
					<table >
					<tr>
					 <td><label >Father's Name:</label> </td> <td> <%String fatherNamedata =(familyObject.getFatherName() != null) ? familyObject.getFatherName() : "NA";%> <%=fatherNamedata%> </td>
					</tr>
					<tr>
					 <td><label >Mother's Name:</label> </td> <td><%String motherNamedata =(familyObject.getMotherName() != null) ? familyObject.getMotherName() : "NA";  %> <%=motherNamedata  %> </td>
					</tr>
					<tr>
					 <td><label >Spouse Name:</label> </td> <td><%String spouseNamedata =(familyObject.getSpouseName() != null) ? familyObject.getSpouseName()  : "NA";  %> <%=spouseNamedata  %> </td>
					</tr>
					</table>
		 	     </fieldset>
		      </td>
			  <td>
			     <fieldset>
					<legend>Address Details:</legend>
					<table>
					<tr>
					 <td><label >Country Name:</label> </td> <td><%String countryNameData = (addressObject.getCountryName()!= null ) ? addressObject.getCountryName() : "NA";  %> <%=countryNameData  %></td>
					</tr>
					<tr>
					 <td><label >State:</label> </td> <td><%String stateNameData = (addressObject.getStateName()!= null ) ? addressObject.getStateName() : "NA";  %> <%=stateNameData  %> </td>
					</tr>
					<tr>
					 <td><label >City:</label> </td> <td><%String cityNameData = (addressObject.getCityName()!= null ) ? addressObject.getCityName() : "NA";  %> <%=cityNameData  %> </td>
					</tr>
					<tr>
					 <td><label >Pin Code:</label> </td> <td><%String pinCodeData =(addressObject.getPincodeNumber() != 0) ? pinCodeData=Integer.toString(addressObject.getPincodeNumber() ): "NA";  %> <%=pinCodeData  %> </td>
					</tr>
					<tr>
 					 <td><label >Address:</label> </td> <td><%String streetAddresData = (addressObject.getAddressLine1()!= null ) ? addressObject.getAddressLine1() : "NA";  %> <%=streetAddresData  %> </td> 
					</tr>
					<tr>
					 <td><label >Street Number:</label> </td> <td><%String streetNumberdData =(addressObject.getStreetNumber() != 0) ? streetNumberdData=Integer.toString(addressObject.getStreetNumber() ): "NA";  %> <%=streetNumberdData  %>  </td>
					</tr>
					<tr>
					 <td><label >House No.:</label> </td> <td><%String housenumberData =(addressObject.getHouseNumber() != null) ? addressObject.getHouseNumber(): "NA";  %> <%=housenumberData  %> </td>
					</tr>
					<tr>
					 <td><label >Address Type:</label> </td> <td><%String addressTypeData =(addressObject.getAddressType() == 0) ? "Permanent Address": "Temprary Address";  %> <%=addressTypeData  %> </td>
					</tr>
					
			     </fieldset>
			  </td>
 	     </tr> 
 
</table>
<jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>