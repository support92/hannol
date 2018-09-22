package com.sp.show;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("show.ShowController")
public class ShowController {

		
	@RequestMapping(value="/show/list", method=RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("subMenu", "3");
		return ".four.menu6.show.list";
	}
}
