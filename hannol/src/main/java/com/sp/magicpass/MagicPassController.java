package com.sp.magicpass;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("magicpass.MagicPassController")
public class MagicPassController {
	
	@Autowired
	private MagicPassService service;

	@Autowired
	private MyUtil myUtil;
	

	@RequestMapping(value="/magicPass/rides")
	public String info(Model model) throws Exception {
		
		return ".four.menu5.magicPass.info";
	}
	
	@RequestMapping(value="/magicPass/booking")
	public String masicpassBooking(HttpSession session, RedirectAttributes redirectAttributes, Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		
		long usersCode = info.getUsersCode();
		int result = service.checkTicket(usersCode);
		if(result==0) {
			redirectAttributes.addFlashAttribute("msg", "오늘 사용가능한 이용권이 없습니다.");
			return "redirect:/magicPass/rides";
		}
		
		
		return ".four.menu5.magicPass.booking";
	}
}
