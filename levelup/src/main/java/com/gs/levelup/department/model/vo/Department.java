package com.gs.levelup.department.model.vo;

public class Department  implements java.io.Serializable{
	private static final long serialVersionUID = -2650184692818330398L;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private String departmentId;
	private String departmentName;
	
	public Department() {}

	public Department(String departmentId, String departmentName) {
		super();
		this.departmentId = departmentId;
		this.departmentName = departmentName;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	@Override
	public String toString() {
		return "Department [departmentId=" + departmentId + ", departmentName=" + departmentName + "]";
	}
	
	
}
