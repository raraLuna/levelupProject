package com.gs.levelup.common;

import java.sql.Date;

public class Search {
	private String keyword;
	private int age;		//나이 검색시 필요
	private int startRow;  //페이지에 출력할 시작행
	private int endRow;   //페이지에 출력할 끝행
	private Date begin;
	private Date end;
	private String type; //문의 타입 겸색시 필요

	private String teamId;
	private String departmentId;
	
	private String paymentstatus; //결제 리스트 출력 시 결제 상태 검색 시 필요
	
	private String paymentKey; // 결제 취소시 필요
	private String cancelReason; // 결제 취소시 필요 

	private int keyword2;

	
	
	


	public Search(String keyword, int age, int startRow, int endRow, Date begin, Date end, String type, String teamId,
			String departmentId, String paymentstatus, int keyword2) {
		super();
		this.keyword = keyword;
		this.age = age;
		this.startRow = startRow;
		this.endRow = endRow;
		this.begin = begin;
		this.end = end;
		this.type = type;
		this.teamId = teamId;
		this.departmentId = departmentId;
		this.paymentstatus = paymentstatus;
		this.keyword2 = keyword2;
	}

	
	

	public String getPaymentKey() {
		return paymentKey;
	}




	public void setPaymentKey(String paymentKey) {
		this.paymentKey = paymentKey;
	}




	public String getCancelReason() {
		return cancelReason;
	}




	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
	}




	public int getKeyword2() {
		return keyword2;
	}



	public void setKeyword2(int keyword2) {
		this.keyword2 = keyword2;
	}


  


	public Search() {}
	
	public String getTeamId() {
		return teamId;
	}



	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}



	public String getDepartmentId() {
		return departmentId;
	}



	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}


	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public Date getBegin() {
		return begin;
	}

	public void setBegin(Date begin) {
		this.begin = begin;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}
	
	

	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}
	

	public String getPaymentstatus() {
		return paymentstatus;
	}



	public void setPaymentstatus(String paymentstatus) {
		this.paymentstatus = paymentstatus;
	}



	@Override
	public String toString() {
		return "Search [keyword=" + keyword + ", age=" + age + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", begin=" + begin + ", end=" + end + ", type=" + type + "]";
	}

	
}
