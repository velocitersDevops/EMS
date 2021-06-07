package com.velociter.ems.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class LogoutServlet extends HttpServlet
{
  @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
	  HttpSession session = request.getSession();
      session.invalidate();
      
      
      
      RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
      
    
      rd.forward(request, response);
      response.setHeader("Cache-Control", "no-cache");
      response.setHeader("Cache-Control", "no-store");
      response.setHeader("Pragma", "no-cache");
      response.setDateHeader("Expires", 0);
  }
}
