package com.sp.show;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.filefilter.FalseFileFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.member.SessionInfo;

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
		model.addAttribute("gubunCode", gubunCode);
		return "menu6/show/showList";
	}
	
	
	// 금주의 무대공연 리스트
	@RequestMapping(value="/show/article", method=RequestMethod.GET)
	public String article(
			@RequestParam(value="subMenu") String subMenu,
			@RequestParam(value="screenDate") String screenDate,
			@RequestParam(value="showInfoCode") int showInfoCode,
			Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		map.put("showInfoCode", showInfoCode);
		map.put("screenDate", screenDate);
		
		Show dto = service.readShowInfo(map);
		
		model.addAttribute("subMenu", subMenu);
		model.addAttribute("dto", dto);
		return ".four.menu6.show.article";
	}
	
	// 예약 페이지
	@RequestMapping(value="/show/reseration", method=RequestMethod.GET)
	public String reseration(
			@RequestParam(value="subMenu", defaultValue="3") String subMenu,
			@RequestParam(value="screenDate") String screenDate,
			@RequestParam(value="showInfoCode") int showInfoCode,
			@RequestParam(value="msg", required=false) String msg,
			Model model) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("showInfoCode", showInfoCode);
		map.put("screenDate", screenDate);
		
		Show dto = service.readShowInfo(map);
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("subMenu", subMenu);
		model.addAttribute("screenDate", screenDate);
		model.addAttribute("showInfoCode", showInfoCode);
		model.addAttribute("msg", msg);
		return ".four.menu6.show.reservation";
	}

	@RequestMapping(value="/show/selectSeatForm", method=RequestMethod.GET)
	public String selectSeatForm(
		@RequestParam(value="screenDate") String screenDate,
		@RequestParam(value="startTime") String startTime,
		@RequestParam(value="showInfoCode") int showInfoCode,
		@RequestParam(value="facilityCode") int facilityCode,
		Model model) throws Exception{
	
		// 시설의 총 좌석 수
		int seatCount = service.readSeatCount(facilityCode);
		model.addAttribute("seatCount", seatCount);
		
		model.addAttribute("screenDate", screenDate);
		model.addAttribute("startTime", startTime);
		model.addAttribute("showInfoCode", showInfoCode);
		return "menu6/show/selectSeat";
	}

	
	// @RequestParam(value="selectSeat", required=false) List<Integer> selectSeat 
	// 이렇게 받으면 계속 404 에러가 난다.
	// 이유는 List 의 경우 dto 안에서만 받을 수 있다. RequestParam 으로 불가능
	// 또는 배열로 받아야 한다.
	
	@RequestMapping(value="/show/selectSeatSubmit", method=RequestMethod.POST)
	public String selectSeatSubmit(
			@RequestParam(value="screenDate") String screenDate,
			@RequestParam(value="startTime") String startTime,
			@RequestParam(value="showInfoCode") int showInfoCode,
			@RequestParam(value="selectSeat") List<Integer> selectSeat,
			HttpSession session,
			final RedirectAttributes attr,
			Model model) throws Exception{
		
		// 로그인 했는지 확인 - intercept 를 적용하지 않았으므로
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		
		// screenDate가 startDate 와 endDate 사이에 있는 이용권의 리스트
		// 구매 테이블은 필요 없는듯. 이용권 발급 리스트만
		Map<String, Object> map = new HashMap<>();
		map.put("screenDate", screenDate);
		map.put("memberId", info.getMemberId());
		
		List<Ticket> list = service.listTicket(map);
		if(list.size()==0) {
			attr.addFlashAttribute("msg", "해당 일자에 구매한 이용권이 없습니다.");
			attr.addFlashAttribute("screenDate", screenDate);
			attr.addFlashAttribute("showInfoCode", showInfoCode);
			return "redirect:/show/reseration"; 
		}
		
		// 만약 야간 이용권 - startTime 이 4시 이전이면 예약 불가
		
		// 이미 예약된 좌석이면 또 예약 불가
		
		
		
		return "redirect:/show/list";
	}

}
