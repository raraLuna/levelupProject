package com.gs.levelup.rank.model.vo;

public class Rank  implements java.io.Serializable{
	private static final long serialVersionUID = 8843722194879663559L;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private String rankId;
	private String rankName;
	
	public Rank() {}

	public Rank(String rankId, String rankName) {
		super();
		this.rankId = rankId;
		this.rankName = rankName;
	}

	public String getRankId() {
		return rankId;
	}

	public void setRankId(String rankId) {
		this.rankId = rankId;
	}

	public String getRankName() {
		return rankName;
	}

	public void setRankName(String rankName) {
		this.rankName = rankName;
	}

	@Override
	public String toString() {
		return "Rank [rankId=" + rankId + ", rankName=" + rankName + "]";
	}
	
	
}
