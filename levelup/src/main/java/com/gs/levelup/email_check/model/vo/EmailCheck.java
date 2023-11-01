package com.gs.levelup.email_check.model.vo;

public class EmailCheck  implements java.io.Serializable{
	private static final long serialVersionUID = -1046712554212723854L;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private String checkId;
	private String toEmail;
	private int code;
	private String checkDate;

	public String getCheckId() {
		return checkId;
	}
	
	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}
	
	public String getToEmail() {
		return toEmail;
	}
	
	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}
	
	public int getCode() {
		return code;
	}
	
	public void setCode(int code) {
		this.code = code;
	}
	
	public String getCheckDate() {
		return checkDate;
	}
	
	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	
	@Override
	public String toString() {
		return "EmailCheck [checkId=" + checkId + ", toEmail=" + toEmail + ", code=" + code + ", checkDate=" + checkDate
				+ "]";
	}
	
	public EmailCheck(String checkId, String toEmail, int code, String checkDate) {
		super();
		this.checkId = checkId;
		this.toEmail = toEmail;
		this.code = code;
		this.checkDate = checkDate;
	}
	
	public EmailCheck(String toEmail, int code) {
		super();
		this.toEmail = toEmail;
		this.code = code;
	}
	
	public EmailCheck() {
		super();
	}
	
	
	
}
