package com.sp.question;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("question.questionController")
public class QuestionController {

	@RequestMapping(value = "/question/question")
	public String list(Model model) throws Exception {
		
		model.addAttribute("subMenu", "4");
		
		return ".four.menu2.question.question";
	}
}
