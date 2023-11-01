package com.gs.levelup.picklog.model.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;


public class PickLog  implements java.io.Serializable{
	private static final long serialVersionUID = -7095994249942862889L;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private int id;
	private Timestamp time;
	private int charId;
	private String type;
	private int nameId;
	private int amount;
	private long uniqueId;
	private String map;
	
	public PickLog() {}

	public PickLog(int id, Timestamp time, int charId, String type, int nameId, int amount, long uniqueId, String map) {
		super();
		this.id = id;
		this.time = time;
		this.charId = charId;
		this.type = type;
		this.nameId = nameId;
		this.amount = amount;
		this.uniqueId = uniqueId;
		this.map = map;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public int getCharId() {
		return charId;
	}

	public void setCharId(int charId) {
		this.charId = charId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getNameId() {
		return nameId;
	}

	public void setNameId(int nameId) {
		this.nameId = nameId;
	}

	public int getamount() {
		return amount;
	}

	public void setamount(int amount) {
		this.amount = amount;
	}

	public long getUniqueId() {
		return uniqueId;
	}

	public void setUniqueId(long uniqueId) {
		this.uniqueId = uniqueId;
	}

	public String getMap() {
		return map;
	}

	public void setMap(String map) {
		this.map = map;
	}

	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		return "PickLog [id=" + id + ", time=" + sdf.format(time) + ", charId=" + charId + ", type=" + type + ", nameId=" + nameId
				+ ", amount=" + amount + ", uniqueId=" + uniqueId + ", map=" + map + "]";
	}
	
	
}
