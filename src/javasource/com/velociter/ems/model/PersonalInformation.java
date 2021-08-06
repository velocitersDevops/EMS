package com.velociter.ems.model;

public class PersonalInformation {
	
	private int personalInfoId ;
	private String dateOfBirth  ;
	private String sex ;
	private String panNumber ;
	private long aadharNumber ;
	private String passportNumber;
	private long bankAccountNumber;
	private String nationality;
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
