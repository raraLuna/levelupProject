package com.gs.levelup.item.model.vo;

public class Item  implements java.io.Serializable{
	private static final long serialVersionUID = 1647014372057010765L;
	private int itemId;
	private String itemType;
	private String itemData;
	private String itemName;
	private int price;
	private int gamePrice;
	private int discountRate;
	
	public Item(int itemId, String itemType, String itemData, String itemName, int price, int gamePrice,
			int discountRate) {
		super();
		this.itemId = itemId;
		this.itemType = itemType;
		this.itemData = itemData;
		this.itemName = itemName;
		this.price = price;
		this.gamePrice = gamePrice;
		this.discountRate = discountRate;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
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

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Item() {}

	public Item(int itemId, String itemType, String itemData) {
		super();
		this.itemId = itemId;
		this.itemType = itemType;
		this.itemData = itemData;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public String getItemData() {
		return itemData;
	}

	public void setItemData(String itemData) {
		this.itemData = itemData;
	}

	@Override
	public String toString() {
		return "Item [itemId=" + itemId + ", itemType=" + itemType + ", itemData=" + itemData + ", itemName=" + itemName
				+ ", price=" + price + ", gamePrice=" + gamePrice + ", discountRate=" + discountRate + "]";
	}
}
