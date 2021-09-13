package com.velociter.ems.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.velociter.ems.database.EmployeeDAO;
import com.velociter.ems.interfaces.EmployeeInterface;
import com.velociter.ems.model.Employee;

//@WebServlet("/EmployeeRegisterServlet")
public class EmployeeRegisterServlet extends HttpServlet implements EmployeeInterface {
	private static final long serialVersionUID = 1L;

	public EmployeeRegisterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		// here we are getting the employee details from the request object
		// and directaly storing te employee information into the model
		// class(Employee.java)
		// by using setter methods
		
		// by using setter methods
				ServletContext context=getServletConfig().getServletContext();
				String user=context.getInitParameter("Email");  //admin Email
				String pass=context.getInitParameter("password");  //admin password
				//out.print(user);  //for debugging 
				//out.print(pass);  //for debugging

		Employee employeeObject = new Employee();
		employeeObject.setSalutation(request.getParameter("salutation"));
		employeeObject.setFirstName(request.getParameter("firstname"));
		employeeObject.setMiddleName(request.getParameter("middlename"));
		System.out.println("EMPLOYEE middle name :" + employeeObject.getMiddleName());
		String empName = employeeObject.getMiddleName().isEmpty() ? "NA" : employeeObject.getMiddleName();
		System.out.println("" + empName);
		employeeObject.setMiddleName("" + empName);
		employeeObject.setLastName(request.getParameter("lastname"));
		employeeObject.setEmailId(request.getParameter("email"));
		employeeObject.setisdCode(request.getParameter("dialCode"));
		employeeObject.setMobileNumber(Long.parseLong(request.getParameter("mobileNumber")));
//		employeeObject.setAlternateContactNumber(Long.parseLong(request.getParameter("altercontactno")));
		employeeObject.setManagerName(request.getParameter("managername"));
		employeeObject.setDateOfJoining(request.getParameter("dateofjoin"));

		// String projectids[] =request.getParameterValues("ceckvalues");
		employeeObject.setProjectId(Integer.parseInt(request.getParameter("ceckvalues")));
		System.out.println("project id :" + employeeObject.getProjectId());
		employeeObject.setPassword(request.getParameter("passsword"));

		// here we are going to check employee already exist with emailid or not
		// Operations registerObject = new Operations();
		EmployeeDAO employeeDaoObject = new EmployeeDAO();
		int registerStatus = 0;
		try {
			if (employeeDaoObject.checkExistingEmail(employeeObject) == false) {

				out.println("Entered EmailId OR Mobile Number Already Registerd ! Try With Another Emailid OR Mobile Number.");
//				RequestDispatcher requestDispaterObject = request.getRequestDispatcher("RegisterStatus.jsp");
//				requestDispaterObject.include(request, response);
				out.print("False");

			} else {

				registerStatus = employeeDaoObject.add(employeeObject);
				// debug
				System.out.println("status of register :" + registerStatus);
				// registerStatus = registerObject.registerEmployee(employeeObject);
				// status of registration send back to the Register page

				if (registerStatus == 0) {

					out.println("<h4 align='center'  style='color: red;'>Registration Failed</h4>");
//					RequestDispatcher requestDispaterObject = request.getRequestDispatcher("RegisterStatus.jsp");
//					requestDispaterObject.include(request, response);
				} else {
					// out.println("<h4 align='center' style='color: green;'>Registration
					// success</h4>");
					// RequestDispatcher requestDispaterObject =
					// request.getRequestDispatcher("RegisterStatus.jsp");
					// requestDispaterObject.include(request, response);

					HttpSession session = request.getSession();
				//	session.setAttribute(EmployeeInterface.MESSAGE, "Registration Successful");
//					response.sendRedirect("Login.jsp");
					
				
					String to=request.getParameter("email");
					String subject="Thankyou for Registering with EMS";
					String msg="hii "+request.getParameter("firstname")+"\n"
					+"\n"	
					+"Your login Credential "+"\n"		
					+"Email    : "+request.getParameter("email")+"\n"
					+"Password : "+request.getParameter("passsword")+"\n"
					+"\n"
					+"Note.Please do not share your login credential to anyone"+"\n"
					+"Regards"+"\n"
					+"Ems Team"+"\n"
					+"Thank You";
				
					boolean mailStatus=Mailer.send(to, subject, msg,user,pass);
				
					//response.sendRedirect("Login.jsp");
					System.out.print("mail sended");
					
					if(mailStatus==true)
					{
					out.print("True");
					session.setAttribute(EmployeeInterface.MESSAGE, "Registration Successful");
					//out.print("True");
				    }
					else
					{
						out.print("");
					}
					}
			}
		} catch (NullPointerException npex) {
			out.println(
					"<h4 align='center'  style='color: red;'>Unable To Connect With Server ! Please Try Again After Some Time </h4>");
		} catch (ParseException parsex) {
			out.println(
					"<h4 align='center'  style='color: red;'>Unable To Connect With Server ! Please Try Again After Some Time [Parse] </h4>");
			parsex.printStackTrace();
		} catch (Exception e) {
			out.println(
					"<h4 align='center'  style='color: red;'>Unable To Connect With Server ! Please Try Again After Some Time</h4>");
			e.printStackTrace();
		}
	}

	@Override
	public int add(Object object) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
