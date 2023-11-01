package com.gs.levelup.rodexItems.model.vo;

public class RodexItems  implements java.io.Serializable{
	private static final long serialVersionUID = 5526184724395697932L;
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private int id;
	private int mailId;
	private int nameId;
	private int amount;
	private int equip;
	private int identify;
	private long uniqueId;
	
	public RodexItems() {}

	public RodexItems(int id, int mailId, int nameId, int amount, int equip, int identify, long uniqueId) {
		super();
		this.id = id;
		this.mailId = mailId;
		this.nameId = nameId;
		this.amount = amount;
		this.equip = equip;
		this.identify = identify;
		this.uniqueId = uniqueId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMailId() {
		return mailId;
	}

	public void setMailId(int mailId) {
		this.mailId = mailId;
	}

	public int getNameId() {
		return nameId;
	}

	public void setNameId(int nameId) {
		this.nameId = nameId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getEquip() {
		return equip;
	}

	public void setEquip(int equip) {
		this.equip = equip;
	}

	public int getIdentify() {
		return identify;
	}

	public void setIdentify(int identify) {
		this.identify = identify;
	}

	public long getUniqueId() {
		return uniqueId;
	}

	public void setUniqueId(long uniqueId) {
		this.uniqueId = uniqueId;
	}

	@Override
	public String toString() {
		return "RodexItems [id=" + id + ", mailId=" + mailId + ", nameId=" + nameId + ", amount=" + amount + ", equip="
				+ equip + ", identify=" + identify + ", uniqueId=" + uniqueId + "]";
	}
	
	
}
