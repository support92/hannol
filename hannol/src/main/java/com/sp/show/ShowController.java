package com.sp.show;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("show.ShowController")
public class ShowController {

	@Autowired
	ShowService service;
	
	// 금주의 무대공연 리스트
	@RequestMapping(value="/show/list", method=RequestMethod.GET)
	public String stageList(Model model) {
		model.addAttribute("subMenu", "3");
		model.addAttribute("gubunCode", "3");
		model.addAttribute("gubun", "무대공연");
		return ".four.menu6.show.list";
	}
	
	// 금주의 체험 리스트
	@RequestMapping(value="/show/experience", method=RequestMethod.GET)
	public String experienceList(Model model) {
		model.addAttribute("subMenu", "4");
		model.addAttribute("gubunCode", "1");
		model.addAttribute("gubun", "체험");
		return ".four.menu6.show.list";
	}

	// 금주의 퍼레이드 리스트
	@RequestMapping(value="/show/parade", method=RequestMethod.GET)
	public String paradeList(Model model) {
		model.addAttribute("subMenu", "5");
		model.addAttribute("gubunCode", "2");
		model.addAttribute("gubun", "퍼레이드");
		return ".four.menu6.show.list";
	}

	
	@RequestMapping(value="/show/detail", method=RequestMethod.GET)
	public String showList(
			@RequestParam(value="gubunCode") String gubunCode,
			@RequestParam(value="date") String date,
			Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		map.put("screenDate", date);
		map.put("gubunCode", gubunCode);
		
		List<Show> list = service.listShow(map);
		model.addAttribute("list", list);
		
		return "menu6/show/showList";
	}
}
