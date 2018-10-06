package com.sp.assets;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.member.SessionInfo;

@Controller("assets.assetsController")
public class AssetsController {
	@Autowired
	AssetsService service;
	
	//편의시설 리스트
	@RequestMapping(value="/amenities/list", method=RequestMethod.GET)
	public String list(@RequestParam(value="msg", defaultValue="") String msg, Model model) throws Exception{
	
		if(msg.length() != 0) {
			model.addAttribute("msg", msg);
		}
		
		model.addAttribute("subMenu", "4");
		
		return ".four.menu8.amenities.list"; 
	}
	
	//예약
	@RequestMapping(value="/amenities/reservation", method=RequestMethod.GET)
	public String reservation(@RequestParam(value="gubunCode") int gubunCode,
			HttpServletRequest req,    
			HttpSession session,
			Assets dto,
			Model model) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info==null) {
			model.addAttribute("message", "편의시설은 로그인 후 이용하실 수 있습니다.");
			return ".member.login";
		}
		
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate startDay = LocalDate.now();
		LocalDate endDay = LocalDate.now().plusMonths(1);
		
		model.addAttribute("startDay", dateFormat.format(startDay));
		model.addAttribute("endDay", dateFormat.format(endDay));
		model.addAttribute("gubunCode", gubunCode);
		return ".four.menu8.amenities.calendar";
	}
	
	//선택한 날짜에 구매티켓이 존재하는지 확인
	@RequestMapping(value="/amenities/checkTicket")
	public String checkTicket(
			@RequestParam(value="gubunCode") int gubunCode, 
			@RequestParam(required=false, value="selectDay") String selectDay, 
			HttpSession session,
			RedirectAttributes redirectAttributes,
			Model model) throws Exception{
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("selectDay", selectDay);

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		long usersCode = info.getUsersCode();
		paramMap.put("usersCode", usersCode);
		
		int result = service.checkTicketCount(paramMap);
		if(result==0) {
			redirectAttributes.addAttribute("msg", "해당 날짜에 이용가능한 티켓이 없습니다. 구매 후 시도해 주세요");
			return "redirect:/amenities/list";
		}
		
		List<Map<String, Object>> listTheme = service.listTheme();
		model.addAttribute("listTheme", listTheme);
		model.addAttribute("gubunCode", gubunCode);
		model.addAttribute("selectDay", selectDay);
		
		
		return ".four.menu8.amenities.reservation";
	}
	
	//테마 선택하면 대여소 검색 : AJAX-JSON
	@RequestMapping(value="/amenities/assetsSerach", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> assetsSerach(@RequestParam(value="themeCode") int themeCode,
			@RequestParam(value="gubunCode") String gubunCode) throws Exception{
		
		//대여소 검색
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("themeCode", themeCode);
		map.put("gubunCode", gubunCode);
		Map<String, Object> searchFacility = service.searchFacility(map);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("searchFacility", searchFacility); 
		
		return model;
	}
		
	//예약날짜 선택하면 입장권 검색 : AJAX-JSON
	@RequestMapping(value="/amenities/searchPayment", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> searchPayment(@RequestParam(value="useDate") String useDate,
			@RequestParam(value="usersCode") String usersCode) throws Exception{
	
		//입장권 검색
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("endDate", useDate); 
		map.put("usersCode", usersCode); 
		Map<String, Object> searchPayment2 = service.searchPayment2(map); 
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("searchPayment2", searchPayment2); 
 
		return model;
	}	
	
	//예약 추가
	@RequestMapping(value="/amenities/reservation", method=RequestMethod.POST)
	public String reservation(Assets dto, HttpSession session) throws Exception{
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			long usersCode = info.getUsersCode();
			dto.setUsersCode(usersCode);
			
			String tel1 = dto.getTel1();
			String tel2 = dto.getTel2();
			String tel3 = dto.getTel3(); 
			dto.setTel(tel1+"-"+tel2+"-"+tel3);
			
			service.insertAssetsBook(dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return ".four.menu3.mypage.myBook"; 
	}
	
	//날짜 선택 폼 (연간이용권회원만, 한달이내에만 선택가능)
	@RequestMapping(value="/amenities/dayCalendar", method = RequestMethod.GET) 
	public String calendarForm(@RequestParam(value="gubunCode") String gubunCode,
			Model model) throws Exception{
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
		Calendar start = Calendar.getInstance(); //시작날짜(오늘 날짜)
		Calendar end = Calendar.getInstance(); //끝날짜(한달후까지만)
		end.add(Calendar.MONTH, +1); 
		
		String startDay = sdf.format(start.getTime());
		String endDay = sdf.format(end.getTime());  
		
		model.addAttribute("startDay", startDay);
		model.addAttribute("endDay", endDay);  
		model.addAttribute("gubunCode", gubunCode);   
		model.addAttribute("subMenu", "4");
		
		return ".four.menu8.amenities.calendar";  
	}
	
	//예약내역이 있는지 검색 AJAX-JSON
	@RequestMapping(value="/amenities/searchReservation", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> searchReservation(HttpSession session,
			@RequestParam(value="useDate") String useDate,
			@RequestParam(value="gubunCode") int gubunCode) throws Exception{

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		long usersCode = info.getUsersCode(); //유저 번호
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usersCode", usersCode);
		map.put("useDate", useDate);
		map.put("gubunCode", gubunCode); 
		
		String state = "notExistence";
		int result = service.searchReservation(map);
		
		if(result!=0) 
			state = "existence";    
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
} 
