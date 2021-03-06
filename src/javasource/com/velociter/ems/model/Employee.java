package com.velociter.ems.model;

public class Employee {
	
	
	private int employeeId;
	private int personalInfoId;
	private int familyId;
	private int addressId;
	private String salutation;
	private String firstName ;
	private String middleName ;
	private String lastName ;
	private String dateOfJoining;
	private String managerName;
	private int projectId;
	private String emailId ;
	private String isdCode;
	private long mobileNumber ;
	private long alternateContactNumber;
	private String password;
	private String creationDate;
	private String lastModifiedDate;
	private String alternateMobileNumber;
	
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public int getPersonalInfoId() {
		return personalInfoId;
	}
	public void setPersonalInfoId(int personalInfoId) {
		this.personalInfoId = personalInfoId;
	}
	public int getFamilyId() {
		return familyId;
	}
	public void setFamilyId(int familyId) {
		this.familyId = familyId;
	}
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public String getSalutation() {
		return salutation;
	}
	public void setSalutation(String salutation) {
		this.salutation = salutation;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lasttName) {
		this.lastName = lasttName;
	}
	public String getDateOfJoining() {
		return dateOfJoining;
	}
	public void setDateOfJoining(String dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getisdCode() {
		return isdCode;
	}
	public void setisdCode(String isdCode) {
		this.isdCode = isdCode;
	}
	public long getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public long getAlternateContactNumber() {
		return alternateContactNumber;
	}
	public void setAlternateContactNumber(long alternateContactNumber) {
		this.alternateContactNumber = alternateContactNumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	public String getLastModifiedDate() {
		return lastModifiedDate;
	}
	public void setLastModifiedDate(String lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}
	
	public String getAlternateMobileNumber() {
		return alternateMobileNumber;
	}
	public void setAlternateMobileNumber(String alternateMobileNumber) {
		this.alternateMobileNumber = alternateMobileNumber;
	}
	@Override
	public String toString() {
		return "Employee [employeeId=" + employeeId + ", personalInfoId=" + personalInfoId + ", familyId=" + familyId
				+ ", addressId=" + addressId + ", salutation=" + salutation + ", firstName=" + firstName
				+ ", middleName=" + middleName + ", lastName=" + lastName + ", dateOfJoining=" + dateOfJoining
				+ ", managerName=" + managerName + ", projectId=" + projectId + ", emailId=" + emailId + ", isdCode="
				+ isdCode + ", mobileNumber=" + mobileNumber + ", alternateContactNumber=" + alternateContactNumber
				+ ", password=" + password + ", creationDate=" + creationDate + ", lastModifiedDate=" + lastModifiedDate
				+ "]";
	}
	
	

}
