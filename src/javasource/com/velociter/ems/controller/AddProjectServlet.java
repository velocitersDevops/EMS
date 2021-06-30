package com.velociter.ems.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.velociter.ems.database.CommanOperations;
import com.velociter.ems.database.EmployeeDAO;
import com.velociter.ems.model.Project;

//@WebServlet("/AddProjectServlet")
public class AddProjectServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	PrintWriter  out = response.getWriter();
	response.setContentType("text/html");
	
	//create CommanOperations object to call changedateFormate()
	CommanOperations commanObject = new CommanOperations();
	//create project Object to store values
	Project projectObject = new Project();
	projectObject.setProjectName(request.getParameter("projectName"));
	projectObject.setProjectDescription(request.getParameter("description"));
	String startDate = request.getParameter("startdate"); 
	String endDate = request.getParameter("enddate"); 
	projectObject.setStartDate(commanObject.changeDateFormate(startDate));
	projectObject.setEndDate(commanObject.changeDateFormate(endDate));
	//out.println("endDate :"+endDate);
	
	//create EmployeeDAO object to call persistence methods
	EmployeeDAO  employeeDaoObject  = new EmployeeDAO();
	int addProjectStatus = employeeDaoObject.addProject(projectObject);
	System.out.println("status in servlet ="+addProjectStatus);
	if(addProjectStatus == 0)
	{
		out.println("<h4 style='color: red;'>Add project Operation is Faild</h4>");
		RequestDispatcher requestDispaterObject = request.getRequestDispatcher("RegisterStatus.jsp");
		requestDispaterObject.forward(request, response);
	}else
	{
		out.println("<h4 style='color: green;'>Add project Operation is success</h4>");
		RequestDispatcher requestDispaterObject = request.getRequestDispatcher("RegisterStatus.jsp");
		requestDispaterObject.forward(request, response);
	}
	}
}
