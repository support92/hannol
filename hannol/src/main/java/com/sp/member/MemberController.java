package com.sp.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("member.memberController")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/member/member", method=RequestMethod.GET)
	public String memberForm(Model model) {
		model.addAttribute("mode", "created");
		return ".member.member";
	}

	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String loginForm() {
		return ".member.login";
	}

	@RequestMapping(value="/member/kakao_oauth", method=RequestMethod.GET)
	public String kakaologinForm() {
		
		
		
		
		return "redirect:/";
	}
	
	
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginSubmit(
			@RequestParam String userId,
			@RequestParam String userPwd,
			HttpSession session,
			Model model
			) {
		
		Member dto=service.loginMember(userId);
		if(dto==null ||  !  userPwd.equals(dto.getMemberPwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".member.login";
		}
		
		// 세션에 로그인 정보 저장
		SessionInfo info=new SessionInfo();
		info.setUsersCode(dto.getUsersCode());
		info.setMemberId(dto.getMemberId());
		info.setMemberName(dto.getMemberName());
		info.setAuthority(dto.getAuthority());
		
		session.setMaxInactiveInterval(30*60); // 세션유지시간 30분, 기본:30분
		
		session.setAttribute("member", info);
		
		// 로그인 이전 URI로 이동
		String uri=(String)session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		if(uri==null)
			uri="redirect:/";
		else
			uri="redirect:"+uri;
		
		return uri;
	}
	
	@RequestMapping(value="/member/logout")
	public String logout(HttpSession session) {
		// 세션에 저장된 정보 지우기
		session.removeAttribute("member");
		
		// 세션에 저장된 모든 정보 지우고, 세션초기화
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/member/pwd", method=RequestMethod.GET)
	public String pwdForm(
			String dropout,
			Model model) {
		
		if(dropout==null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "dropout");
		}
		
		return ".member.pwd";
	}
	
	
}
