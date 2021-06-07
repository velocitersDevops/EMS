package com.velociter.ems.model;

public class Family 
{
	private int familyId;
	private String fatherName;
	private String motherName;
	private String spouseName;
	
	public int getFamilyId() {
		return familyId;
	}
	public void setFamilyId(int familyId) {
		this.familyId = familyId;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getMotherName() {
		return motherName;
	}
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}
	public String getSpouseName() {
		return spouseName;
	}
	public void setSpouseName(String spouseName) {
		this.spouseName = spouseName;
	}
	@Override
	public String toString() {
		return "Family [familyId=" + familyId + ", fatherName=" + fatherName + ", motherName=" + motherName
				+ ", spouseName=" + spouseName + "]";
	}
    
    
}

