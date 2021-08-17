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
	@Column(name = "MANAGERNAME")
	private String managerName;

	public int getManagerId() {
		return managerId;
	}

	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	@Override
	public String toString() {
		return "Manager [managerId=" + managerId + ", managerName=" + managerName + "]";
	}

}
