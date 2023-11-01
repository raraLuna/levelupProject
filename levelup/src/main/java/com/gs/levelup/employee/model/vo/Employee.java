package com.gs.levelup.employee.model.vo;

import java.sql.Date;

public class Employee implements java.io.Serializable  {
	private static final long serialVersionUID = 8455557861948383032L;
	
	private String employeeId;
	private String departmentId;
	private String teamId;
	private String rankId;
	private String employeeName;
	private String employeeEmail;
	private String employeePwd;
	private String employeeAddress;
	private String employeePhone;
	private Date employeeBirthdate;
	private String managerId;
	
	public Employee() {}

	public Employee(String employeeId, String departmentId, String teamId, String rankId, String employeeName,
			String employeeEmail, String employeePwd, String employeeAddress, String employeePhone,
			Date employeeBirthdate, String managerId) {
		super();
		this.employeeId = employeeId;
		this.departmentId = departmentId;
		this.teamId = teamId;
		this.rankId = rankId;
		this.employeeName = employeeName;
		this.employeeEmail = employeeEmail;
		this.employeePwd = employeePwd;
		this.employeeAddress = employeeAddress;
		this.employeePhone = employeePhone;
		this.employeeBirthdate = employeeBirthdate;
		this.managerId = managerId;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getRankId() {
		return rankId;
	}

	public void setRankId(String rankId) {
		this.rankId = rankId;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getEmployeeEmail() {
		return employeeEmail;
	}

	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}

	public String getEmployeePwd() {
		return employeePwd;
	}

	public void setEmployeePwd(String employeePwd) {
		this.employeePwd = employeePwd;
	}

	public String getEmployeeAddress() {
		return employeeAddress;
	}

	public void setEmployeeAddress(String employeeAddress) {
		this.employeeAddress = employeeAddress;
	}

	public String getEmployeePhone() {
		return employeePhone;
	}

	public void setEmployeePhone(String employeePhone) {
		this.employeePhone = employeePhone;
	}

	public Date getEmployeeBirthdate() {
		return employeeBirthdate;
	}

	public void setEmployeeBirthdate(Date employeeBirthdate) {
		this.employeeBirthdate = employeeBirthdate;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Employee [employeeId=" + employeeId + ", departmentId=" + departmentId + ", teamId=" + teamId
				+ ", rankId=" + rankId + ", employeeName=" + employeeName + ", employeeEmail=" + employeeEmail
				+ ", employeePwd=" + employeePwd + ", employeeAddress=" + employeeAddress + ", employeePhone="
				+ employeePhone + ", employeeBirthdate=" + employeeBirthdate + ", managerId=" + managerId + "]";
	}

	
	
}
