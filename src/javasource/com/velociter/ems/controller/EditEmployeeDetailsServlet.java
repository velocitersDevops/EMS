package com.velociter.ems.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.velociter.ems.database.Operations;
import com.velociter.ems.model.Address;
import com.velociter.ems.model.Employee;
import com.velociter.ems.interfaces.EmployeeInterface;
import com.velociter.ems.model.Family;
import com.velociter.ems.model.PersonalInformation;
public class EditEmployeeDetailsServlet extends HttpServlet implements EmployeeInterface
{
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
    	
    	PrintWriter out=resp.getWriter();
    	 
    	HttpSession session=req.getSession(false);
    	Integer empId=(Integer)session.getAttribute(EmployeeInterface.EMPLOYEEID);
    	Integer familyId=(Integer)session.getAttribute(EmployeeInterface.FAMILYID);
    	Integer personalInfoid = (Integer)session.getAttribute(EmployeeInterface.PERSONALINFO_ID);
    	Integer addressId = (Integer)session.getAttribute(EmployeeInterface.ADDRESSID);
    	 System.out.println("empid :"+empId+ "  ,"+"personalInfoId  :"+personalInfoid+ " ,familyId "+familyId +" , "+"addressId :"+addressId);
    	
         String managerName=req.getParameter("managerName");
         int projectId=Integer.parseInt(req.getParameter("projectName"));
    	//String firstName=req.getParameter("firstName");
    	//String middleName=req.getParameter("middleName");
    	//String lastName=req.getParameter("lastName");
    	//String emailId=req.getParameter("emailId");
    	//String mobileNumber=req.getParameter("mobileNumber");
    	String alternateMobileNumber=req.getParameter("alternateMobileNumber");
    	//String dateOfJoining=req.getParameter("dateOfJoining");
    	
    	String fatherName=req.getParameter("fatherName");
    	String motherName=req.getParameter("motherName");
    	String spouseName=req.getParameter("spouseName");
    	//Creating employee object and set the data
    	Employee employee=new Employee();
    	//employee.setFirstName(firstName);
    	//employee.setMiddleName(middleName);
    	//employee.setLastName(lastName);
    	//employee.setEmailId(emailId);
    	//employee.setMobileNumber(Long.parseLong(mobileNumber));
    	if(alternateMobileNumber!=""||alternateMobileNumber=="0")
    	{
    	employee.setAlternateContactNumber(Long.parseLong(alternateMobileNumber));
    	}
    	else
    	{
    		employee.setAlternateContactNumber(0);;
    	}
    	//employee.setDateOfJoining(dateOfJoining);
    	employee.setEmployeeId(empId);
    	employee.setManagerName(managerName);
    	employee.setProjectId(projectId);
    	
    	//Creating family Object and set the data 
    	Family family=new Family();
    	family.setFamilyId(familyId);
    	family.setFatherName(fatherName);
    	family.setMotherName(motherName);
    	family.setSpouseName(spouseName);
    	System.out.println("family data :"+family.toString());
    	
    	//=====================================Merged Code Of Personal Information and Address=======================
    	PersonalInformation personalObject = new PersonalInformation();
    	personalObject.setPersonalInfoId(personalInfoid);  
		personalObject.setDateOfBirth(req.getParameter("dateOfbirth"));
		personalObject.setSex(req.getParameter("sex"));
		personalObject.setPanNumber(req.getParameter("pannumber"));
		if(req.getParameter("aadharnumber")!=null && !req.getParameter("aadharnumber").equals(""))
		{
			personalObject.setAadharNumber(Long.parseLong(req.getParameter("aadharnumber")));
		}
		
		personalObject.setPassportNumber(req.getParameter("passportnumber"));
		personalObject.setBankAccountNumber(Long.parseLong(req.getParameter("bankaccountNumber")));
		personalObject.setNationality(req.getParameter("nationality"));
		String marritalStatus = req.getParameter("marritalstatus");
		System.out.println("marrital status :"+marritalStatus);
		personalObject.setMaritalStatus(marritalStatus);
		System.out.println("persona object data :"+personalObject.toString());
		
		//taking address information data from request object and storing into address object
		Address addressObject = new Address();
		addressObject.setAddressId(addressId);
		addressObject.setCountryName(req.getParameter("country"));
		addressObject.setStateName(req.getParameter("state"));
		addressObject.setCityName(req.getParameter("city"));
		addressObject.setPincodeNumber(Integer.parseInt(req.getParameter("pincode")));
		String addressLine1Data = req.getParameter("addressLine1");
		String addressLine2Data = req.getParameter("addressLine2");
		
		//here appending addressLine2 data with AddressLine1(Addresline1 + Addresline1) and storing into addressObject
		String addressdata = addressLine1Data +"-"+addressLine2Data;
		addressObject.setAddressLine1(addressdata);
		System.out.println("check complete addres line1 line 2  :"+addressObject.getAddressLine1());
		if(req.getParameter("streetnumber")!=null && !req.getParameter("streetnumber").equals(""))
		{
			 addressObject.setStreetNumber(Integer.parseInt(req.getParameter("streetnumber")));
		}
		 	
