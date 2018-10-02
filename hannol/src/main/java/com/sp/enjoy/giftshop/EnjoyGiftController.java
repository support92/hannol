package com.sp.enjoy.giftshop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.common.MyUtil;

@Controller("giftshop.enjoyGiftController")
public class EnjoyGiftController {
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/enjoy/giftshop")
	public String enjoyGiftList(Model model) {
		
		model.addAttribute("subMenu", "2");
		return ".four.menu6.giftshop.list";
	}
}
