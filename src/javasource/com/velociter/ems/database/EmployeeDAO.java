package com.velociter.ems.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.criterion.Projections;

import com.velociter.ems.interfaces.EmployeeInterface;
import com.velociter.ems.model.Address;
import com.velociter.ems.model.Admin;
import com.velociter.ems.model.Designation;
import com.velociter.ems.model.Employee;
import com.velociter.ems.model.Family;
import com.velociter.ems.model.Manager;
import com.velociter.ems.model.PersonalInformation;
import com.velociter.ems.model.Project;
import org.hibernate.query.Query;

public class EmployeeDAO implements EmployeeInterface {

	// creating Object for change the date format
	CommanOperations commonOperationObject = new CommanOperations();
	StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();

	// ==============================================addProject method
	// begin========================================================================
	public int addProject(Project projectObject) throws ParseException {
		System.out.println("project data  :" + projectObject.toString());
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction trnObject = session.beginTransaction();
		projectObject.setCreationDate(commonOperationObject.getCreationDate());
		projectObject.setLastModifiedDate(commonOperationObject.getCreationDate());
		int status = (Integer) session.save(projectObject);
		trnObject.commit();
		System.out.println("project status in ()  :" + status);

		return status;
	}

	// ==============================================addManager() method
	// begin========================================================================
	public int addManager(Manager managerObject) {
		System.out.println("manager data  :" + managerObject.toString());
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction trnObject = session.beginTransaction();
		int managerstatus = (int) session.save(managerObject);
		trnObject.commit();
		// System.out.println("manager status in () :"+ managerstatus);
		return managerstatus;
	}

	@Override
	public int add(Object object) throws ParseException {
		Employee employeeObject = new Employee();
		employeeObject = (Employee) object;
		System.out.println("user data in UserDao:" + employeeObject.toString());
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		// empObject.setEmployeeId(employeeObject.getEmployeeId());
		employeeObject.setFirstName(employeeObject.getFirstName());
		employeeObject.setMiddleName(employeeObject.getMiddleName());
		employeeObject.setLastName(employeeObject.getLastName());
		employeeObject.setSalutation(employeeObject.getSalutation());
		employeeObject.setEmailId(employeeObject.getEmailId());
		employeeObject.setisdCode(employeeObject.getisdCode());
		employeeObject.setMobileNumber(employeeObject.getMobileNumber());
		employeeObject.setDesignationName(employeeObject.getDesignationName());
		employeeObject.setManagerName(employeeObject.getManagerName());
		// empObject.setDateOfJoining(employeeObject.);

		employeeObject.setCreationDate(commonOperationObject.getCreationDate());
		String afterChangeDateOfJoin = commonOperationObject.changeDateFormate(employeeObject.getDateOfJoining());
		employeeObject.setDateOfJoining(afterChangeDateOfJoin);
		employeeObject.setProjectId(employeeObject.getProjectId());
		employeeObject.setPassword(employeeObject.getPassword());
		employeeObject.setLastModifiedDate(commonOperationObject.getCreationDate());
		System.out.println("Employee Data Before save:" + employeeObject.toString());
		int registerStatus = (Integer) session.save(employeeObject);

		t.commit();
		session.close();
		System.out.println("registerStatus value  :" + registerStatus);
		return registerStatus;
	}

	public void addNew(Object object) throws ParseException {
		Employee employeeObject = new Employee();
		employeeObject = (Employee) object;
		System.out.println("user data in UserDao:" + employeeObject.toString());
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		// empObject.setEmployeeId(employeeObject.getEmployeeId());
		employeeObject.setFirstName(employeeObject.getFirstName());
		employeeObject.setMiddleName(employeeObject.getMiddleName());
		employeeObject.setLastName(employeeObject.getLastName());
		employeeObject.setSalutation(employeeObject.getSalutation());
		employeeObject.setEmailId(employeeObject.getEmailId());
		employeeObject.setisdCode(employeeObject.getisdCode());
		employeeObject.setMobileNumber(employeeObject.getMobileNumber());
		employeeObject.setDesignationName(employeeObject.getDesignationName());
		employeeObject.setManagerName(employeeObject.getManagerName());
		// empObject.setDateOfJoining(employeeObject.);

		employeeObject.setCreationDate(commonOperationObject.getCreationDate());
		String afterChangeDateOfJoin = commonOperationObject.changeDateFormate(employeeObject.getDateOfJoining());
		employeeObject.setDateOfJoining(afterChangeDateOfJoin);
		employeeObject.setProjectId(employeeObject.getProjectId());
		employeeObject.setPassword(employeeObject.getPassword());
		employeeObject.setLastModifiedDate(commonOperationObject.getCreationDate());
		System.out.println("Employee Data Before save:" + employeeObject.toString());
		session.saveOrUpdate(employeeObject);

		t.commit();
		session.close();
	}

