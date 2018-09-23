package com.sp.show;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("show.ShowController")
public class ShowController {

	
	// 금주의 무대공연 리스트
	@RequestMapping(value="/show/list", method=RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("subMenu", "3");
		model.addAttribute("gubunCode", "3");
		return ".four.menu6.show.list";
	}
	
	@RequestMapping(value="/show/detail", method=RequestMethod.GET)
	public String showList(
			@RequestParam(value="gubunCode") String gubunCode,
			@RequestParam(value="date") String date,
			Model model) {
		
		return "menu6/show/showList";
	}
}
