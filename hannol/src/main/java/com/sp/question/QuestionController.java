package com.sp.question;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class QuestionController {

	@RequestMapping(value = "/question/list")
	public String list(Model model) throws Exception {
		
		model.addAttribute("subMenu", "4");
		
		return ".four.menu2.question.list";
	}
}