	// ======================================================================================================================================
	public boolean checkExistingEmail(Employee employeObject) {
		String email = employeObject.getEmailId();
		long mobile = employeObject.getMobileNumber();
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();

		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		System.out.println("controll is comming");
		Query query = session.createQuery(
				"from Employee e where e.emailId = " + "'" + email + "'" + " OR e.mobileNumber = " + mobile);// here
																												// persistent
																												// class
																												// name
																												// is
																												// Manager
		List<Employee> listObject = query.getResultList();
		System.out.println("list data :" + listObject.toString());
		System.out.println("list is empty or not :" + listObject.isEmpty());
		t.commit();
		session.close();
		if (listObject.isEmpty() == true) {
			return true; // it means user can register because emaild and mobile number is new
		} else {
			return false;// it means user can not register because emaild and mobile number is already
							// Register
		}
	}

	// =====================================================LoginCode================================================================================

	public Employee loginEmployee(String email, String password) {
		Employee employee = null;
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		System.out.println("email and password in empDao:" + email + " " + password);
		try {
			String query = "from Employee as E where E.emailId=:email and E.password=:password";
			Query queryObject = session.createQuery(query);
			queryObject.setParameter("email", email);
			queryObject.setParameter("password", password);
			employee = (Employee) queryObject.getSingleResult();
			System.out.println("empid after login :" + employee.getEmployeeId());
			System.out.println("if wrong password Employee data " + employee.toString());
			t.commit();
		} catch (Exception e) {
			employee = null;
			// System.out.println("if wrong password Employee data " + employee.toString());
		}
		return employee;
	}

	// =====================================================EmployeeListCode================================================================================

	public List<Employee> getEmployeeList() {

		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		System.out.println("Control is comming in get Employee list");
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		List<Employee> employees = session.createQuery("FROM Employee").list();
		System.out.println("EmployeeData:" + employees.toString());
		t.commit();
		return employees;
	}

	// ======================================================================================================================================
	// here getFourIds() taking employeeId and it will return
	// familyid,addressId,PersonalInfoId to EmployeeDetails servlet

	public Employee getFourIds(int id) {
		Employee employee = null;
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		System.out.println("id in Details:" + id);
		String getQuery = "from Employee as E where E.employeeId=:id ";
		Query query = session.createQuery(getQuery);
		query.setParameter("id", id);
		employee = (Employee) query.getSingleResult();
		List list = query.list();
		System.out.println("Employee data after login" + list.toString());
		t.commit();
		return employee;
	}

	// ======================================================================================================================================
	public Employee getEmployeeDetails(int empid) {
		Employee employee = null;
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		System.out.println("id in Details:" + empid);
		String getQuery = "from Employee as E where E.employeeId=:empid ";
		Query query = session.createQuery(getQuery);
		query.setParameter("empid", empid);
		employee = (Employee) query.getSingleResult();
		List list = query.list();
		System.out.println("Employee data after login" + list.toString());
		t.commit();
		return employee;
	}

	// ============================getting
	// personalInformation==================================================================================================

	public PersonalInformation getPersonalInformation(int id) {
		PersonalInformation personalInfo = null;
		try {
			StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
			Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
			SessionFactory factory = meta.getSessionFactoryBuilder().build();
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			System.out.println("id in Details:" + id);
			String getQuery = "from PersonalInformation as P where P.personalInfoId=:id ";
			Query query = session.createQuery(getQuery);
			query.setParameter("id", id);
			personalInfo = (PersonalInformation) query.getSingleResult();
			List list = query.list();
			System.out.println("Employee data after login" + list.toString());
			t.commit();
			return personalInfo;
		} catch (Exception e) {
			return null;
			// personalInfo = null;
			// System.out.println("persoanl data :"+personalInfo.toString());
		}
	}

