package com.gs.levelup.team.model.vo;

public class Team  implements java.io.Serializable{
	private static final long serialVersionUID = 2853786217820017500L;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private String teamId;
	private String teamName;
	
	public Team() {}

	public Team(String teamId, String teamName) {
		super();
		this.teamId = teamId;
		this.teamName = teamName;
	}

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	@Override
	public String toString() {
		return "Team [teamId=" + teamId + ", teamName=" + teamName + "]";
	}
	
	
}
