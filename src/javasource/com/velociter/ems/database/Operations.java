package com.velociter.ems.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import com.velociter.ems.model.Employee;
import com.velociter.ems.model.Project;

public class Operations {
	
	//here we are getting database connection
		Connection dbConnection = DatabaseConnection.getDBConnection();
	
		//statement object for checking the emailId or mobile number already register or not
		Statement statementObject1 = null;
		
		boolean emailcheckstatus;
		//prepared Statement object for Register the details of new Employee
		PreparedStatement prepareStatementObject= null;
		
		//here we are doing emailid or mobile number validation that employee already register
		//with email id or mobile number or not,if already register then not allow to register
		public boolean checkExistingEmail(Employee employeeobject) throws SQLException {
			
				System.out.println("employee email id 1is :");
				String email = employeeobject.getEmailId();
				long mobile = employeeobject.getMobileNumber();
				System.out.println("employee email id is :" + email);
				String emailOrMobileCheckQuery = "select firstname from employee where email = " + "'" + email + "'"
						+ " OR MOBILENUMBER = " + mobile;
				statementObject1 = dbConnection.createStatement();
				ResultSet resultSetObject = statementObject1.executeQuery(emailOrMobileCheckQuery);

				// if employee already register with emailid then return true
				if (resultSetObject.next() == false) {
					return true;
					// emailcheckstatus = resultSetObject.getString("FIRSTNAME");
				}
			
			
			// System.out.println(" checkstatus befor return is :" + emailcheckstatus);
			return emailcheckstatus;
		}

		   //here we get Project name information  and send back to Register.jsp to display in dropdown list
		   //Creating HashMap object to store projectid in key and projectname in value 
		   Project projectObject = new Project();
		
		   HashMap<Integer,String> mapObject=new HashMap<Integer,String>();
		public HashMap<Integer,String> getProjectName() throws SQLException
		{
			
				//System.out.println("controll is comming in project");
				Statement projectStatementObject = dbConnection.createStatement();
				String getProjectDetailsQuery = "select PROJECTID , PROJECTNAME from PROJECT";
				ResultSet resultSetObject = projectStatementObject.executeQuery(getProjectDetailsQuery);
				// if Project details available then get information
				while (resultSetObject.next()) 
				{
					//System.out.println("project id and name   :"+resultSetObject.getInt(1)+"  -- "+resultSetObject.getString(2));
					// here we storing project id and project name into the HashMap object
					mapObject.put(resultSetObject.getInt("PROJECTID"),resultSetObject.getString("PROJECTNAME"));
					for (Map.Entry<Integer, String> projectIdAndName : mapObject.entrySet())
					{
						projectIdAndName.getKey(); projectIdAndName.getValue();
					}
				}
		
			return  mapObject; 
		}

		
		// creating Object for change the date format
		CommanOperations commonOperationObject = new CommanOperations();

		// code for Employee regiter
		// its performing the operation related to new employee Registeration
		// here we are storing employee information into the database
		private int registerStatus = 0;
		private String insertQuery = null;

		public int registerEmployee(Employee employeeobject) throws SQLException  {
			System.out.println("employee data :" + employeeobject.toString());
			insertQuery = "INSERT INTO EMPLOYEE (EMPID,SALUTATION,FIRSTNAME,MIDDLENAME,LASTNAME,EMAIL,MOBILENUMBER,ALTERNATEMOBILENUMBER,MANAGERNAME,DOJ,PASSWORD,CREATIONDATE,LASTMODIFIED_DATE,PROJECTIDS)"
					+ "VALUES(EMPLOYEESEQUENCE.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			

				prepareStatementObject = dbConnection.prepareStatement(insertQuery);

				// do the binding here
				prepareStatementObject.setString(1, employeeobject.getSalutation());
				prepareStatementObject.setString(2, employeeobject.getFirstName());
				prepareStatementObject.setString(3, employeeobject.getMiddleName());
				prepareStatementObject.setString(4, employeeobject.getLasttName());
				prepareStatementObject.setString(5, employeeobject.getEmailId());
				prepareStatementObject.setLong(6, employeeobject.getMobileNumber());
				prepareStatementObject.setLong(7, employeeobject.getAlternateContactNumber());
				prepareStatementObject.setString(8, employeeobject.getManagerName());

				// here we send the date of joining to the changeDateFormate() to get date in
				// "DD-MMM-YYYY" format
				String dateOfJoin = employeeobject.getDateOfJoining();
				String creationDate = employeeobject.getCreationDate();
				String lastModifiefDate = employeeobject.getDateOfJoining();
				String afterChangeDateOfJoin = commonOperationObject.changeDateFormate(dateOfJoin);
				
				
				prepareStatementObject.setString(9, afterChangeDateOfJoin);
				prepareStatementObject.setString(10, employeeobject.getPassword());
				prepareStatementObject.setString(11, creationDate);
				prepareStatementObject.setString(12, lastModifiefDate);
				
				String projectids = employeeobject.getProjectId();
				System.out.println("project ids in register method : "+projectids);
				prepareStatementObject.setString(13, projectids);
				
				registerStatus = prepareStatementObject.executeUpdate();
				//System.out.println("employee data :=" + employeeobject.toString());

			return registerStatus;
		}

		

}
