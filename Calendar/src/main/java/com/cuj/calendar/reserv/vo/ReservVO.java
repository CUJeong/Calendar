package com.cuj.calendar.reserv.vo;

public class ReservVO {
	private String reserv_date;    	/* 예약날짜(yyyy-MM-dd) */
	private String reserv_time;		/* 예약시간(HH:mm) */
	private String reserv_name;		/* 예약자 성함 */
	private String reserv_phone;	/* 예약자 연락처(01012345678) */
	private String reserv_pw;		/* 예약자 암호 */
	private String del_yn;			/* 유효 여부 (Y or N) */
	
	public ReservVO() {
	}
	public ReservVO(String reserv_date, String reserv_time, String reserv_name, String reserv_phone, String reserv_pw,
			String del_yn) {
		this.reserv_date = reserv_date;
		this.reserv_time = reserv_time;
		this.reserv_name = reserv_name;
		this.reserv_phone = reserv_phone;
		this.reserv_pw = reserv_pw;
		this.del_yn = del_yn;
	}
	
	@Override
	public String toString() {
		return "ReservVO [reserv_date=" + reserv_date + ", reserv_time=" + reserv_time + ", reserv_name=" + reserv_name
				+ ", reserv_phone=" + reserv_phone + ", reserv_pw=" + reserv_pw + ", del_yn=" + del_yn + "]";
	}
	
	public String getReserv_date() {
		return reserv_date;
	}
	public void setReserv_date(String reserv_date) {
		this.reserv_date = reserv_date;
	}
	public String getReserv_time() {
		return reserv_time;
	}
	public void setReserv_time(String reserv_time) {
		this.reserv_time = reserv_time;
	}
	public String getReserv_name() {
		return reserv_name;
	}
	public void setReserv_name(String reserv_name) {
		this.reserv_name = reserv_name;
	}
	public String getReserv_phone() {
		return reserv_phone;
	}
	public void setReserv_phone(String reserv_phone) {
		this.reserv_phone = reserv_phone;
	}
	public String getReserv_pw() {
		return reserv_pw;
	}
	public void setReserv_pw(String reserv_pw) {
		this.reserv_pw = reserv_pw;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	
}
