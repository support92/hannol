package com.sp.today;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("todaypark.todayParkController")
public class TodayParkController {
	@RequestMapping(value="/todayPark/rides")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.menu4.todayPark.info";
	}
}