	// =========================================getting family
	// details================================================================================

	public Family getFamilyDetails(int familyId) {
		Family familyObject = null;
		try {
			StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
			Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
			SessionFactory factory = meta.getSessionFactoryBuilder().build();
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			System.out.println("id in Details:" + familyId);
			String getQuery = "from Family as F where F.familyId=:id ";
			Query query = session.createQuery(getQuery);
			query.setParameter("id", familyId);
			familyObject = (Family) query.getSingleResult();
			List list = query.list();
			System.out.println("Employee data after login" + list.toString());
			t.commit();
		} catch (Exception e) {
			e.printStackTrace();
			// familyObject = null;
		}
		return familyObject;
	}

	// ============================getting Address
	// Details===========================================================================================

	public Address getAddressDetails(int id) {
		Address addressObject = null;
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		System.out.println("id in Details:" + id);
		String getQuery = "from Address as A where A.addressId=:id ";
		Query query = session.createQuery(getQuery);
		query.setParameter("id", id);
		addressObject = (Address) query.getSingleResult();
		List list = query.list();
		t.commit();
		return addressObject;
	}

	// ============================getting Address
	// Details===========================================================================================

	public Manager getManagerList() {
		Manager managerObject = null;
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String getQuery = "from Manager";
		Query query = session.createQuery(getQuery);
		managerObject = (Manager) query.getSingleResult();
		List list = query.list();
		System.out.println("Manager Object data  :" + managerObject.toString());
		t.commit();
		return managerObject;
	}

	public List<Manager> getManagerListData() {

		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		System.out.println("Control is comming in get Employee list");
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		List<Manager> employees = session.createQuery("FROM Manager").list();
		System.out.println("EmployeeData:" + employees.toString());
		t.commit();
		return employees;
	}

	// ======================================================================================================================================

	public List<Manager> getManagerNames() {
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		System.out.println("controll is comming");
		Query query = session.createQuery("from Manager");// here persistent class name is Manager
		List<Manager> listObject = query.getResultList();
		System.out.println("list data :" + listObject.toString());
		t.commit();
		session.close();
		return listObject;
	}
	// ======================================================================================================================================

	public HashMap<Integer, String> getProjectNames() {
		HashMap<Integer, String> mapObject = new HashMap<Integer, String>();
		int i = 0;
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		System.out.println("controll is comming in project()");
		SessionFactory factoryy = meta.getSessionFactoryBuilder().build();
		Session session = factoryy.openSession();
		Transaction t = session.beginTransaction();
		Query query = session.createQuery("from Project");// here persistent class name is Manager
		List<Project> listObjects = query.getResultList();
		for (Project projectObject : listObjects) {
			mapObject.put(projectObject.getProjectId(), projectObject.getProjectName());
			// System.out.println("project id :"+projectObject.getProjectId()+"
			// ---"+"project name :"+projectObject.getProjectName());
		}
		System.out.println("list project data :" + listObjects.toString());
		return mapObject;
	}

	// ====================================================================

	public Admin loginAdmin(String username, String password) {
		Admin admin = null;
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		System.out.println("username and password in empDao:" + username + " " + password);
		try {
			String query = "from Admin as a where a.username=:username and a.password=:password";
			Query queryObject = session.createQuery(query);
			queryObject.setParameter("username", username);
			queryObject.setParameter("password", password);
			System.out.println("1");
			admin = (Admin) queryObject.getSingleResult();
			System.out.println("2");
			System.out.println("id after login :" + admin.getId());
			System.out.println("if wrong password Admin data " + admin.toString());
			t.commit();
		} catch (Exception e) {
			admin = null;
			// System.out.println("if wrong password Employee data " + employee.toString());
		}
		return admin;
	}

	// ===================================================================================================================

