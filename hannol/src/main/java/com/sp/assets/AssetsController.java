package com.sp.assets;

import java.text.SimpleDateFormat;
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

import com.sp.member.SessionInfo;

@Controller("assets.assetsController")
public class AssetsController {
	@Autowired
	AssetsService service;
	
	//편의시설 리스트
	@RequestMapping(value="/amenities/list", method=RequestMethod.GET)
	public String list(Model model) throws Exception{
	
		model.addAttribute("subMenu", "4");
		
		return ".four.menu8.amenities.list"; 
	}
	
	//예약
	@RequestMapping(value="/amenities/reservation", method=RequestMethod.GET)
	public String reservation(@RequestParam(value="gubunCode") int gubunCode,
			@RequestParam(required=false, value="selectDay") String selectDay,
			HttpServletRequest req,    
			HttpSession session,
			Assets dto,
			Model model) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			long usersCode = info.getUsersCode(); //유저 번호
			List<Map<String, Object>> searchPayList = service.searchPayment(usersCode); //이용권 리스트

			//이용권 구분번호
			String goodsCode =  String.valueOf(searchPayList.get(0).get("GOODSCODE"));
  
			//이용권을 구매하지 않았다면 구매페이지로
			if(searchPayList==null || searchPayList.size()==0) {
				model.addAttribute("state", "noTicket"); 
			
			//만약 연간 회원권 구매자라면 날짜 선택페이지로 이동
			}else if (goodsCode.equals("2") && selectDay==null)  {    
				return "redirect:/amenities/dayCalendar?gubunCode="+gubunCode;         
				
			}else {
				//테마 리스트
				List<Map<String, Object>> listTheme = service.listTheme();

				String title = gubunCode==1 ? "유모차" : (gubunCode==2 ? "휠체어" : "보관함"); 
				
				model.addAttribute("searchPayList", searchPayList);
				model.addAttribute("listTheme", listTheme);
				model.addAttribute("usersCode", usersCode); 
				model.addAttribute("gubunCode", gubunCode); 
				model.addAttribute("selectDay", selectDay);
				model.addAttribute("title", title);
				
				model.addAttribute("subMenu", "4");
				
			}
		} catch (Exception NullPointerException) {
			//로그인이 되어있지 않다면 로그인 페이지로
			model.addAttribute("message", "편의시설은 로그인 후 이용하실 수 있습니다.");
			return ".member.login";     
		}	
		
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
	public String reservation(Assets dto) throws Exception{
		
		try {
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
