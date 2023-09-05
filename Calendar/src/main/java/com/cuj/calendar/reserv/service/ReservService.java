package com.cuj.calendar.reserv.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cuj.calendar.reserv.dao.IReservDAO;
import com.cuj.calendar.reserv.vo.EnableTime;
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
	
	// 해당 날짜의 예약시간 목록을 불러와서 예약 가능,불가능 목록을 만들어서 리턴 (DB연동x)
	public List<EnableTime> makeEnableTimeList(List<String> timeList, Date date){
		String[] fillTimeArray = {"09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30"};
		List<String> fullTimeList = Arrays.asList(fillTimeArray);
		
		Calendar cal = Calendar.getInstance();
		
		cal.setTime(date);
		
		List<EnableTime> enableTimeList = new ArrayList<>();
		for(String time : fullTimeList) {
			if(timeList.contains(time) && cal.get(Calendar.DAY_OF_WEEK) != 1) {
				enableTimeList.add(new EnableTime(time, true));
			}else {
				enableTimeList.add(new EnableTime(time, false));
			}
		}
		
		return enableTimeList;
	}
	
}
