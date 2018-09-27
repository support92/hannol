package com.sp.magicpass;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("magicpass.MagicPassController")
public class MagicPassController {

	@RequestMapping(value="/magicPass/rides")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.menu5.magicPass.info";
	}
	
	@RequestMapping(value="/magicPass/booking")
	public String masicpassBooking(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.menu5.magicPass.booking";
	}
}
