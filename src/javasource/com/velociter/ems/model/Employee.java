package com.velociter.ems.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "EMPLOYEE")
public class Employee {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "EMPID", updatable = false, nullable = false)
	private int employeeId;
	@Column(name = "PERSONAL_INFO_ID")
	private int personalInfoId;
	@Column(name = "FAMILYID")
	private int familyId;
	@Column(name = "ADDRESSID")
	private int addressId;
	@Column(name = "SALUTATION")
	private String salutation;
	@Column(name = "FIRSTNAME")
	private String firstName;
	@Column(name = "MIDDLENAME")
	private String middleName;
	@Column(name = "LASTNAME")
	private String lastName;
	@Column(name = "DOJ")
	private String dateOfJoining;
	@Column(name = "MANAGERNAME")
	private String managerName;
	@Column(name = "PROJECTID")
	private int projectId;
	@Column(name = "EMAIL")
	private String emailId;
	@Column(name = "ISDCODE")
	private String isdCode;
	@Column(name = "MOBILENUMBER")
	private long mobileNumber;
	@Column(name = "ALTERNATEMOBILENUMBER")
	private long alternateContactNumber;
	@Column(name = "PASSWORD")
	private String password;
	@Column(name = "CREATIONDATE")
	private String creationDate;
	@Column(name = "LASTMODIFIED_DATE")
	private String lastModifiedDate;

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
