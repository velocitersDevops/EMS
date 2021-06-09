package com.velociter.ems.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.velociter.ems.database.Operations;
import com.velociter.ems.model.Employee;
import com.velociter.ems.model.Family;
public class EditEmployeeDetailsServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
    	
    	PrintWriter out=resp.getWriter();
    	 
    	HttpSession session=req.getSession(false);
    	Integer empId=(Integer)session.getAttribute("empId");
    	Integer familyId=(Integer)session.getAttribute("familyId");
    	
         String managerName=req.getParameter("managerName");
         String projectId=req.getParameter("projectId");
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
    	employee.setAlternateContactNumber(Long.parseLong(alternateMobileNumber));
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
    	
    	 try
   	    { 
			             int employeeUpdateCount=0;    //It store the update count in employee table
			    	     int familyUpdateCount=0;      //It store the update count in family table
			   		
			    		 //Creating Operation class object for calling to the method
			    		 Operations operationObject=new Operations();
			    		 //by using operationObject reference call updateEmployeeDetail method of operation class
			    		 employeeUpdateCount=operationObject.updateEmployeeDetail(employee);
			   		
			   		if(familyId==0)   //If family id of employee is 0 in employee table it means that employee has not added his family details
			   		{
			   			//Calling method addFamilyDetails of Operations class using operationObject reference
			   		  familyUpdateCount= operationObject.addFamilyDetails(family,employee.getEmployeeId());
			   		//Update the family id of employee in employee table from family table
			   		  operationObject.updateFamilyIdInEmployeeTable(empId);
			   		}
			   		else      //if the employee has added his family detail then it will be updated
			   		{
			   	    familyUpdateCount=operationObject.updateFamilyDetails(family);   		
			   	    }
			   		
			   		 
			   		if(employeeUpdateCount >0 && familyUpdateCount>0)
			   		{
			   			resp.sendRedirect("Success.jsp");
			   		}
			   		else
			   		{
			   			resp.sendRedirect("Fail.jsp");
			   		}	
   	   }
    	 catch(Exception ee)
    	 {
    		
    		 ee.printStackTrace();
    	 }
    	
    }
}
