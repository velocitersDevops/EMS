package com.velociter.ems.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.velociter.ems.database.EmployeeDAO;
import com.velociter.ems.model.Employee;
import com.velociter.ems.model.Manager;

//@WebServlet("/AddManager")
public class AddManagerServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter  out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		
		Manager managerObject = new Manager();	
		managerObject.setSalutation(request.getParameter("salutation"));
		managerObject.setFirstName(request.getParameter("firstname"));
		managerObject.setMiddleName(request.getParameter("middlename"));
		System.out.println("EMPLOYEE middle name :" + managerObject.getMiddleName());
		String empName = managerObject.getMiddleName().isEmpty() ? "NA" : managerObject.getMiddleName();
		System.out.println("" + empName);
		managerObject.setMiddleName("" + empName);
		managerObject.setLastName(request.getParameter("lastname"));
		managerObject.setEmailId(request.getParameter("email"));
		managerObject.setIsdCode(request.getParameter("dialCode"));
		managerObject.setMobileNumber(Long.parseLong(request.getParameter("mobileNumber")));
		managerObject.setDateOfJoining(request.getParameter("dateofjoin"));
		managerObject.setPassword(request.getParameter("passsword"));
		
		//create EmployeeDAO object to persist the Manager name into MANAGERtable
		EmployeeDAO employeeDaoObject = new EmployeeDAO();
		//int addManagerStatus = 0;
		//out.println("status in servlet ="+addManagerStatus);
//		employeeDaoObject.addManager(managerObject);
//		String name = managerObject.getManagerName();
//		response.getWriter().print("Hi, "+ name);
//		out.println("success");
//		out.write("Send Data........");
		
		if(employeeDaoObject.addManager(managerObject) != 0 )
		{
			out.println("<h4 style='color: green;'>Add Manager Name Operation success</h4>");
//			RequestDispatcher requestDispaterObject = request.getRequestDispatcher("Register.jsp");
//			requestDispaterObject.include(request, response);
		}else
		{
			out.println("<h4 style='color: red;'>Add Manager Name Operation is Faild</h4>");
//			RequestDispatcher requestDispaterObject = request.getRequestDispatcher("Register.jsp");
//			requestDispaterObject.include(request, response);
		}
	}

}
