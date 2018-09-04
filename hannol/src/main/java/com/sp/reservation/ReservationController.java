package com.sp.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("reservation.reservationController")
public class ReservationController {
	@RequestMapping(value="/reservation/reservate")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.menu8.reservation.info";
	}
}