	public List<Employee> getListPaggination(int s, int numberOfRecordsPerPage) {
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		System.out.println("Control is comming in get Employee list");
		Session session = factory.openSession();

		Criteria crit = session.createCriteria(Employee.class);
		crit.setFirstResult(s);
		System.out.println("S For : " + s);
		crit.setMaxResults(numberOfRecordsPerPage);
		System.out.println("Number OF Records Page For : " + s);
		// crit.setProjection(Projections.rowCount());
		System.out.println(crit);
		List<Employee> listEmployee = crit.list();
		return listEmployee;
	}

	// ===================================================================================================================

	public List<Employee> setPaggination() {
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		System.out.println("Control is comming in get Employee list");
		Session session = factory.openSession();

		Criteria crit1 = session.createCriteria(Employee.class);
		crit1.setProjection(Projections.rowCount());
		List<Employee> listEmployee = crit1.list();
		return listEmployee;
	}

	// private static int pageSize = 5;
	public static List getPageData(int pageNumber, int pageSize) {
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		System.out.println("Control is comming in get Employee list");
		Session session = factory.openSession();
		List result = null;
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Employee");
			query = query.setFirstResult(pageSize * (pageNumber - 1));
			query.setMaxResults(pageSize);
			result = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static long getNoOfRecords() {
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		System.out.println("Control is comming in get Employee list");
		Session session = factory.openSession();
		long count = (long) session.createQuery("SELECT COUNT(e) FROM Employee e").getSingleResult();
		return count;
	}

	public List<Designation> getDesignationNames() {
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		System.out.println("controll is comming");
		Query query = session.createQuery("from Designation");// here persistent class name is Manager
		List<Designation> listObject = query.getResultList();
		System.out.println("list data :" + listObject.toString());
		t.commit();
		session.close();
		return listObject;
	}

	/*-------------------------------------------------------*/
	public Designation getDesignationById(int did) {
		Designation des = null;
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		try {
			des = (Designation) session.get(Designation.class, did);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return des;
	}

	// get all products of given category
	public List<Employee> getAllEmployeesById(int did) {
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Query query = session.createQuery("from Employee as e where e.designation.designationId=:id");
		query.setParameter("id", did);
		List<Employee> list = query.list();
		return list;
	}

	/*-----------------------------------------------------------*/
	public static long countEmployee() {
		long row = 0;
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "SELECT COUNT(*) FROM Employee e";
		Query query = session.createQuery(SQL_QUERY);
		for (Iterator it = query.iterate(); it.hasNext();) {
			row = (Long) it.next();
			System.out.print("Count Employee: " + row);
		}
		session.getTransaction().commit();
		session.close();
		return row;
	}
	
	public static long countProject() {
		long row = 0;
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "SELECT COUNT(*) FROM Project p";
		Query query = session.createQuery(SQL_QUERY);
		for (Iterator it = query.iterate(); it.hasNext();) {
			row = (Long) it.next();
			System.out.print("Count Project: " + row);
		}
		session.getTransaction().commit();
		session.close();
		return row;
	}
	
	public static long countManager() {
		long row = 0;
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String SQL_QUERY = "SELECT COUNT(*) FROM Employee as e where e.designation.designationId=5";
		Query query = session.createQuery(SQL_QUERY);
		for (Iterator it = query.iterate(); it.hasNext();) {
			row = (Long) it.next();
			System.out.print("Count Manager: " + row);
		}
		session.getTransaction().commit();
		session.close();
		return row;
	}
	/*-----------------------------------------------------------*/
	
	/*
	 * //=============================================Add Family
	 * Details====================================================================
	 * public int addFamilyDetails(Family family,int employeeId) { int
	 * addFamilyStatus =0; StandardServiceRegistry ssr = new
	 * StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
	 * Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
	 * System.out.println("controll is comming in addFamilyDetails ");
	 * SessionFactory factory = meta.getSessionFactoryBuilder().build(); Session
	 * session = factory.openSession(); Transaction tx = session.beginTransaction();
	 * System.out.println("family id before update :"+family.getFamilyId());
	 * session.save(family); tx.commit(); session.close();
	 * System.out.println("addFamilyStatus is :"+addFamilyStatus); return
	 * addFamilyStatus; }
	 * //===================================================Update Employee
	 * Details============================================================== public
	 * int updateEmployeeDetail(Employee employee) { try { StandardServiceRegistry
	 * ssr = new
	 * StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
	 * Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
	 * System.out.println("controll is comming in updateEmployeeDetail()");
	 * SessionFactory factory = meta.getSessionFactoryBuilder().build(); Session
	 * session = factory.openSession(); Transaction tx = session.beginTransaction();
	 * System.out.println("employee id before update :"+employee.getEmployeeId());
	 * //session.update(employee);
	 * session.get(Employee.class,employee.getEmployeeId()); tx.commit();
	 * session.close(); return 1; }catch(Exception e) { return 0; }
	 * 
	 * }
	 * 
	 * //===================================================Update Family Id In
	 * Employee table==============================================================
	 * public int updateFamilyIdInEmployeeTable(int empId) { Employee employeeObject
	 * = new Employee(); try { StandardServiceRegistry ssr = new
	 * StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
	 * Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
	 * System.out.println("controll is comming in updateEmployeeDetail()");
	 * SessionFactory factory = meta.getSessionFactoryBuilder().build(); Session
	 * session = factory.openSession(); Transaction tx = session.beginTransaction();
	 * employeeObject.setEmployeeId(empId); //employeeObject.setFamilyId(empId);
	 * System.out.println("family id before update :"+employeeObject.getEmployeeId()
	 * ); employeeObject=session.get(Employee.class,empId);
	 * employeeObject.setFamilyId(empId); session.saveOrUpdate(employeeObject);
	 * tx.commit(); session.close(); return 1; }catch(Exception e) { return 0; } }
	 * 
	 * //===================================================Update Family
	 * Details============================================================== public
	 * int updateFamilyDetails(Family family) { Family familyObject = new Family();
	 * try { StandardServiceRegistry ssr = new
	 * StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
	 * Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
	 * System.out.println("controll is comming in updateFamilyDetails()");
	 * SessionFactory factory = meta.getSessionFactoryBuilder().build(); Session
	 * session = factory.openSession(); Transaction tx = session.beginTransaction();
	 * familyObject.setFamilyId(family.getFamilyId());
	 * familyObject.setFatherName(family.getFatherName());
	 * familyObject.setMotherName(family.getMotherName());
	 * familyObject.setSpouseName(family.getSpouseName());
	 * session.get(Family.class,family.getFamilyId());
	 * System.out.println("family id before update :"+familyObject.getFamilyId());
	 * session.update(familyObject); tx.commit(); session.close(); return 1;
	 * }catch(Exception e) { return 0; }
	 * 
	 * } //===================================================Update PersonalInfo
	 * Details============================================================== public
	 * int updatePersonalInfoDetails(PersonalInformation pesonalInfoObject) {
	 * PersonalInformation personalObject = new PersonalInformation(); try {
	 * StandardServiceRegistry ssr = new
	 * StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
	 * Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
	 * System.out.println("controll is comming in updatePersonalInfoDetails()");
	 * SessionFactory factory = meta.getSessionFactoryBuilder().build(); Session
	 * session = factory.openSession(); Transaction tx = session.beginTransaction();
	 * personalObject.setPersonalInfoId(pesonalInfoObject.getPersonalInfoId());
	 * personalObject.setBankAccountNumber(pesonalInfoObject.getBankAccountNumber())
	 * ; personalObject.setMaritalStatus(pesonalInfoObject.getMaritalStatus());
	 * System.out.println("persoanl info id before update :"+personalObject.
	 * getPersonalInfoId()); session.update(personalObject); tx.commit();
	 * session.close(); return 1; }catch(Exception e) { return 0; } }
	 * //===================================================Update Address
	 * Details============================================================== public
	 * int updateAddressRecord(Address address) { Address addressObject =new
	 * Address(); try { StandardServiceRegistry ssr = new
	 * StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
	 * Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
	 * System.out.println("controll is comming in updatePersonalInfoDetails()");
	 * SessionFactory factory = meta.getSessionFactoryBuilder().build(); Session
	 * session = factory.openSession(); Transaction tx = session.beginTransaction();
	 * addressObject.setAddressId(address.getAddressId());
	 * addressObject.setCountryName(address.getCountryName());
	 * addressObject.setStateName(address.getStateName());
	 * addressObject.setCityName(address.getCityName());
	 * addressObject.setAddressLine1(address.getAddressLine1());
	 * addressObject.setHouseNumber(address.getHouseNumber());
	 * addressObject.setPincodeNumber(address.getPincodeNumber());
	 * addressObject.setStreetNumber(address.getStreetNumber());
	 * addressObject.setAddressType(address.getAddressType());
	 * System.out.println("address id before update :"+addressObject.getAddressId())
	 * ; session.update(addressObject); tx.commit(); session.close(); return 1;
	 * }catch(Exception e) { return 0; } }
	 * //===================================================Add PersonalInformation
	 * Details===================================================================
	 * public int addpersonalInfoDetails(PersonalInformation personalObject) { int
	 * personalInfoStatus =0; StandardServiceRegistry ssr = new
	 * StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
	 * Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
	 * System.out.println("controll is comming in addpersonalInfoDetails ");
	 * SessionFactory factory = meta.getSessionFactoryBuilder().build(); Session
	 * session = factory.openSession(); Transaction tx = session.beginTransaction();
	 * System.out.println("family id before update :"+personalObject.
	 * getPersonalInfoId()); session.save(personalObject); tx.commit();
	 * session.close(); return personalInfoStatus; }
	 * //===================================================Add Address
	 * Details===================================================================
	 * public int addAddressDetails(Address addressObject) { int addressStatus =0;
	 * StandardServiceRegistry ssr = new
	 * StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
	 * Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
	 * System.out.println("controll is comming in addpersonalInfoDetails ");
	 * SessionFactory factory = meta.getSessionFactoryBuilder().build(); Session
	 * session = factory.openSession(); Transaction tx = session.beginTransaction();
	 * System.out.println("family id before update :"+addressObject.getAddressId());
	 * session.save(addressObject); tx.commit(); session.close(); return
	 * addressStatus; } //===================================================update
	 * Address id in employee
	 * table===================================================================
	 * public int updateAddressidInEmployeeTable(int addressId) { Employee
	 * employeeObject = new Employee(); try { StandardServiceRegistry ssr = new
	 * StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
	 * Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
	 * System.out.println("controll is comming in updateEmployeeDetail()");
	 * SessionFactory factory = meta.getSessionFactoryBuilder().build(); Session
	 * session = factory.openSession(); Transaction tx = session.beginTransaction();
	 * employeeObject.setEmployeeId(addressId); //employeeObject.setFamilyId(empId);
	 * System.out.println("family id before update :"+employeeObject.getEmployeeId()
	 * ); employeeObject=session.get(Employee.class,addressId);
	 * employeeObject.setAddressId(addressId); session.saveOrUpdate(employeeObject);
	 * tx.commit(); session.close(); return 1; }catch(Exception e) {
	 * System.out.println("controll in catch block"); return 0; } }
	 * //===================================================update personal info id
	 * in employee
	 * table===================================================================
	 * public int updatePersonalInfoidInEmployeeTable(int personalInfoid) { Employee
	 * employeeObject = new Employee(); try { StandardServiceRegistry ssr = new
	 * StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
	 * Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
	 * System.out.println("controll is comming in updateEmployeeDetail()");
	 * SessionFactory factory = meta.getSessionFactoryBuilder().build(); Session
	 * session = factory.openSession(); Transaction tx = session.beginTransaction();
	 * employeeObject.setEmployeeId(personalInfoid);
	 * //employeeObject.setFamilyId(empId);
	 * System.out.println("personalInfo id before update :"+employeeObject.
	 * getPersonalInfoId());
	 * employeeObject=session.get(Employee.class,personalInfoid);
	 * employeeObject.setPersonalInfoId(personalInfoid);
	 * session.saveOrUpdate(employeeObject); tx.commit(); session.close(); return 1;
	 * }catch(Exception e) { System.out.println("controll in catch block"); return
	 * 0; } }
	 */
}
