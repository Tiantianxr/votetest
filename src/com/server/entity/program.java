package com.server.entity;

public class program {
	private int id;
	private String name;
	private String preformer;
	private String dep;
	private String type;
	private int score;
	//自己编写Get和Set方法
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPreformer() {
		return preformer;
	}
	public void setPreformer(String preformer) {
		this.preformer = preformer;
	}
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}

	
}
