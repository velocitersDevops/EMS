package com.velociter.ems.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.velociter.ems.model.Country;
import com.velociter.ems.model.Employee;
import com.velociter.ems.model.Family;
import com.velociter.ems.model.Manager;
//import com.velociter.ems.model.PersonalInformation;
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
//					// here we storing project id and project name into the HashMap object
					mapObject.put(resultSetObject.getInt("PROJECTID"),resultSetObject.getString("PROJECTNAME"));
					for (Map.Entry<Integer, String> projectIdAndName : mapObject.entrySet())
					{
						projectIdAndName.getKey() ;projectIdAndName.getValue();
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

		public int registerEmployee(Employee employeeobject) throws SQLException, ParseException  {
			
			insertQuery = "INSERT INTO EMPLOYEE (EMPID,SALUTATION,FIRSTNAME,MIDDLENAME,LASTNAME,EMAIL,ISDCODE,MOBILENUMBER,MANAGERNAME,DOJ,PASSWORD,CREATIONDATE,LASTMODIFIED_DATE,PROJECTID)"
					+ "VALUES(EMPLOYEESEQUENCE.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			

				prepareStatementObject = dbConnection.prepareStatement(insertQuery);

				// do the binding here
				prepareStatementObject.setString(1, employeeobject.getSalutation());
				prepareStatementObject.setString(2, employeeobject.getFirstName());
				prepareStatementObject.setString(3, employeeobject.getMiddleName());
				prepareStatementObject.setString(4, employeeobject.getLastName());
				prepareStatementObject.setString(5, employeeobject.getEmailId());
				prepareStatementObject.setString(6, employeeobject.getisdCode());
				prepareStatementObject.setLong(7, employeeobject.getMobileNumber());
				
				prepareStatementObject.setString(8, employeeobject.getManagerName());

				// here we send the date of joining to the changeDateFormate() to get date in
				// "DD-MMM-YYYY" format
				String dateOfJoin = employeeobject.getDateOfJoining();
				String creationDate = commonOperationObject.getCreationDate();
				employeeobject.setCreationDate(commonOperationObject.getCreationDate()); 
				employeeobject.setLastModifiedDate(commonOperationObject.getCreationDate());
				String afterChangeDateOfJoin = commonOperationObject.changeDateFormate(dateOfJoin);
				
				
				prepareStatementObject.setString(9, afterChangeDateOfJoin);
				prepareStatementObject.setString(10, employeeobject.getPassword());
				prepareStatementObject.setString(11, employeeobject.getCreationDate());
				prepareStatementObject.setString(12, employeeobject.getLastModifiedDate());
				
				//String projectids = employeeobject.getProjectId();
				//System.out.println("project ids in register method : "+projectids);
				prepareStatementObject.setInt(13,employeeobject.getProjectId() );
				
				registerStatus = prepareStatementObject.executeUpdate();
				System.out.println("employee data :" + employeeobject.toString());
			return registerStatus;
		}
		
		
		public  Employee getEmployeeByEmailAndPassword(String email,String password)
	    {
	    	Employee employee=null;
	    	
	    	try
	    	{
	    		String query="select * from EMPLOYEE WHERE EMAIL=? AND PASSWORD=?";
	    		PreparedStatement psmt=dbConnection.prepareStatement(query);
	    		psmt.setString(1, email);
	    		psmt.setString(2, password);
	    		
	    		ResultSet resultSet=psmt.executeQuery();
	    		
	    		if(resultSet.next())
	    		{
	    			employee=new Employee();
	    			String firstName=resultSet.getString("FIRSTNAME");
	    			employee.setFirstName(firstName);
	    			employee.setFamilyId(resultSet.getInt("FAMILYID"));
	    			employee.setEmployeeId(resultSet.getInt("EMPID"));
	    			employee.setAddressId(resultSet.getInt("ADDRESSID"));
	    			employee.setPersonalInfoId(resultSet.getInt("PERSONAL_INFO_ID"));
	    		}
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}
	    	return employee;
	    }
	    
     //method for getting employee list
		
		public  ArrayList<Employee> getEmployeeList()
	    {
	    	
	    	
	    	ArrayList<Employee> empResultSet=new ArrayList<Employee>();
	    	
	    	try
	    	{
	    	   String query="select FIRSTNAME,LASTNAME,EMAIL,MOBILENUMBER,DOJ from EMPLOYEE ";
	    	   PreparedStatement psmt=dbConnection.prepareStatement(query);
	   		   
	   		  ResultSet resultSet=psmt.executeQuery();
	   		  
	   		  while(resultSet.next())
	   		  {
	   			  Employee employee=new Employee();
	   			 
	   			  employee.setFirstName(resultSet.getString("FIRSTNAME"));
	   			  employee.setLastName(resultSet.getString("LASTNAME"));
	   			  employee.setEmailId(resultSet.getString("EMAIL"));
	   			  employee.setMobileNumber(Long.parseLong( resultSet.getString("MOBILENUMBER")));
	   			  employee.setDateOfJoining(resultSet.getString("DOJ"));
	   			  
	   			  empResultSet.add(employee);
	   		  }
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}
	    	return empResultSet;
	    }
		
		//Method for getting Employee Details
		public Employee  getEmployeeDetailsByEmployeeId(Integer empId)
		{
			Employee employee=null;
		  try
		  {
			
		String query="select FIRSTNAME,FAMILYID,MIDDLENAME,LASTNAME,MOBILENUMBER,ALTERNATEMOBILENUMBER,EMAIL,DOJ,PROJECTID,MANAGERNAME from EMPLOYEE where EMPID="+empId;
		PreparedStatement psmt=dbConnection.prepareStatement(query);
		ResultSet resultSet=psmt.executeQuery();
		
		if(resultSet.next())
		{
			employee=new Employee();
			String firstName=resultSet.getString("FIRSTNAME");
			employee.setFirstName(firstName);
			employee.setMiddleName(resultSet.getString("MIDDLENAME"));
			employee.setLastName(resultSet.getString("LASTNAME"));
			employee.setEmailId(resultSet.getString("EMAIL"));
			employee.setMobileNumber(Long.parseLong( resultSet.getString("MOBILENUMBER")));
			employee.setDateOfJoining(resultSet.getString("DOJ"));
			employee.setManagerName(resultSet.getString("MANAGERNAME"));
			employee.setProjectId(resultSet.getInt("PROJECTID"));
			employee.setAlternateContactNumber(Long.parseLong( resultSet.getString("ALTERNATEMOBILENUMBER")));
		  }
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
			return employee;
		}

		//get family detail by familyId
		
		public Family  getFamilyDetailsByFamilyId(Integer familyId)
		{
			Family family=null;
			  try
			  {
				 	
					String query="select * from FAMILY where FAMILYID="+familyId;
					PreparedStatement psmt=dbConnection.prepareStatement(query);
					ResultSet resultSet=psmt.executeQuery();
					
					if(resultSet.next())
					{
						family=new Family();
						family.setFatherName(resultSet.getString("FATHERNAME"));
						family.setMotherName(resultSet.getString("MOTHERNAME"));
						family.setSpouseName(resultSet.getString("SPOUSENAME"));
					}
			  }
			  catch(Exception e)
			  {
				  e.printStackTrace();
			  }
				return family;
		}
		
		//Update employee details
		public int  updateEmployeeDetail(Employee employee)
		{
			int employeeUpdateCount=0;
			try
			{
				
				String query="UPDATE EMPLOYEE SET ALTERNATEMOBILENUMBER=?,MANAGERNAME=? ,PROJECTID=?,LASTMODIFIED_DATE=? where empid="+employee.getEmployeeId();
				PreparedStatement psmt=dbConnection.prepareStatement(query);
				psmt.setLong(1, employee.getAlternateContactNumber());
				psmt.setString(2, employee.getManagerName());
				psmt.setInt(3, employee.getProjectId());
				employee.setLastModifiedDate(commonOperationObject.getCreationDate());
				psmt.setString(4,employee.getLastModifiedDate());
				employeeUpdateCount=psmt.executeUpdate();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return employeeUpdateCount;
		}
		
		//Add family Details of employee
		
		public int addFamilyDetails(Family family,int empId)
		{
			int familyRowCount=0;
			try
			{
				String query="insert into FAMILY (FAMILYID,FATHERNAME,MOTHERNAME,SPOUSENAME) VALUES (? ,?,?,?)";
				PreparedStatement psmt=dbConnection.prepareStatement(query);
				psmt.setInt(1, empId);
				psmt.setString(2, family.getFatherName());
				psmt.setString(3, family.getMotherName());
				psmt.setString(4, family.getSpouseName());
				familyRowCount=psmt.executeUpdate();	
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return familyRowCount;
		}
		
		//Method for update FamilyId In employee table
		public boolean updateFamilyIdInEmployeeTable(Integer empId)
		{
			boolean flag=false;
			
			try
			{
			String query="UPDATE EMPLOYEE SET FAMILYID="+empId+" where EMPID="+empId;
			PreparedStatement psmt=dbConnection.prepareStatement(query);
			psmt.execute();
			flag=true;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return flag;
		}

		//Update family details in family table by familyId
		public int updateFamilyDetails(Family family)
		{
			int familyRowCount=0;
			
			try
			{
				String query="UPDATE FAMILY SET FATHERNAME=?, MOTHERNAME=?, SPOUSENAME=? where FAMILYID="+family.getFamilyId();
				PreparedStatement psmt=dbConnection.prepareStatement(query);
				psmt.setString(1, family.getFatherName());
				psmt.setString(2, family.getMotherName());
				psmt.setString(3, family.getSpouseName());
				familyRowCount=psmt.executeUpdate();	
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return familyRowCount;
		}
		
		
		//method for getting manager name
		
		public  ArrayList<Manager> getManagerList()
	    {
	    	ArrayList<Manager> mngResultSet=new ArrayList<Manager>();
	    	try
	    	{
	    	   String query="select * from MANAGER ";
	    	   PreparedStatement psmt=dbConnection.prepareStatement(query);
	   		  ResultSet resultSet=psmt.executeQuery();
	   		  while(resultSet.next())
	   		  {
	   			  Manager manager=new Manager();
	   			  manager.setManagerName(resultSet.getString("MANAGERNAME"));
	   			  mngResultSet.add(manager);
	   		  }
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}
	    	//System.out.println("manager data  :"+mngResultSet.get(1).getManagerName());
	    	return mngResultSet;
	    }
		
		//method for getting project list 
		
		public  ArrayList<Project> getProjectList()
	    {
	    	ArrayList<Project> projectResultSet=new ArrayList<Project>();
	    	try
	    	{
	    	   String query="select * from Project ";
	    	   PreparedStatement psmt=dbConnection.prepareStatement(query);
	   		  ResultSet resultSet=psmt.executeQuery();
	   		  while(resultSet.next())
	   		  {
	   			  Project project=new Project();
	   			  project.setProjectName(resultSet.getString("PROJECTNAME"));
	   			  projectResultSet.add(project);
	   		  }
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}
	    	return projectResultSet;
	    }
		
		//method for getting country code
		public  ArrayList<Country> getCountryCodeList()
	    {
	    	ArrayList<Country> isdCodeResultSet=new ArrayList<Country>();
	    	try
	    	{
	    	   String query="select ISDCODE from COUNTRY ";
	    	   PreparedStatement psmt=dbConnection.prepareStatement(query);
	   		  ResultSet resultSet=psmt.executeQuery();
	   		  while(resultSet.next())
	   		  {
	   			  Country country= new Country();
	   			 // country.setIsdCode(resultSet.getString("ISDCODE"));
	   			  country.setIsdCode(resultSet.getString("ISDCODE"));
	   			  isdCodeResultSet.add(country);
	   		  }
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}
	    	return isdCodeResultSet;
	    }

}
