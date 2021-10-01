package com.velociter.ems.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "DESIGNATION")
public class Designation {
	@Id
	@Column(name = "DESIGNATIONID", updatable = false, nullable = false)
	private int designationId;
	@Column(name = "DESIGNATIONNAME")
	private String designationName;
	
	/*
	 * @OneToOne( mappedBy = "designation" , cascade = CascadeType.ALL)
	 * 
	 * @JoinColumn(name="E_Id") private Employee employee;
	 * 
	 * public Employee getEmployee() { return employee; }
	 * 
	 * public void setEmployee(Employee employee) { this.employee = employee; }
	 */

	public int getDesignationId() {
		return designationId;
	}

	public void setDesignationId(int designationId) {
		this.designationId = designationId;
	}

	public String getDesignationName() {
		return designationName;
	}

	public void setDesignationName(String designationName) {
		this.designationName = designationName;
	}

}
