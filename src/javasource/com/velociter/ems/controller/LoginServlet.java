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
    	//out.print(email);
    	
 	   String msg;
 	   try
 	   {
 		 // String url="jdbc:oracle:thin:@localhost:1521:XE";
 		// Class.forName("oracle.jdbc.driver.OracleDriver"); 
 		// System.out.println("Driver loaded");
 		 //Connection con=DriverManager.getConnection(url,"Velociter","velociter");
 		// System.out.println("Connection establish");
 		 //  Connection con=DatabaseConnection.getConnection();
 		//PreparedStatement ps = con.prepareStatement("select FIRSTNAME,EMPID,FAMILYID from EMPLOYEE where EMAIL='"+email+"' and  PASSWORD='"+password+"'");
 		//ps.setString(1, "EMAIL");
 		//ps.setString(2, "PASSWORD");
 		// ResultSet resultSet=ps.executeQuery();
 		// System.out.println("Email");
 		   
 		//   Operations dbOperation=new Operations(DatabaseConnection.getDBConnection());
 		   Operations operationObject=new Operations();
 		  DatabaseConnection.getDBConnection();
 		    Employee employee= operationObject.getEmployeeByEmailAndPassword(email, password);
 		 
 		 if(employee!=null)
 		 {
 			
 			// String empId=resultSet.getString("EMPID");
 			// String firstName=resultSet.getString("FIRSTNAME");
 			// String familyId=resultSet.getString("FAMILYID");
 			 
 			
 			 HttpSession session =request.getSession();
 			// session.setAttribute("firstName", employee.getFirstName());
 			//session.setAttribute("empId", employee.getEmpId());
 			//session.setAttribute("familyId", familyId);
 			 
 			 session.setAttribute("currentUser",employee);
 			 
 			 //resp.sendRedirect("Welcome.jsp");
 			 //out.print("1");
 			 //msg="1";
 			// obj.put("msg", msg);
 			// list.add(obj);
 			// out.println(list.toJSONString());
 			 //out.flush();
 			//RequestDispatcher rd=request.getRequestDispatcher("Welcome.jsp");
 			
 			//rd.forward(request, response);
 			
 			//response.getWriter().write("True");
 		//out.print(familyId);
 			response.sendRedirect("Welcome.jsp");
 			
 		 }
 		 else
 		 {
 			 
 			 //out.print("3");
 			//msg="3";
			// obj.put("msg", msg);
			 //list.add(obj);
			 //out.println(list.toJSONString());
			 //out.flush();
 			response.sendRedirect("Login.jsp");
 			 
 			 //response.getWriter().write("false");
 		 }
 		 //con.close();
 	   }
 	   catch(Exception e)
 	   {
 		
 		System.out.println("vivek");
 		e.printStackTrace();
 	   }

    }
}
