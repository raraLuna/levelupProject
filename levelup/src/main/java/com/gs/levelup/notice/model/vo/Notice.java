package com.gs.levelup.notice.model.vo;

import java.sql.Timestamp;

public class Notice {
	private String noticeId;
	private String employeeId;
	private String departmentId;
	private String teamId;
	private String noticeTitle;
	private String noticeContent;
	private Timestamp editDate;
	private String attachementFilename;
	private String renameFilename;
	private int readCount;
	private String employeeName;
	private String rankId;
	private String rankName;
	private String departmentName;
	private String teamName;
	private String employeeEmail;
	
	
	
	
	public String getRankId() {
		return rankId;
	}

	public void setRankId(String rankId) {
		this.rankId = rankId;
	}

	public String getRankName() {
		return rankName;
	}

	public void setRankName(String rankName) {
		this.rankName = rankName;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getEmployeeEmail() {
		return employeeEmail;
	}

	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public Notice() {}

	public Notice(String noticeId, String employeeId, String departmentId, String teamId, String noticeTitle,
			String noticeContent, Timestamp editDate, String attachementFilename, int readCount) {
		super();
		this.noticeId = noticeId;
		this.employeeId = employeeId;
		this.departmentId = departmentId;
		this.teamId = teamId;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.editDate = editDate;
		this.attachementFilename = attachementFilename;
		this.readCount = readCount;
	}

	public String getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	public String getRenameFilename() {
		return renameFilename;
	}

	public void setRenameFilename(String renameFilename) {
		this.renameFilename = renameFilename;
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

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Timestamp getEditDate() {
		return editDate;
	}

	public void setEditDate(Timestamp editDate) {
		this.editDate = editDate;
	}

	public String getAttachementFilename() {
		return attachementFilename;
	}

	public void setAttachementFilename(String attachementFilename) {
		this.attachementFilename = attachementFilename;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", employeeId=" + employeeId + ", departmentId=" + departmentId
				+ ", teamId=" + teamId + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", editDate=" + editDate + ", attachementFilename=" + attachementFilename + ", renameFilename="
				+ renameFilename + ", readCount=" + readCount + "]";
	}

	
	
	
}


