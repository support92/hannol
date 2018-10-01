package com.sp.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("review.ReviewController")
public class ReviewController {

	@Autowired
	ReviewService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "/review/list", method = RequestMethod.GET)
	public String list(HttpSession session, Model model) {
		model.addAttribute("subMenu", "5");
		return ".four.menu2.review.list";
	}

 	@RequestMapping(value="/review/create", method=RequestMethod.POST)
 	@ResponseBody
 	public Map<String, Object> createReviewSubmit(Review dto,
 			HttpSession session) throws Exception {
 		
 		Map<String, Object> model=new HashMap<>();
 		SessionInfo info = (SessionInfo) session.getAttribute("member"); 	
 		if(info == null) {
 			model.put("state", "false");
 			model.put("msg", "로그인을 해야만 후기를 남길 수 있습니다.");
 			return model;
 		}
 		
 		dto.setUsersCode((int) info.getUsersCode());
 		service.insertReview(dto);
 		model.put("state", "true");
 		return model;
 	}
 	
 	@RequestMapping(value = "/review/listReview", method = RequestMethod.GET)
	public String listReview(@RequestParam(value="pageNo", defaultValue="1") int current_page,
			HttpSession session,
			Model model) throws Exception {
 		int rows = 5;
 		int total_page = 0;
 		int dataCount = 0; 

 		dataCount = service.dataCount();
 		total_page = myUtil.pageCount(rows, dataCount);
 		if(current_page>total_page)
 			current_page=total_page;
 		
 		int start = (current_page-1)*rows+1;
 		int end = current_page*rows;
 		
 		Map<String, Object> map = new HashMap<>();
 		map.put("start", start);
 		map.put("end", end);
 		
 		List<Review> list = service.listReview(map);
 		
 		for(Review dto : list) {
 			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
 		}
 		
 		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
 		
 		model.addAttribute("list", list);
 		model.addAttribute("pageNo", current_page);
 		model.addAttribute("dataCount", dataCount);
 		model.addAttribute("total_page", total_page);
 		model.addAttribute("paging", paging);
 		
		return "menu2/review/reviewList";
	}
 	
}
