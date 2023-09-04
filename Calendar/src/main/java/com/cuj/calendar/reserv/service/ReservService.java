package com.cuj.calendar.reserv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cuj.calendar.reserv.dao.IReservDAO;
import com.cuj.calendar.reserv.vo.ReservVO;

@Service
public class ReservService {

	@Autowired
	IReservDAO dao;
	
	// 예약 목록 불러오기
	public List<ReservVO> getReservList(){
		List<ReservVO> result = dao.getReservList();
		
		return result;
	};
	
	// 상담 예약 등록
	public void insertReserv(ReservVO reserv) throws Exception {
		int result = dao.insertReserv(reserv); 
		
		if(result == 0) {
			throw new Exception("예약 등록에 실패하였습니다.");
		}
	};
	
	// 해당 날짜의 예약 가능 시간 목록 불러오기
	public List<String> getEnableTimeList(String reservDate){
		List<String> result = dao.getEnableTimeList(reservDate);
		
		return result;
	};
	
}
