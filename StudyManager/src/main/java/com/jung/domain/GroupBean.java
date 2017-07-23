package com.jung.domain;

import java.util.Date;

import org.springframework.stereotype.Service;

public class GroupBean {
	private String name, board, late_max, late_start, admin, member, week, city, goal, category, hashTag, start_time, rule;
	private int num, late_interval, late_fee, late_maxFee, fee, absent_fee;
	private Date date;
	private boolean secret;
	
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
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public int getAbsent_fee() {
		return absent_fee;
	}
	public void setAbsent_fee(int absent_fee) {
		this.absent_fee = absent_fee;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getHashTag() {
		return hashTag;
	}
	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}
	public boolean isSecret() {
		return secret;
	}
	public void setSecret(boolean secret) {
		this.secret = secret;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getRule() {
		return rule;
	}
	public void setRule(String rule) {
		this.rule = rule;
	}

}
