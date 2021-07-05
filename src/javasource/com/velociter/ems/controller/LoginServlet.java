package com.velociter.ems.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.velociter.ems.database.EmployeeDAO;
import com.velociter.ems.model.Employee;
import com.velociter.ems.interfaces.EmployeeInterface;

public class LoginServlet extends HttpServlet implements EmployeeInterface
{
    private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	String email=request.getParameter("email");
    	String password=request.getParameter("password");
 	   try
 	   {
 		 
 		   //Operations operationObject=new Operations();
 		   //DatabaseConnection.getDBConnection();
 		   //Employee employee= operationObject.getEmployeeByEmailAndPassword(email, password);
 		   EmployeeDAO  employeeDaoObject = new EmployeeDAO();
 		   Employee employee = employeeDaoObject.loginEmployee(email, password);
 		 if(employee!=null)
 		 {
 			 HttpSession session =request.getSession();
 			 session.setAttribute(EmployeeInterface.FAMILYID, employee.getFamilyId());
 			 session.setAttribute(EmployeeInterface.EMPLOYEEID, employee.getEmployeeId());
 			 session.setAttribute(EmployeeInterface.PERSONALINFO_ID,employee.getPersonalInfoId());
 			 session.setAttribute(EmployeeInterface.ADDRESSID,employee.getAddressId());
 			 session.setAttribute(EmployeeInterface.FIRSTNAME,employee.getFirstName());
 			 session.setAttribute(EmployeeInterface.CURRENT_USER, employee);
 			 System.out.println("session value check emploee id :"+session.getAttribute(EMPLOYEEID));
 			 System.out.println("session value check family id :"+session.getAttribute(FAMILYID));
 			 System.out.println("session value check personalinfo id :"+session.getAttribute(PERSONALINFO_ID));
 			 System.out.println("session value check address id :"+session.getAttribute(ADDRESSID));
 			response.sendRedirect("Welcome.jsp");
 		 }
 		 else
 		 {   out.println("<h1>Invalid Email and password</h1>");
 			 RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");  
             rd.include(request, response);  
 		 }
 		 
 	   }
 	   catch(Exception e)
 	   {
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
