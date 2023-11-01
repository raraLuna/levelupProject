package com.gs.levelup.inquiry.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Inquiry implements Serializable{
	private static final long serialVersionUID = -756746066186729603L;
	
	private String inquiryId;
	private String userId;
	private String employeeId;
	private String inquiryTitle;
	private String inquiryContent;
	private String answerStatus;
	private Date editDate;
	private Date answerDate;
	private String answerContent;
	private String attachmentFileName;
	private String inquiryType;
	private String employeeName;

	
	public Inquiry() {
		super();
	
	}

	public Inquiry(String inquiryId, String userId, String employeeId, String inquiryTitle, String inquiryContent,
			String answerStatus, Date editDate, Date answerDate, String answerContent, String attachmentFileName,
			String inquiryType, String employeeName) {
		super();
		this.inquiryId = inquiryId;
		this.userId = userId;
		this.employeeId = employeeId;
		this.inquiryTitle = inquiryTitle;
		this.inquiryContent = inquiryContent;
		this.answerStatus = answerStatus;
		this.editDate = editDate;
		this.answerDate = answerDate;
		this.answerContent = answerContent;
		this.attachmentFileName = attachmentFileName;
		this.inquiryType = inquiryType;
		this.employeeName = employeeName;
	}

	public Inquiry(String inquiryId, String userId, String employeeId, String inquiryTitle, String inquiryContent,
			String answerStatus, Date editDate, Date answerDate, String answerContent, String attachmentFileName,
			String inquiryType, String inquiryRef, String answerRef, String employeeName) {
		super();
		this.inquiryId = inquiryId;
		this.userId = userId;
		this.employeeId = employeeId;
		this.inquiryTitle = inquiryTitle;
		this.inquiryContent = inquiryContent;
		this.answerStatus = answerStatus;
		this.editDate = editDate;
		this.answerDate = answerDate;
		this.answerContent = answerContent;
		this.attachmentFileName = attachmentFileName;
		this.inquiryType = inquiryType;
		this.employeeName = employeeName;
	}


	public String getInquiryId() {
		return inquiryId;
	}

	public void setInquiryId(String inquiryId) {
		this.inquiryId = inquiryId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public String getAnswerStatus() {
		return answerStatus;
	}

	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}

	public Date getEditDate() {
		return editDate;
	}

	public void setEditDate(Date editDate) {
		this.editDate = editDate;
	}

	public Date getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getAttachmentFileName() {
		return attachmentFileName;
	}

	public void setAttachmentFileName(String attachmentFileName) {
		this.attachmentFileName = attachmentFileName;
	}

	public String getInquiryType() {
		return inquiryType;
	}

	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Inquiry [inquiryId=" + inquiryId + ", userId=" + userId + ", employeeId=" + employeeId
				+ ", inquiryTitle=" + inquiryTitle + ", inquiryContent=" + inquiryContent + ", answerStatus="
				+ answerStatus + ", editDate=" + editDate + ", answerDate=" + answerDate + ", answerContent="
				+ answerContent + ", attachmentFileName=" + attachmentFileName + ", inquiryType=" + inquiryType
				+ ", employeeName=" + employeeName + "]";
	}
}
