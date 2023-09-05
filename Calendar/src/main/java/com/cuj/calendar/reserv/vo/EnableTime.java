package com.cuj.calendar.reserv.vo;

public class EnableTime {
	private String time;		/* 예약시간 (10:00) */
	private boolean isEnable;	/* 예약가능 여부 (true: 예약가능) */
	
	public EnableTime() {
	}
	public EnableTime(String time, boolean isEnable) {
		this.time = time;
		this.isEnable = isEnable;
	}
	@Override
	public String toString() {
		return "EnableTime [time=" + time + ", isEnable=" + isEnable + "]";
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public boolean isEnable() {
		return isEnable;
	}
	public void setEnable(boolean isEnable) {
		this.isEnable = isEnable;
	}
}
