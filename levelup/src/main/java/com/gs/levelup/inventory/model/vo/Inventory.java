package com.gs.levelup.inventory.model.vo;

public class Inventory  implements java.io.Serializable{
	private static final long serialVersionUID = 4178293791060111904L;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private int id;
	private int charId;
	private int nameId;
	private int itemId;
	private int amount;
	private int equip;
	private int identify;
	private long uniqueId;
	private String itemName;
	private String itemType;
	private int price;
	private int gamePrice; 
	
	
	public Inventory() {}

	public Inventory(int id, int charId, int nameId, int amount, int equip, int identify, long uniqueId) {
		super();
		this.id = id;
		this.charId = charId;
		this.nameId = nameId;
		this.amount = amount;
		this.equip = equip;
		this.identify = identify;
		this.uniqueId = uniqueId;
	}
	
	
	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCharId() {
		return charId;
	}

	public void setCharId(int charId) {
		this.charId = charId;
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
	
	

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getGamePrice() {
		return gamePrice;
	}

	public void setGamePrice(int gamePrice) {
		this.gamePrice = gamePrice;
	}

	@Override
	public String toString() {
		return "인벤토리 [아이디: " + id + ", charId=" + charId + ", nameId=" + nameId + ", amount=" + amount + ", equip="
				+ equip + ", identify=" + identify + ", uniqueId=" + uniqueId + "]";
	}
	
	
}
