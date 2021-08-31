package com.velociter.ems.controller;
//import java.net.PasswordAuthentication;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;

public class Mailer {
	
public static boolean send(String to,String subject,String msg,String admin,String password)
{
//	ServletContext context=getServletConfig().getServletContext();
//	context.getInitParameter("Email");
final String user=admin;//change accordingly
final String pass=password;
//  
//1st step) Get the session object	
Properties props = new Properties();
props.put("mail.smtp.host", "smtp.gmail.com");//change accordingly
//props.put("mail.smtp.port", "587"); 
props.put("mail.smtp.starttls.enable","true");
props.put("mail.smtp.auth", "true");

Session session = Session.getDefaultInstance(props,
 new javax.mail.Authenticator() {
  protected PasswordAuthentication getPasswordAuthentication() {
   return new PasswordAuthentication(user,pass);
   }
});
//2nd step)compose message
try {
 MimeMessage message = new MimeMessage(session);
 message.setFrom(new InternetAddress(user));
 message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
 message.setSubject(subject);
 message.setText(msg);
 
 //3rd step)send message
 Transport.send(message);

 System.out.println("Done");
return true;
 } catch (MessagingException e) {
	throw new RuntimeException(e);
 }
	
}
}
