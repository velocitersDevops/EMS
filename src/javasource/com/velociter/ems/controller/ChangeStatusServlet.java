package com.velociter.ems.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.velociter.ems.database.EmployeeDAO;


@WebServlet("/ChangeStatusServlet")
public class ChangeStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		EmployeeDAO daoObject =new EmployeeDAO();
		PrintWriter out= response.getWriter();
		
		String currentStatus = request.getParameter("status");
		System.out.println("request status is :"+currentStatus);
		int employeeId =(Integer.parseInt( request.getParameter("eid")));
		System.out.println("ajax is comming");
		out.print("True");
		if(currentStatus.equals("activate"))
		{                       
			out.println("employee id :"+employeeId);
			out.println("current status :"+currentStatus);
			int employeeStatus = daoObject.deActivateStatus(employeeId);
			out.println("employee status :"+employeeStatus);
			out.println("<h2 style='color: red;' >Employee Is DeActive</h2>");
			out.print("True");
			RequestDispatcher rd = request.getRequestDispatcher("AdminWelcomePage.jsp");
			rd.forward(request, response);
		}	
		else
		{
			out.println("employee id :"+employeeId);
			out.println("current status :"+currentStatus);
			int employeeStatus = daoObject.activateStatus(employeeId);
			out.println("employee status :"+employeeStatus);
			out.println("<h2 style='color: red;' >Employee Is Active</h2>");
			out.print("True");
			RequestDispatcher rd = request.getRequestDispatcher("AdminWelcomePage.jsp");
			rd.forward(request, response);
		}
		
		out.print("True");
		
	}

}
