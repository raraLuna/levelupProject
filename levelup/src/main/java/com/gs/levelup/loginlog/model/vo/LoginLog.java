package com.gs.levelup.loginlog.model.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class LoginLog  implements java.io.Serializable {
	private static final long serialVersionUID = -3670358373930511132L;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private Timestamp time;
	private String ip;
	private String user;
	private int rcode;
	private String log;
	
	public LoginLog() {}

	public LoginLog(Timestamp time, String ip, String user, int rcode, String log) {
		super();
		this.time = time;
		this.ip = ip;
		this.user = user;
		this.rcode = rcode;
		this.log = log;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public int getRcode() {
		return rcode;
	}

	public void setRcode(int rcode) {
		this.rcode = rcode;
	}

	public String getLog() {
		return log;
	}

	public void setLog(String log) {
		this.log = log;
	}

	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		return "로그인이력 [로그인시간: " + time.format(TimestampTimeFormatter.ofPattern("yyyy/MM/dd/ HH:mm:ss z")) + "|  ip : " + ip + " | user ID: " + user + "| log: " + log + "]";
		return "로그인이력 [로그인시간: " + sdf.format(time) + "|  ip : " + ip + " | user ID: " + user + "| log: " + log + "]";
	}
	
	
}
