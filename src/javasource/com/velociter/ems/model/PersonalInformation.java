package com.velociter.ems.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PERSONAL_INFORMATIONS")
public class PersonalInformation {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "PERSONAL_INFO_ID", updatable = false, nullable = false)
	private int personalInfoId ;
	@Column(name = "DOB")
	private String dateOfBirth  ;
	@Column(name = "SEX")
	private String sex ;
	@Column(name = "PANNUMBER")
	private String panNumber ;
	@Column(name = "AADHARNUMBER")
	private long aadharNumber ;
	@Column(name = "PASSPORTNUMBER")
	private String passportNumber;
	@Column(name = "BANK_ACCOUNT_NUMBER")
	private long bankAccountNumber;
	@Column(name = "NATIONALITY")
	private String nationality;
	@Column(name = "MARITALSTATUS")
	private String maritalStatus;
	
	public int getPersonalInfoId() {
		return personalInfoId;
	}
	public void setPersonalInfoId(int personalInfoId) {
		this.personalInfoId = personalInfoId;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPanNumber() {
		return panNumber;
	}
	public void setPanNumber(String panNumber) {
		this.panNumber = panNumber;
	}
	public long getAadharNumber() {
		return aadharNumber;
	}
	public void setAadharNumber(long aadharNumber) {
		this.aadharNumber = aadharNumber;
	}
	public String getPassportNumber() {
		return passportNumber;
	}
	public void setPassportNumber(String passportNumber) {
		this.passportNumber = passportNumber;
	}
	public long getBankAccountNumber() {
		return bankAccountNumber;
	}
	public void setBankAccountNumber(long bankAccountNumber) {
		this.bankAccountNumber = bankAccountNumber;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	@Override
	public String toString() {
		return "PersonalInformation [personalInfoId=" + personalInfoId + ", dateOfBirth=" + dateOfBirth + ", sex=" + sex
				+ ", panNumber=" + panNumber + ", aadharNumber=" + aadharNumber + ", passportNumber=" + passportNumber
				+ ", bankAccountNumber=" + bankAccountNumber + ", nationality=" + nationality + ", maritalStatus="
				+ maritalStatus + "]";
	}
	
	

}
