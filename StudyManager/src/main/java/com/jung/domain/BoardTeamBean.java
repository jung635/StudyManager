package com.jung.domain;

public class BoardTeamBean {
	
	private int board_num, group_num;
	private String name, write_auth, comment_auth;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWrite_auth() {
		return write_auth;
	}
	public void setWrite_auth(String write_auth) {
		this.write_auth = write_auth;
	}
	public String getComment_auth() {
		return comment_auth;
	}
	public void setComment_auth(String comment_auth) {
		this.comment_auth = comment_auth;
	}

}
