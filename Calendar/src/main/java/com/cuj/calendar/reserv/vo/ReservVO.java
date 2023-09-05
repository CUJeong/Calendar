package com.cuj.calendar.reserv.vo;

public class ReservVO {
	private String reservDate;    	/* 예약날짜(yyyy-MM-dd) */
	private String reservTime;		/* 예약시간(HH:mm) */
	private String reservName;		/* 예약자 성함 */
	private String reservPhone;	/* 예약자 연락처(01012345678) */
	private String reservPw;		/* 예약자 암호 */
	private String delYn;			/* 유효 여부 (Y or N) */
	
	public ReservVO() {
	}

	public ReservVO(String reservDate, String reservTime, String reservName, String reservPhone, String reservPw,
			String delYn) {
		this.reservDate = reservDate;
		this.reservTime = reservTime;
		this.reservName = reservName;
		this.reservPhone = reservPhone;
		this.reservPw = reservPw;
		this.delYn = delYn;
	}

	@Override
	public String toString() {
		return "ReservVO [reservDate=" + reservDate + ", reservTime=" + reservTime + ", reservName=" + reservName
				+ ", reservPhone=" + reservPhone + ", reservPw=" + reservPw + ", delYn=" + delYn + "]";
	}

	public String getReservDate() {
		return reservDate;
	}

	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}

	public String getReservTime() {
		return reservTime;
	}

	public void setReservTime(String reservTime) {
		this.reservTime = reservTime;
	}

	public String getReservName() {
		return reservName;
	}

	public void setReservName(String reservName) {
		this.reservName = reservName;
	}

	public String getReservPhone() {
		return reservPhone;
	}

	public void setReservPhone(String reservPhone) {
		this.reservPhone = reservPhone;
	}

	public String getReservPw() {
		return reservPw;
	}

	public void setReservPw(String reservPw) {
		this.reservPw = reservPw;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
}
