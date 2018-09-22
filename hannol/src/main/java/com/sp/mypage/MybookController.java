package com.sp.mypage;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("mypage.mybookController")
public class MybookController {
	@Autowired	
	private MybookService service;
	
	@Autowired
	MyUtil myUtil;
	
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
	
	// 공연 리스트 - tab list
		@RequestMapping(value="/show/{gubunCode}/list", method=RequestMethod.GET)
		public String showList(
				@PathVariable String gubunCode,
				@RequestParam(value="tab", defaultValue="all") String tab,
				@RequestParam(value="searchKey", defaultValue="all") String searchKey,
				@RequestParam(value="searchValue", defaultValue="") String searchValue,
				@RequestParam(value="pageNo", defaultValue="1") int current_page,
				HttpServletRequest req,
				HttpSession session,
				Model model) throws Exception{
			// tab : all, experience(1), parade(2), stage(3)
			
			
			SessionInfo info =(SessionInfo) session.getAttribute("member");
			
			int rows = 10;
			int total_page = 0;
			int dataCount = 0;
			
			if(req.getMethod().equalsIgnoreCase("get")) {
				searchValue = URLDecoder.decode(searchValue, "utf-8");
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("searchKey", searchKey);
			map.put("searchValue", searchValue);
			if(!gubunCode.equals("0")) {
				map.put("gubunCode", gubunCode); ///////////////////////////////////////////// 
			}
			
			int usersCode = (int)info.getUsersCode();
			map.put("usersCode", usersCode);
			
			dataCount = service.dataCount(map);
			if(dataCount != 0) 
				total_page = myUtil.pageCount(rows, dataCount);
			
			if(current_page > total_page)
				current_page = total_page;
			
			int start = (current_page - 1) * rows + 1;
			int end = current_page * rows;
			map.put("start", start);
			map.put("end", end);
			
			List<Mybook> list = service.listMybook(map);
			
			String cp = req.getContextPath();
			String paging = myUtil.paging(current_page, total_page);
			String articleUrl = cp + "/show/article";
			
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("paging", paging);
			model.addAttribute("total_page", total_page);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("tab", tab);
			
			return "show/showList";
		}
		
}
