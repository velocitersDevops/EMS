package com.velociter.ems.interfaces;

public interface EmployeeInterface {

	  public static final String EMPLOYEEID = "empId"  ;
	  public static final String ADMINID = "adminId"  ;
	  public static final String ADMINNAME   ="adminName" ;
	  public static final String PERSONALINFO_ID  =  "personalInfoId" ;
	  public static final String ADDRESSID = "addressId" ;
	  public static final String FAMILYID   ="familyId" ;
	  public static final String FIRSTNAME   ="firstName" ;
	  public static final String CURRENT_USER   ="currentuser";
	  public static final String ADMIN_USER   ="adminuser";
	  public static final String MESSAGE   ="message";
	  public static final int PAGE_SIZE = 5;
	 
	  public int add(Object object) throws Exception ;
}
