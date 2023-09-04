package com.cuj.calendar.reserv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cuj.calendar.reserv.service.ReservService;

@Controller
public class ReservController {

	@Autowired
	ReservService reservService;
	
	@RequestMapping("/reservView")
	public String reservView() {
		
		
		return "reserv/reservView";
	}
	
	@RequestMapping("/insertReservView")
	public String insertReservView() {
		
		
		return "reserv/insertReservView";
	}
	
}
