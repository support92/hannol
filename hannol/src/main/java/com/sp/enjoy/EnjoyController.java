package com.sp.enjoy;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("enjoy.enjoyController")
public class EnjoyController {
	@RequestMapping(value="/enjoy/rides")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.menu6.rides.info";
	}
}
