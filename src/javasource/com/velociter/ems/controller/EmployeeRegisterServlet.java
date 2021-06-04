package com.velociter.ems.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.velociter.ems.database.Operations;
import com.velociter.ems.model.Employee;




//@WebServlet("/EmployeeRegisterServlet")
public class EmployeeRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public EmployeeRegisterServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		// here we are getting the employee details from the request object
		// and directaly storing te employee information into the model
		// class(Employee.java)
		// by using setter methods

		Employee employeeObject = new Employee();
		employeeObject.setSalutation(request.getParameter("salutation"));
		employeeObject.setFirstName(request.getParameter("firstname"));
		employeeObject.setMiddleName(request.getParameter("middlename"));
		employeeObject.setLasttName(request.getParameter("lastname"));
		employeeObject.setEmailId(request.getParameter("email"));
		employeeObject.setMobileNumber(Long.parseLong(request.getParameter("mobile")));
		employeeObject.setAlternateContactNumber(Long.parseLong(request.getParameter("altercontactno")));
		employeeObject.setManagerName(request.getParameter("managername"));
		employeeObject.setDateOfJoining(request.getParameter("dateofjoin"));
		
		String projectids[] =request.getParameterValues("projectId");
	
		int[] projectIds = new int[projectids.length];
		StringBuffer stringBufferObject = new StringBuffer();
		for(int i = 0;i < projectIds.length;i++)
		{
			stringBufferObject.append(projectids[i]).append(",");
			// out.println("project id :"+projectIds[i]);
			 System.out.println("project id in string buffer :"+stringBufferObject);
		}
        
		//here we convert String buffer data into string
		String projectid = stringBufferObject.toString();
		employeeObject.setPassword(request.getParameter("passsword"));
		employeeObject.setProjectId(projectid);
		
		// here we are going to check employee already exist with emailid or not
		Operations registerObject = new Operations();
		int registerStatus=0;
		try {
			if (registerObject.checkExistingEmail(employeeObject) == false) {
				
				out.println("<h4 style='color: red;'>Entered EmailId OR Mobile Number Already Registerd ! Try With Another Emailid OR Mobile Number</h4>");
				RequestDispatcher requestDispaterObject = request.getRequestDispatcher("RegisterStatus.jsp");
				requestDispaterObject.include(request, response);

			} else {
				
				
					registerStatus = registerObject.registerEmployee(employeeObject);
			
				// debug
				System.out.println("status of register :" + registerStatus);
				// registerStatus = registerObject.registerEmployee(employeeObject);
				// status of registration send back to the Register page

				if (registerStatus == 0) {
				
					out.println("<h4 align='center'  style='color: red;'>Registration Failed</h4>");
					RequestDispatcher requestDispaterObject = request.getRequestDispatcher("RegisterStatus.jsp");
					requestDispaterObject.include(request, response);
				} else {
					//out.println("<h4 align='center' style='color: green;'>Registration success</h4>");
					//RequestDispatcher requestDispaterObject = request.getRequestDispatcher("RegisterStatus.jsp");
					//requestDispaterObject.include(request, response);
					
					HttpSession session=request.getSession();
					session.setAttribute("message", "Registration Successful");
					response.sendRedirect("Login.jsp");
				}
			}
		} catch (NullPointerException npex) {
			out.println("<h4 align='center'  style='color: red;'>Unable To Connect With Server ! Please Try Again After Some Time </h4>");	
		} 
        catch (ParseException parsex)  {
		out.println("<h4 align='center'  style='color: red;'>Unable To Connect With Server ! Please Try Again After Some Time [Parse] </h4>");	
		parsex.printStackTrace();
        }
		catch (SQLException sqlException)  {
			out.println("<h4 align='center'  style='color: red;'>Unable To Connect With Server ! Please Try Again After Some Time [Parse] </h4>");	
			sqlException.printStackTrace();
		}
		catch(Exception e) {
			out.println("<h4 align='center'  style='color: red;'>Unable To Connect With Server ! Please Try Again After Some Time</h4>");
			e.printStackTrace();
		}
	}

	
	

}
