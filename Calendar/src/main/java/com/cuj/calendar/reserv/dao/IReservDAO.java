package com.cuj.calendar.reserv.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cuj.calendar.reserv.vo.ReservVO;

@Mapper
public interface IReservDAO {
	
	// 예약 목록 불러오기
	public List<ReservVO> getReservList(String choiceDate);
	
	// 예약 정보 불러오기
	public ReservVO getReserv(ReservVO reserv);
	
	// 상담 예약 등록
	public int insertReserv(ReservVO reserv);
	
	// 해당 날짜의 예약 가능 시간 목록 불러오기
	public List<String> getEnableTimeList(String reservDate);
	
	// 예약한 상담자인지 확인
	public int reservDupleCheck(ReservVO reserv);
	
	// 예약 취소
	public int cancelReserv(ReservVO reserv);
	
	// 날짜 지난 내역들은 del_yn = Y 처리
	public int delPastReserv();
	
}
