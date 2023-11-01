package com.gs.levelup.character.model.vo;


public class Character  implements java.io.Serializable{
	private static final long serialVersionUID = 5270522369799007700L;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private int charId;
	private int accountId;
	private int charNum;
	private String name;
	private int class_;
	private int baseLevel;
	private int jobLevel;
	private int baseExp;
	private int jobExp;
	private int zeny;
	private int str;
	private int agi;
	private int vit;
	private int int_;
	private int dex;
	private int luk;
	private int maxHp;
	private int hp;
	private int maxSp;
	private int sp;
	private int statusPoint;
	private int skillPoint;
	private int lastLogin;
	private String lastMap;
	private int online;
	
	
	
	public Character() {}

	public Character(int charId, int accountId, int charNum, String name, int class_, int baseLevel, int jobLevel,
			int baseExp, int jobExp, int zeny, int str, int agi, int vit, int int_, int dex, int luk, int maxHp, int hp,
			int maxSp, int sp, int statusPoint, int skillPoint, int lastLogin, String lastMap, int online) {
		super();
		this.charId = charId;
		this.accountId = accountId;
		this.charNum = charNum;
		this.name = name;
		this.class_ = class_;
		this.baseLevel = baseLevel;
		this.jobLevel = jobLevel;
		this.baseExp = baseExp;
		this.jobExp = jobExp;
		this.zeny = zeny;
		this.str = str;
		this.agi = agi;
		this.vit = vit;
		this.int_ = int_;
		this.dex = dex;
		this.luk = luk;
		this.maxHp = maxHp;
		this.hp = hp;
		this.maxSp = maxSp;
		this.sp = sp;
		this.statusPoint = statusPoint;
		this.skillPoint = skillPoint;
		this.lastLogin = lastLogin;
		this.lastMap = lastMap;
		this.online = online;
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

	public int getCharNum() {
		return charNum;
	}

	public void setCharNum(int charNum) {
		this.charNum = charNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getClass_() {
		return class_;
	}

	public void setClass_(int class_) {
		this.class_ = class_;
	}

	public int getBaseLevel() {
		return baseLevel;
	}

	public void setBaseLevel(int baseLevel) {
		this.baseLevel = baseLevel;
	}

	public int getJobLevel() {
		return jobLevel;
	}

	public void setJobLevel(int jobLevel) {
		this.jobLevel = jobLevel;
	}

	public int getBaseExp() {
		return baseExp;
	}

	public void setBaseExp(int baseExp) {
		this.baseExp = baseExp;
	}

	public int getJobExp() {
		return jobExp;
	}

	public void setJobExp(int jobExp) {
		this.jobExp = jobExp;
	}

	public int getZeny() {
		return zeny;
	}

	public void setZeny(int zeny) {
		this.zeny = zeny;
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

	public int getMaxHp() {
		return maxHp;
	}

	public void setMaxHp(int maxHp) {
		this.maxHp = maxHp;
	}

	public int getHp() {
		return hp;
	}

	public void setHp(int hp) {
		this.hp = hp;
	}

	public int getMaxSp() {
		return maxSp;
	}

	public void setMaxSp(int maxSp) {
		this.maxSp = maxSp;
	}

	public int getSp() {
		return sp;
	}

	public void setSp(int sp) {
		this.sp = sp;
	}

	public int getStatusPoint() {
		return statusPoint;
	}

	public void setStatusPoint(int statusPoint) {
		this.statusPoint = statusPoint;
	}

	public int getSkillPoint() {
		return skillPoint;
	}

	public void setSkillPoint(int skillPoint) {
		this.skillPoint = skillPoint;
	}

	public int getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(int lastLogin) {
		this.lastLogin = lastLogin;
	}

	public String getLastMap() {
		return lastMap;
	}

	public void setLastMap(String lastMap) {
		this.lastMap = lastMap;
	}

	public int getOnline() {
		return online;
	}

	public void setOnline(int online) {
		this.online = online;
	}

	@Override
	public String toString() {
		return "Character [charId=" + charId + ", accountId=" + accountId + ", charNum=" + charNum + ", name=" + name
				+ ", class_=" + class_ + ", baseLevel=" + baseLevel + ", jobLevel=" + jobLevel + ", baseExp=" + baseExp
				+ ", jobExp=" + jobExp + ", zeny=" + zeny + ", str=" + str + ", agi=" + agi + ", vit=" + vit + ", int_="
				+ int_ + ", dex=" + dex + ", luk=" + luk + ", maxHp=" + maxHp + ", hp=" + hp + ", maxSp=" + maxSp
				+ ", sp=" + sp + ", statusPoint=" + statusPoint + ", skillPoint=" + skillPoint + ", lastLogin="
				+ lastLogin + ", lastMap=" + lastMap + ", online=" + online + "]";
	}
	
}
