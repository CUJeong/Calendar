package com.cuj.calendar.reserv.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cuj.calendar.reserv.service.ReservService;
import com.cuj.calendar.reserv.vo.EnableTime;
import com.cuj.calendar.reserv.vo.ReservVO;
import com.google.gson.Gson;

@Controller
public class ReservController {

	@Autowired
	ReservService reservService;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	@RequestMapping("/reservView")
	public String reservView(Model model) {
		
		reservService.delPastReserv();
		
		Date date = new Date();
		
		List<ReservVO> reservList = reservService.getReservList(sdf.format(date));
		
		Gson gson = new Gson();
		
		String result = gson.toJson(reservList);
		
		model.addAttribute("reservList", result);
		
		return "reserv/reservView";
	}
	
	@ResponseBody
	@RequestMapping("/cancelReserv")
	public String cancelReserv(@RequestBody ReservVO reserv) {
		
		System.out.println(reserv);

		// 삭제(del_yn = Y)가 성공적으로 끝나면 true, 아니면 false 리턴
		int cnt = reservService.cancelReserv(reserv);
		String result = (cnt == 1) ? "true" : "false";
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/reservList", produces="text/plain;charset=UTF-8") // ajax 통신으로 한글을 보낼시 UTF-8 설정 추가
	public String reservList(@RequestBody String choiceDate) { // @RequestBody 넣어도 객체가 아니면 그냥 요청시 보낸 문자열 통째로 온다.
		
		System.out.println(choiceDate);
		
		List<ReservVO> reservList = reservService.getReservList(choiceDate);
		
		Gson gson = new Gson();
		
		String result = gson.toJson(reservList);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/getReserv")
	public Map<String, Object> getReserv(@RequestBody ReservVO reserv) {
		
		System.out.println("getReserv: " + reserv);
		
		ReservVO result = reservService.getReserv(reserv);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("data", result);
		
		return map;
	}
	
	@RequestMapping("/insertReservView")
	public String insertReservView(Model model, String choiceDate, ReservVO reserv) {
		
		System.out.println(choiceDate);
		System.out.println(reserv);
		
		Date date = new Date();
		try {
			if(choiceDate == null || choiceDate.isEmpty()) {
				choiceDate = sdf.format(date);
			}
			date = sdf.parse(choiceDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		List<String> timeList = reservService.getEnableTimeList(choiceDate);
		
		List<EnableTime> enableTimeList = reservService.makeEnableTimeList(timeList, date);
		
		model.addAttribute("choiceDate", choiceDate);
		model.addAttribute("reserv", reserv);
		model.addAttribute("enableTimeList", enableTimeList);
		
		return "reserv/insertReservView";
	}
	
	@ResponseBody
	@RequestMapping("/enableTimeList")
	public String enableTimeList(String choiceDate) {
		
		System.out.println(choiceDate);
		
		Date date = new Date();
		try {
			if(choiceDate == null) {
				choiceDate = sdf.format(date);
			}
			date = sdf.parse(choiceDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		List<String> timeList = reservService.getEnableTimeList(choiceDate);
		
		List<EnableTime> enableTimeList = reservService.makeEnableTimeList(timeList, date);
		
		Gson gson = new Gson();
		
		String result = gson.toJson(enableTimeList);
		
		return result;
	}
	
	@PostMapping("/insertReservDo")
	public String insertReservDo(ReservVO reserv) {
		
		System.out.println(reserv);
		
		try {
			reservService.insertReserv(reserv);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		return "redirect:/reservView";
	}
	
	@PostMapping("/updateReservDo")
	public String updateReservDo(ReservVO reserv) {
		
		System.out.println(reserv);
		
		int cnt = reservService.cancelReserv(reserv);
		
		if(cnt == 1) {
			try {
				reservService.insertReserv(reserv);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/reservView";
	}
	
	@ResponseBody
	@RequestMapping("/enableReservCheckDo")
	public String enableReservCheckDo(@RequestBody ReservVO reserv) {
		
		System.out.println("enableReservCheckDo: " + reserv);
		
		// 중복 체크 결과가 0이면 true (중복되지 않음), 아니면 false 리턴
		int cnt = reservService.reservDupleCheck(reserv);
		String result = (cnt == 0) ? "true" : "false";
		
		return result;
	}
	
	
}
