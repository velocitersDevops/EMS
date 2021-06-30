package com.velociter.ems.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.velociter.ems.database.EmployeeDAO;
import com.velociter.ems.model.Manager;

//@WebServlet("/AddManager")
public class AddManagerServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter  out = response.getWriter();
		response.setContentType("text/html");
		
		Manager managerObject = new Manager();
		managerObject.setManagerName(request.getParameter("managerName"));
		System.out.println("manager name:"+managerObject.getManagerName());
		
		//create EmployeeDAO object to persist the Manager name into MANAGERtable
		EmployeeDAO employeeDaoObject = new EmployeeDAO();
		int addManagerStatus = employeeDaoObject.addManager(managerObject);
		out.println("status in servlet ="+addManagerStatus);
		if(addManagerStatus >= 0)
		{
			out.println("<h4 style='color: green;'>Add Manager Name Operation success</h4>");
			RequestDispatcher requestDispaterObject = request.getRequestDispatcher("RegisterStatus.jsp");
			requestDispaterObject.forward(request, response);
		}else
		{
			out.println("<h4 style='color: red;'>Add Manager Name Operation is Faild</h4>");
			RequestDispatcher requestDispaterObject = request.getRequestDispatcher("RegisterStatus.jsp");
			requestDispaterObject.forward(request, response);
		}
	}

}
