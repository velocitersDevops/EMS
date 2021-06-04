package com.velociter.ems.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.velociter.ems.database.DatabaseConnection;
import com.velociter.ems.database.Operations;
import com.velociter.ems.model.Employee;

public class LoginServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	response.setContentType("text/html");
    	
    	PrintWriter out=response.getWriter();
    	
    	String email=request.getParameter("email");
    	String password=request.getParameter("password");
    	
    	
 	   String msg;
 	   try
 	   {
 		 
 		   Operations operationObject=new Operations();
 		  DatabaseConnection.getDBConnection();
 		    Employee employee= operationObject.getEmployeeByEmailAndPassword(email, password);
 		 
 		 if(employee!=null)
 		 {
 			
 			 HttpSession session =request.getSession();
 			
 			 session.setAttribute("firstName",employee.getFirstName());
 			 session.setAttribute("currentuser", employee);
 			 
 			response.sendRedirect("Welcome.jsp");
 			
 		 }
 		 else
 		 {	 
 			response.sendRedirect("Login.jsp");	
 		 }
 		 
 	   }
 	   catch(Exception e)
 	   {
 		e.printStackTrace();
 	   }

    }
}
