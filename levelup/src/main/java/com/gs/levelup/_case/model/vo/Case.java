package com.gs.levelup._case.model.vo;

import java.sql.Date;

public class Case implements java.io.Serializable{

	private static final long serialVersionUID = -3087526283607140732L;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	//공통
	private String caseId;
	private String caseTitle;
	private String caseContent;
	private String caseWriterId;
	private String caseWriterName;
	private String caseType;
	private String caseManagerId;
	private String caseManagerName;
	private String caseStatus;	
	private Date editDate;
	private Date signDate;
	private String attachmentFileName;
	
	//게임 아이템
	private int charId;
	private String charName;
	private int accountId;
	private int originalItemId;
	private String originalItemName;
	private int originalItemAmount;
	private long uniqueId;
	private int newItemId;
	private String newItemName;
	private int newItemAmount;
	
	//게임 환불
	private Date paymentDate;
	private String paymentStatus;
	private int paymentAmount;
	private Date refundDate;
	private String refundCause;
	private String paymentKey;

	public Case() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Case(String caseId, String caseTitle, String caseContent, String caseWriterId, String caseWriterName,
			String caseType, String caseManagerId, String caseManagerName, String caseStatus, Date editDate,
			Date signDate, String attachmentFileName, int charId, String charName, int accountId, int originalItemId,
			String originalItemName, int originalItemAmount, long uniqueId, int newItemId, String newItemName,
			int newItemAmount, Date paymentDate, String paymentStatus, int paymentAmount, Date refundDate,
			String refundCause, String paymentKey) {
		super();
		this.caseId = caseId;
		this.caseTitle = caseTitle;
		this.caseContent = caseContent;
		this.caseWriterId = caseWriterId;
		this.caseWriterName = caseWriterName;
		this.caseType = caseType;
		this.caseManagerId = caseManagerId;
		this.caseManagerName = caseManagerName;
		this.caseStatus = caseStatus;
		this.editDate = editDate;
		this.signDate = signDate;
		this.attachmentFileName = attachmentFileName;
		this.charId = charId;
		this.charName = charName;
		this.accountId = accountId;
		this.originalItemId = originalItemId;
		this.originalItemName = originalItemName;
		this.originalItemAmount = originalItemAmount;
		this.uniqueId = uniqueId;
		this.newItemId = newItemId;
		this.newItemName = newItemName;
		this.newItemAmount = newItemAmount;
		this.paymentDate = paymentDate;
		this.paymentStatus = paymentStatus;
		this.paymentAmount = paymentAmount;
		this.refundDate = refundDate;
		this.refundCause = refundCause;
		this.paymentKey = paymentKey;
	}

	public String getCaseId() {
		return caseId;
	}

	public void setCaseId(String caseId) {
		this.caseId = caseId;
	}

	public String getCaseTitle() {
		return caseTitle;
	}

	public void setCaseTitle(String caseTitle) {
		this.caseTitle = caseTitle;
	}

	public String getCaseContent() {
		return caseContent;
	}

	public void setCaseContent(String caseContent) {
		this.caseContent = caseContent;
	}

	public String getCaseWriterId() {
		return caseWriterId;
	}

	public void setCaseWriterId(String caseWriterId) {
		this.caseWriterId = caseWriterId;
	}

	public String getCaseWriterName() {
		return caseWriterName;
	}

	public void setCaseWriterName(String caseWriterName) {
		this.caseWriterName = caseWriterName;
	}

	public String getCaseType() {
		return caseType;
	}

	public void setCaseType(String caseType) {
		this.caseType = caseType;
	}

	public String getCaseManagerId() {
		return caseManagerId;
	}

	public void setCaseManagerId(String caseManagerId) {
		this.caseManagerId = caseManagerId;
	}

	public String getCaseManagerName() {
		return caseManagerName;
	}

	public void setCaseManagerName(String caseManagerName) {
		this.caseManagerName = caseManagerName;
	}

	public String getCaseStatus() {
		return caseStatus;
	}

	public void setCaseStatus(String caseStatus) {
		this.caseStatus = caseStatus;
	}

	public Date getEditDate() {
		return editDate;
	}

	public void setEditDate(Date editDate) {
		this.editDate = editDate;
	}

	public Date getSignDate() {
		return signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	public String getAttachmentFileName() {
		return attachmentFileName;
	}

	public void setAttachmentFileName(String attachmentFileName) {
		this.attachmentFileName = attachmentFileName;
	}

	public int getCharId() {
		return charId;
	}

	public void setCharId(int charId) {
		this.charId = charId;
	}

	public String getCharName() {
		return charName;
	}

	public void setCharName(String charName) {
		this.charName = charName;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public int getOriginalItemId() {
		return originalItemId;
	}

	public void setOriginalItemId(int originalItemId) {
		this.originalItemId = originalItemId;
	}

	public String getOriginalItemName() {
		return originalItemName;
	}

	public void setOriginalItemName(String originalItemName) {
		this.originalItemName = originalItemName;
	}

	public int getOriginalItemAmount() {
		return originalItemAmount;
	}

	public void setOriginalItemAmount(int originalItemAmount) {
		this.originalItemAmount = originalItemAmount;
	}

	public long getUniqueId() {
		return uniqueId;
	}

	public void setUniqueId(long uniqueId) {
		this.uniqueId = uniqueId;
	}

	public int getNewItemId() {
		return newItemId;
	}

	public void setNewItemId(int newItemId) {
		this.newItemId = newItemId;
	}

	public String getNewItemName() {
		return newItemName;
	}

	public void setNewItemName(String newItemName) {
		this.newItemName = newItemName;
	}

	public int getNewItemAmount() {
		return newItemAmount;
	}

	public void setNewItemAmount(int newItemAmount) {
		this.newItemAmount = newItemAmount;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public int getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public Date getRefundDate() {
		return refundDate;
	}

	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}

	public String getRefundCause() {
		return refundCause;
	}

	public void setRefundCause(String refundCause) {
		this.refundCause = refundCause;
	}

	public String getPaymentKey() {
		return paymentKey;
	}

	public void setPaymentKey(String paymentKey) {
		this.paymentKey = paymentKey;
	}

	@Override
	public String toString() {
		return "Case [caseId=" + caseId + ", caseTitle=" + caseTitle + ", caseContent=" + caseContent
				+ ", caseWriterId=" + caseWriterId + ", caseWriterName=" + caseWriterName + ", caseType=" + caseType
				+ ", caseManagerId=" + caseManagerId + ", caseManagerName=" + caseManagerName + ", caseStatus="
				+ caseStatus + ", editDate=" + editDate + ", signDate=" + signDate + ", attachmentFileName="
				+ attachmentFileName + ", charId=" + charId + ", charName=" + charName + ", accountId=" + accountId
				+ ", originalItemId=" + originalItemId + ", originalItemName=" + originalItemName
				+ ", originalItemAmount=" + originalItemAmount + ", uniqueId=" + uniqueId + ", newItemId=" + newItemId
				+ ", newItemName=" + newItemName + ", newItemAmount=" + newItemAmount + ", paymentDate=" + paymentDate
				+ ", paymentStatus=" + paymentStatus + ", paymentAmount=" + paymentAmount + ", refundDate=" + refundDate
				+ ", refundCause=" + refundCause + ", paymentKey=" + paymentKey + "]";
	}
	
	
	
		
}
