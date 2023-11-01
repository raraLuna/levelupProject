package com.gs.levelup.rodexMail.model.vo;

public class RodexMail  implements java.io.Serializable{
	private static final long serialVersionUID = -5132378963670390402L;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private int mailId;
	private String senderName;
	private int senderId;
	private String receiverName;
	private int receiverId;
	private int receiverAccountId;
	private String title;
	private String body;
	private int zeny;
	private int type;
	private int isRead;
	private int sendDate;
	private int expireDate;
	private int weight;
	
	public RodexMail() {}

	public RodexMail(int mailId, String senderName, int senderId, String receiverName, int receiverId,
			int receiverAccountId, String title, String body, int zeny, int type, int isRead, int sendDate,
			int expireDate, int weight) {
		super();
		this.mailId = mailId;
		this.senderName = senderName;
		this.senderId = senderId;
		this.receiverName = receiverName;
		this.receiverId = receiverId;
		this.receiverAccountId = receiverAccountId;
		this.title = title;
		this.body = body;
		this.zeny = zeny;
		this.type = type;
		this.isRead = isRead;
		this.sendDate = sendDate;
		this.expireDate = expireDate;
		this.weight = weight;
	}

	public int getMailId() {
		return mailId;
	}

	public void setMailId(int mailId) {
		this.mailId = mailId;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public int getSenderId() {
		return senderId;
	}

	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public int getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(int receiverId) {
		this.receiverId = receiverId;
	}

	public int getReceiverAccountId() {
		return receiverAccountId;
	}

	public void setReceiverAccountId(int receiverAccountId) {
		this.receiverAccountId = receiverAccountId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public int getZeny() {
		return zeny;
	}

	public void setZeny(int zeny) {
		this.zeny = zeny;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getIsRead() {
		return isRead;
	}

	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}

	public int getSendDate() {
		return sendDate;
	}

	public void setSendDate(int sendDate) {
		this.sendDate = sendDate;
	}

	public int getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(int expireDate) {
		this.expireDate = expireDate;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	@Override
	public String toString() {
		return "RodexMail [mailId=" + mailId + ", senderName=" + senderName + ", senderId=" + senderId
				+ ", receiverName=" + receiverName + ", receiverId=" + receiverId + ", receiverAccountId="
				+ receiverAccountId + ", title=" + title + ", body=" + body + ", zeny=" + zeny + ", type=" + type
				+ ", isRead=" + isRead + ", sendDate=" + sendDate + ", expireDate=" + expireDate + ", weight=" + weight
				+ "]";
	}
	
	
}
