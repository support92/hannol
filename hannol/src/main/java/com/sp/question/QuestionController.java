package com.sp.question;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.member.SessionInfo;

@Controller("question.questionController")
public class QuestionController {
	
	@Autowired
	QuestionService service;

	@RequestMapping(value = "/question/question")
	public String question(Model model) throws Exception {
		
		model.addAttribute("subMenu", "4");
		
		return ".four.menu2.question.question";
	}
	
	@RequestMapping(value = "/question/insertQuestion")
	public String insertQueston(Question dto, HttpSession session) throws Exception{
		
		if(dto == null)
			return "question/question";
		
		dto.setParentCode(0);
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		dto.setUsersCode((int)info.getUsersCode());
		
		service.insertQuestion(dto);
		
		return "redirect:/question/result";
	}
	
	@RequestMapping(value = "/question/result")
	public String result() throws Exception{
		
		return ".four.menu2.question.result";
	}
		
}
