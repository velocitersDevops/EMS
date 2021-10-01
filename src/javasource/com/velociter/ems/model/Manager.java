package com.velociter.ems.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MANAGER")
public class Manager {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "MANAGERID", updatable = false, nullable = false)
	private int managerId;
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

	public int getManagerId() {
		return managerId;
	}

	public void setManagerId(int managerId) {
		this.managerId = managerId;
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

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDateOfJoining() {
		return dateOfJoining;
	}

	public void setDateOfJoining(String dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getIsdCode() {
		return isdCode;
	}

	public void setIsdCode(String isdCode) {
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

}
