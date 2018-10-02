package com.sp.question;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtilGeneral;
import com.sp.member.SessionInfo;
import com.sp.notice.Notice;

@Controller("question.questionController")
public class QuestionController {

	@Autowired
	QuestionService service;

	@Autowired
	MyUtilGeneral util;

	@RequestMapping(value = "/question/question")
	public String question(Model model) throws Exception {

		model.addAttribute("subMenu", "4");

		return ".four.menu2.question.question";
	}

	@RequestMapping(value = "/question/insertQuestion")
	public String insertQueston(Question dto, HttpSession session) throws Exception {

		if (dto == null)
			return "question/question";

		dto.setParentCode(0);

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		dto.setUsersCode((int) info.getUsersCode());

		service.insertQuestion(dto);

		return "redirect:/question/result";
	}

	@RequestMapping(value = "/question/result")
	public String result() throws Exception {

		return ".four.menu2.question.result";
	}

	@RequestMapping(value = "/mypage/question")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page, 
			Model model,
			HttpServletRequest req,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		int dataCount = service.dataCount((int) info.getUsersCode());
		int rows = 10;
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		int total_page = util.pageCount(rows, dataCount);
		if (current_page > total_page)
			current_page = total_page;
		
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("usersCode", (int)info.getUsersCode());

		List<Question> list = service.list(map);
		
		int listNum, n = 0;
		Iterator<Question> it = list.iterator();
		while (it.hasNext()) {
			Question data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

		String cp = req.getContextPath();
		String list_url = cp+"/mypage/question";
		String articleUrl = cp + "/mypage/article?page=" + current_page;
		String paging = util.paging(current_page, total_page, list_url);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("subMenu", "7");

		return ".four.menu3.mypage.question";
	}
	
	@RequestMapping(value = "/mypage/article")
	public String article(int num, Model model) throws Exception{
		
		Question dto = service.readQuestion(num);
		
		model.addAttribute("dto", dto);
		
		return ".four.menu3.mypage.questionArticle";
	}
}
