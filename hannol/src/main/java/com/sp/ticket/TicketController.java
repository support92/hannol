package com.sp.ticket;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping(value="/reservation/dayTicket")
	public String ticketDay(String day, Model model) throws Exception{
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
		
		return ".four.menu8.ticket.dayTicket";
	}
}
