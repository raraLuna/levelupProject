package com.gs.levelup.charlog.model.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;

public class CharLog implements java.io.Serializable {
	private static final long serialVersionUID = 5058626317001492589L;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private Timestamp time;
	private String charMsg;
	private int accountId;
	private int charId;
	private int charNum;
	private int class_;
	private String name;
	private int str;
	private int agi;
	private int vit;
	private int int_;
	private int dex;
	private int luk;
	private int hair;
	private int hairColor;
	
	public CharLog() {}

	public CharLog(Timestamp time, String charMsg, int accountId, int charId, int charNum, int class_, String name, int str,
			int agi, int vit, int int_, int dex, int luk, int hair, int hairColor) {
		super();
		this.time = time;
		this.charMsg = charMsg;
		this.accountId = accountId;
		this.charId = charId;
		this.charNum = charNum;
		this.class_ = class_;
		this.name = name;
		this.str = str;
		this.agi = agi;
		this.vit = vit;
		this.int_ = int_;
		this.dex = dex;
		this.luk = luk;
		this.hair = hair;
		this.hairColor = hairColor;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getCharMsg() {
		return charMsg;
	}

	public void setCharMsg(String charMsg) {
		this.charMsg = charMsg;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public int getCharId() {
		return charId;
	}

	public void setCharId(int charId) {
		this.charId = charId;
	}

	public int getCharNum() {
		return charNum;
	}

	public void setCharNum(int charNum) {
		this.charNum = charNum;
	}

	public int getClass_() {
		return class_;
	}

	public void setClass_(int class_) {
		this.class_ = class_;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStr() {
		return str;
	}

	public void setStr(int str) {
		this.str = str;
	}

	public int getAgi() {
		return agi;
	}

	public void setAgi(int agi) {
		this.agi = agi;
	}

	public int getVit() {
		return vit;
	}

	public void setVit(int vit) {
		this.vit = vit;
	}

	public int getInt_() {
		return int_;
	}

	public void setInt_(int int_) {
		this.int_ = int_;
	}

	public int getDex() {
		return dex;
	}

	public void setDex(int dex) {
		this.dex = dex;
	}

	public int getLuk() {
		return luk;
	}

	public void setLuk(int luk) {
		this.luk = luk;
	}

	public int getHair() {
		return hair;
	}

	public void setHair(int hair) {
		this.hair = hair;
	}

	public int getHairColor() {
		return hairColor;
	}

	public void setHairColor(int hairColor) {
		this.hairColor = hairColor;
	}

	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		return "CharLog [time=" + sdf.format(time) + ", charMsg=" + charMsg + ", accountId=" + accountId + ", charId=" + charId
				+ ", charNum=" + charNum + ", class_=" + class_ + ", name=" + name + ", str=" + str + ", agi=" + agi
				+ ", vit=" + vit + ", int_=" + int_ + ", dex=" + dex + ", luk=" + luk + ", hair=" + hair
				+ ", hairColor=" + hairColor + "]";
	}
	
	
}
