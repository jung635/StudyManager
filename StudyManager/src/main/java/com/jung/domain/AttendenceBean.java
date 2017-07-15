package com.jung.domain;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

public class AttendenceBean {
	private int num, group_num, late_interval, late_fee, fee, absent_fee;
	private String id, status;
	private Time attend_time;
	private Date date;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
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
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Time getAttend_time() {
		return attend_time;
	}
	public void setAttend_time(Time attend_time) {
		this.attend_time = attend_time;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getAbsent_fee() {
		return absent_fee;
	}
	public void setAbsent_fee(int absent_fee) {
		this.absent_fee = absent_fee;
	}
}
