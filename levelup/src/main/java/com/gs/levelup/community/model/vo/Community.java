package com.gs.levelup.community.model.vo;

import java.sql.Timestamp;

public class Community implements java.io.Serializable{
	private static final long serialVersionUID = 5632326431275916747L;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private String board_id;
	private String department_id;
	private String department_name;
	private String employee_id;
	private String employee_name;
	private String employee_email;
	private String rank_id;
	private String rank_name;
	private String board_title;
	private Timestamp board_date;
	private String attachement_filename;
	private String board_type;
	private int read_count;
	private String ref_id;
	private String board_body;
	private String team_id;
	private String team_name;
	private String refYN;
	private String delYN;
	
	public Community() {}

	public Community(String board_id, String department_id, String department_name, String employee_id,
			String employee_name, String employee_email, String rank_id, String rank_name, String board_title,
			Timestamp board_date, String attachement_filename, String board_type, int read_count, String ref_id,
			String board_body, String team_id, String team_name, String refYN, String delYN) {
		super();
		this.board_id = board_id;
		this.department_id = department_id;
		this.department_name = department_name;
		this.employee_id = employee_id;
		this.employee_name = employee_name;
		this.employee_email = employee_email;
		this.rank_id = rank_id;
		this.rank_name = rank_name;
		this.board_title = board_title;
		this.board_date = board_date;
		this.attachement_filename = attachement_filename;
		this.board_type = board_type;
		this.read_count = read_count;
		this.ref_id = ref_id;
		this.board_body = board_body;
		this.team_id = team_id;
		this.team_name = team_name;
		this.refYN = refYN;
		this.delYN = delYN;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(String department_id) {
		this.department_id = department_id;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

	public String getEmployee_email() {
		return employee_email;
	}

	public void setEmployee_email(String employee_email) {
		this.employee_email = employee_email;
	}

	public String getRank_id() {
		return rank_id;
	}

	public void setRank_id(String rank_id) {
		this.rank_id = rank_id;
	}

	public String getRank_name() {
		return rank_name;
	}

	public void setRank_name(String rank_name) {
		this.rank_name = rank_name;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public Timestamp getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}

	public String getAttachement_filename() {
		return attachement_filename;
	}

	public void setAttachement_filename(String attachement_filename) {
		this.attachement_filename = attachement_filename;
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public String getRef_id() {
		return ref_id;
	}

	public void setRef_id(String ref_id) {
		this.ref_id = ref_id;
	}

	public String getBoard_body() {
		return board_body;
	}

	public void setBoard_body(String board_body) {
		this.board_body = board_body;
	}

	public String getTeam_id() {
		return team_id;
	}

	public void setTeam_id(String team_id) {
		this.team_id = team_id;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getRefYN() {
		return refYN;
	}

	public void setRefYN(String refYN) {
		this.refYN = refYN;
	}

	public String getDelYN() {
		return delYN;
	}

	public void setDelYN(String delYN) {
		this.delYN = delYN;
	}

	@Override
	public String toString() {
		return "Community [board_id=" + board_id + ", department_id=" + department_id + ", department_name="
				+ department_name + ", employee_id=" + employee_id + ", employee_name=" + employee_name
				+ ", employee_email=" + employee_email + ", rank_id=" + rank_id + ", rank_name=" + rank_name
				+ ", board_title=" + board_title + ", board_date=" + board_date + ", attachement_filename="
				+ attachement_filename + ", board_type=" + board_type + ", read_count=" + read_count + ", ref_id="
				+ ref_id + ", board_body=" + board_body + ", team_id=" + team_id + ", team_name=" + team_name
				+ ", refYN=" + refYN + ", delYN=" + delYN + "]";
	}

	
}