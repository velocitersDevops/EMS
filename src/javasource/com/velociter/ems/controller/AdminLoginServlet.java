package com.velociter.ems.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.velociter.ems.database.EmployeeDAO;
import com.velociter.ems.interfaces.EmployeeInterface;
import com.velociter.ems.model.Admin;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	String username=request.getParameter("username");
    	String password=request.getParameter("password");
 	   try
 	   {
 		   EmployeeDAO  employeeDaoObject = new EmployeeDAO();
 		   Admin admin = employeeDaoObject.loginAdmin(username, password);
 		 if(admin!=null)
 		 {
 			 HttpSession session =request.getSession();
 			 session.setAttribute(EmployeeInterface.ADMINID, admin.getId());
 			 session.setAttribute(EmployeeInterface.ADMINNAME,admin.getUsername());
 			 session.setAttribute(EmployeeInterface.CURRENT_USER, admin);
 			 response.sendRedirect("AdminWelcomePage.jsp");
 			 //out.print("True");
 		 }
 		 else
 		 {     
 			 out.print("false");
 			 // out.println("<h1>Invalid Email and password</h1>");
 			 //RequestDispatcher rd=request.getRequestDispatcher("adminPage.jsp");  
             //rd.include(request, response);  
 		 }
 		 
 	   }
 	   catch(Exception e)
 	   {
 		  out.println("<h4 align='center'  style='color: red;'>Unable To Connect With Server ! Please Try Again After Some Time</h4>");
		  e.printStackTrace();
 	   }

    }

}
