package com.jung.domain;

import org.springframework.stereotype.Service;

public class GroupBean {
	private String name, board, late_max, late_start;
	private int num, late_interval, late_fee, late_maxFee, fee;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getLate_interval() {
		return late_interval;
	}
	public void setLate_interval(int late_interval) {
		this.late_interval = late_interval;
	}
	public int getLate_fee() {
		return late_fee;
	}
	public void setLate_fee(int late_fee) {
		this.late_fee = late_fee;
	}
	public int getLate_maxFee() {
		return late_maxFee;
	}
	public void setLate_maxFee(int late_maxFee) {
		this.late_maxFee = late_maxFee;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public String getBoard() {
		return board;
	}
	public void setBoard(String board) {
		this.board = board;
	}
	public String getLate_max() {
		return late_max;
	}
	public void setLate_max(String late_max) {
		this.late_max = late_max;
	}
	public String getLate_start() {
		return late_start;
	}
	public void setLate_start(String late_start) {
		this.late_start = late_start;
	}

}
