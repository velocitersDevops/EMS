package com.velociter.ems.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "FAMILY")
public class Family {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "FAMILYID", updatable = false, nullable = false)
	private int familyId;
	@Column(name = "FATHERNAME")
	private String fatherName;
	@Column(name = "MOTHERNAME")
	private String motherName;
	@Column(name = "SPOUSENAME")
	private String spouseName;
	/* private Employee employee; */

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
