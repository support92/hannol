package com.sp.review;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("review.ReviewController")
public class ReviewController {
	
	@RequestMapping(value="/review/list", method=RequestMethod.GET)
	public String listReview(Model model) {
		model.addAttribute("subMenu", "5");
		return ".four.menu2.review.list";
	}
}
