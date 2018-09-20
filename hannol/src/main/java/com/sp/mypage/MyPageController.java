package com.sp.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("mypage.myPageController")
public class MyPageController {
	
	@RequestMapping(value="/mypage/info")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		model.addAttribute("mode", "update");
		return ".four.menu3.mypage.info";
	}
	
	// 공연 리스트
	@RequestMapping(value = "/mypage/myBook", method = RequestMethod.GET)
	public String manageShow(
			@RequestParam(value="tab", defaultValue="all") String tab,
			@RequestParam(value="pageNo", defaultValue="1") int page,
			Model model) {
		
		// model - tab
		model.addAttribute("tab", tab);
		model.addAttribute("pageNo", page);
		
		model.addAttribute("subMenu", "5");
		
		return ".four.menu3.mypage.myBook";
	}
}
