package com.sp.facilities;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("facilities.facilitiesController")
public class FacilitiesController {
	@RequestMapping(value="/facilities/info")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.menu7.facilities.info";
	}
}
