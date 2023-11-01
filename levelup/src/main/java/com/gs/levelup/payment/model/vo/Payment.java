package com.gs.levelup.payment.model.vo;

import java.sql.Date;

public class Payment implements java.io.Serializable {
	private static final long serialVersionUID = -6902969006704456021L;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private String paymentId;
	private int itemId;
	private int charId;
	private int accountId;
	private int amount;
	private Date paymentDate;
	private String paymentStatus;
	private Date refundDate;
	private String refundCause;
	private String charName;
	private String paymentKey;
	private long uniqueId;
	private String emailStatus;
	private String orderId;
	public long getUniqueId() {

		return uniqueId;
	}

	public void setUniqueId(long uniqueId) {
		this.uniqueId = uniqueId;
	}

	public String getEmailStatus() {
		return emailStatus;
	}

	public void setEmailStatus(String emailStatus) {
		this.emailStatus = emailStatus;
	}

	public String getCharName() {
		return charName;
	}

	public void setCharName(String charName) {
		this.charName = charName;
	}	

	public String getPaymentKey() {
		return paymentKey;
	}

	public void setPaymentKey(String paymentKey) {
		this.paymentKey = paymentKey;
	}

	public Payment() {}
	
	public Payment(int amount, String paymentKey, int charId, String charName, int itemId, int accountId, long uniqueId) {
		this.amount = amount;
		this.paymentKey = paymentKey;
		this.charId = charId;
		this.charName = charName;
		this.itemId = itemId;
		this.accountId = accountId;
		this.uniqueId = uniqueId;
	}
	
	public Payment(int amount, String orderId, String paymentKey, int charId, String charName, int itemId, int accountId, long uniqueId) {
		this.amount = amount;
		this.orderId = orderId;
		this.paymentKey = paymentKey;
		this.charId = charId;
		this.charName = charName;
		this.itemId = itemId;
		this.accountId = accountId;
		this.uniqueId = uniqueId;
	}

	public Payment(String paymentId, int itemId, int charId, int accountId, int amout, Date paymentDate,
			String paymentStatus, Date refundDate, String refundCause) {
		super();
		this.paymentId = paymentId;
		this.itemId = itemId;
		this.charId = charId;
		this.accountId = accountId;
		this.amount = amout;
		this.paymentDate = paymentDate;
		this.paymentStatus = paymentStatus;
		this.refundDate = refundDate;
		this.refundCause = refundCause;
	}

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public int getCharId() {
		return charId;
	}

	public void setCharId(int charId) {
		this.charId = charId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amout) {
		this.amount = amout;
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
	
	

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@Override
	public String toString() {
		return "Payment [paymentId=" + paymentId + ", itemId=" + itemId + ", charId=" + charId + ", accountId="
				+ accountId + ", amount=" + amount + ", paymentDate=" + paymentDate + ", paymentStatus=" + paymentStatus
				+ ", refundDate=" + refundDate + ", refundCause=" + refundCause + ", charName=" + charName
				+ ", paymentKey=" + paymentKey + ", uniqueId=" + uniqueId + ", emailStatus=" + emailStatus
				+ ", orderId=" + orderId + "]";
	}
	
	
}
