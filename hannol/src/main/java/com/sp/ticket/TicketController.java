package com.sp.ticket;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.member.SessionInfo;

@Controller("ticket.ticketController")
public class TicketController {
	
	@Autowired
	private TicketService service;
	
	@RequestMapping(value="/ticket/list")
	public String ticketList(Model model) throws Exception{
		List<Ticket> list = service.listTicket();
		
		List<Ticket> oneDay = new ArrayList<>();
		List<Ticket> after = new ArrayList<>();
		List<Ticket> big = new ArrayList<>();
		List<Ticket> years = new ArrayList<>();
		
		for(Ticket dto : list) {
			if(dto.getGubunCode()==3) {
				oneDay.add(dto);
			}else if(dto.getGubunCode()==5) {
				after.add(dto);
			}else if(dto.getGubunCode()==7) {
				big.add(dto);
			}
		}
		
		model.addAttribute("oneDay", oneDay);
		model.addAttribute("after", after);
		model.addAttribute("big", big);
		model.addAttribute("years", years);
		
		return ".four.menu1.ticket.ticket";
	}
	
	@RequestMapping(value="/reservation/ticket")
	public String ticketSelect() throws Exception{
		return ".four.menu8.ticket.ticket";
	}
	
	@RequestMapping(value="/reservation/dayCalendar")
	public String dayCalendar(Model model) throws Exception{
		
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate startDay = LocalDate.now();
		LocalDate endDay = LocalDate.now().plusMonths(1);
		
		model.addAttribute("startDay", dateFormat.format(startDay));
		model.addAttribute("endDay", dateFormat.format(endDay));
		
		return ".four.menu8.ticket.calendar";
	}
	
	@RequestMapping(value="/reservation/yearTicket")
	public String ticketYear() throws Exception{
		
		return ".four.menu8.ticket.ticket";
	}
	
	
	@RequestMapping(value="/reservation/checkYearTicket")
	@ResponseBody
	public Map<String, Object> checkYearTicket(HttpSession session) throws Exception{
		Map<String, Object> map = new HashMap<>();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info == null) {
			map.put("state", "fail");
			return  map;
		}
		
		
		return map;
	}
	
	@RequestMapping(value="/reservation/dayTicket")
	public String ticketDay(String day, int limit, Model model) throws Exception{
		List<Ticket> list = service.listTicket();
		
		List<Ticket> oneDay = new ArrayList<>();
		List<Ticket> oneDayMasic = new ArrayList<>();
		List<Ticket> after = new ArrayList<>();
		List<Ticket> afterMasic = new ArrayList<>();
		List<Ticket> big = new ArrayList<>();
				
		for(Ticket dto : list) {
			if(dto.getGubunCode()==3) {
				oneDay.add(dto);
			}else if(dto.getGubunCode()==4) {
				oneDayMasic.add(dto);
			}else if(dto.getGubunCode()==5) {
				after.add(dto);
			}else if(dto.getGubunCode()==6) {
				afterMasic.add(dto);
			}else if(dto.getGubunCode()==7) {
				big.add(dto);
			}
		}
		
		model.addAttribute("oneDay", oneDay);
		model.addAttribute("oneDayMasic", oneDayMasic);
		model.addAttribute("after", after);
		model.addAttribute("afterMasic", afterMasic);
		model.addAttribute("big", big);
		model.addAttribute("day", day);
		model.addAttribute("limit", limit);
		
		return ".four.menu8.ticket.dayTicket";
	}
	
	@RequestMapping(value="/reservation/checkUser")
	@ResponseBody
	public Map<String, Object> ticketCheckUser(Map<String, Object> map, String day, HttpSession session) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> model = new HashMap<>();
		if(info==null) {
			model.put("state", "fail");
			return model;
		}
		
		String timeStamp = new SimpleDateFormat("HH").format(new Date());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		Date selectDay = dateFormat.parse(day);
		Date now = dateFormat.parse(today);
		
		int compare = now.compareTo(selectDay);
		
		if(Integer.parseInt(timeStamp)>20 && compare>=0) {
			model.put("state", "close");
			return model;
		}
		
		long userCode = info.getUsersCode();
		map.put("usersCode", userCode);
		map.put("day", day);
		
		int result = service.checkReservation(map);
		model.put("limit", result);
		
		return model;
	}
}
