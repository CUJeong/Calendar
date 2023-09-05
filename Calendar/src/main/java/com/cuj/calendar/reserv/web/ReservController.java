package com.cuj.calendar.reserv.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String reservView() {
		
		
		return "reserv/reservView";
	}
	
	
	@RequestMapping("/insertReservView")
	public String insertReservView(Model model) {
		
		Calendar cal = Calendar.getInstance();
		List<String> timeList = reservService.getEnableTimeList(sdf.format(cal.getTime()));
		
		List<EnableTime> enableTimeList = reservService.makeEnableTimeList(timeList, cal.getTime());
		
		model.addAttribute("enableTimeList", enableTimeList);
		
		return "reserv/insertReservView";
	}
	
	@ResponseBody
	@RequestMapping("/enableTimeList")
	public String enableTimeList(String choiceDate) {
		
		System.out.println(choiceDate);
		
		Date date = new Date();
		try {
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
	
	
}