		addressObject.setHouseNumber(req.getParameter("housenumber"));
		addressObject.setAddressType(Integer.parseInt(req.getParameter("addressType")));
		System.out.println("address object data :"+addressObject.toString());
    	 try
   	    { 
			             int employeeUpdateCount=0;    //It store the update count in employee table
			             int familyAddCount =0;
			    	     int familyUpdateCount=0;      //It store the update count in family table
			    	     int personalInfoCount = 0;    // It store the update count in personal Information table
			 			 int addressCount = 0;         // It store the update count in Addresses table
			   		
			    		 //Creating Operation class object for calling to the method
			    		 Operations operationObject=new Operations();
			    		 //by using operationObject reference call updateEmployeeDetail method of operation class
			    		 System.out.println("employee data in updateEmployeeDetail() :"+employee.toString());
			    		 employeeUpdateCount=operationObject.updateEmployeeDetail(employee);
			   		
			   		if(familyId==0)   //If family id of employee is 0 in employee table it means that employee has not added his family details
			   		{
			   		  //Calling method addFamilyDetails of Operations class using operationObject reference
			   			System.out.println("check family data befor add  :"+family.toString());
			   			familyAddCount= operationObject.addFamilyDetails(family,employee.getEmployeeId());
			   	      System.out.println("familyAddCount :"+familyAddCount);
			   		  //Update the family id of employee in employee table from family table
			   		  operationObject.updateFamilyIdInEmployeeTable(empId);
			   		}
			   		else      //if the employee has added his family detail then it will be updated
			   		{
			   	    familyUpdateCount=operationObject.updateFamilyDetails(family);   		
			   	    }
			   		
			   		System.out.println("before if personalInfoid :"+personalInfoid+" "+" and addressId :"+addressId);
			   		if(personalInfoid >0 && addressId >0 )   		 
					{
				    // by using operationObject reference call updatePersonalInfo method of
			    	personalInfoCount = operationObject.updatePersonalInfo(personalObject,personalInfoid);
				    addressCount = operationObject.updateAddressRecord(addressObject,addressId);
		   						   		 
					   		if(personalInfoCount >0 &&  addressCount >0  )
					   		{
					   			//out.println("<h4 style='color: green;'>  Records  Upadate SuccessFully !</h4>");
								RequestDispatcher requestDispaterObject = req.getRequestDispatcher("UpdateStatus.jsp?status="+1+"");
								requestDispaterObject.forward(req, resp);
					   		}
					   		else if(personalInfoCount == 0 ||  addressCount >0)
					   		{
					   			out.println("<h4 style='color: green;'>Address SuccessFully </h4> <h4 style='color: red;'>Personal Info Faild </h4>");
								RequestDispatcher requestDispaterObject = req.getRequestDispatcher("UpdateStatus.jsp");
								requestDispaterObject.include(req, resp);
					   		}
					   		else if(personalInfoCount >0 ||  addressCount == 0)
					   		{
					   			out.println("<h4 style='color: green;'>Personal Info SuccessFully </h4> <h4 style='color: red;'>Address  Faild </h4>");
								RequestDispatcher requestDispaterObject = req.getRequestDispatcher("UpdateStatus.jsp");
								requestDispaterObject.include(req, resp);
					   		}
					   		else
					   		{
					   			//out.println("<h4 style='color: red;'>   Records Not Upadate SuccessFully !</h4>");
								RequestDispatcher requestDispaterObject = req.getRequestDispatcher("UpdateStatus.jsp?status="+0+"");
								requestDispaterObject.include(req, resp);
					   		}	
					}
					else
					{
						
						if (personalInfoid == 0 && addressId == 0  ) // If personalInfoid of employee is 0 in Personal_information table it means that employee has not added his personal detail							
						{
							// we taking employee id from session now tamprary we taken empid is personalinfoid
							personalInfoid = empId;	
							addressId = empId;
							System.out.println("comtrol in if block personal info id :" + personalInfoid);
							// Calling method addpersonalInfoDetails of Operations class using
							personalInfoCount = operationObject.addpersonalInfoDetails(personalObject, personalInfoid);
							addressCount = operationObject.addAddressDetails(addressObject, addressId);
							int addressIdUpdateStatus = operationObject.updateAddressidInEmployeeTable(addressId);
							int personalinfoIdUpdateStatus = operationObject.updatePersonalInfoidInEmployeeTable(personalInfoid);
							if(personalInfoCount >0 &&  addressCount>0 )
							{
								
								RequestDispatcher requestDispaterObject = req.getRequestDispatcher("UpdateStatus.jsp?status="+2+"");
								requestDispaterObject.include(req, resp);
							}else
							{
								
								RequestDispatcher requestDispaterObject = req.getRequestDispatcher("UpdateStatus.jsp?status="+3+"");
								requestDispaterObject.include(req, resp);
							}
							
						} 	
					}
					
//			   		if(employeeUpdateCount >0 && familyUpdateCount>0)
//			   		{
//			   			resp.sendRedirect("Success.jsp");
//			   		}
//			   		else
//			   		{
//			   			resp.sendRedirect("Fail.jsp");
//			   		} 	
   	     }//try closed here
    	 catch (NullPointerException npex) {
 			out.println("<h4 align='center'  style='color: red;'>Unable To Connect With Server ! Please Try Again After Some Time </h4>");	
 		} 
 		catch (SQLException sqlException)  {
 			out.println("<h4 align='center'  style='color: red;'>Unable To Connect With Server ! Please Try Again After Some Time  </h4>");	
 			sqlException.printStackTrace();
 		}
 		catch(Exception e) {
 			out.println("<h4 align='center'  style='color: red;'>Unable To Connect With Server ! Please Try Again After Some Time</h4>");
 			e.printStackTrace();
 		}
    	
    }

	@Override
	public int add(Object object) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
    
}
