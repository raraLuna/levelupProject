package com.gs.levelup.python;

import java.io.Serializable;

public class Python implements Serializable{
	private String name;
	private int description;
	private int meta;
	
	public Python() {}

	public Python(String name, int description, int meta) {
		super();
		this.name = name;
		this.description = description;
		this.meta = meta;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDescription() {
		return description;
	}

	public void setDescription(int description) {
		this.description = description;
	}

	public int getMeta() {
		return meta;
	}

	public void setMeta(int meta) {
		this.meta = meta;
	}

	@Override
	public String toString() {
		return "Python [name=" + name + ", description=" + description + ", meta=" + meta + "]";
	}
	
	
}
