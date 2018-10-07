package com.sp.member;

import java.util.HashMap;
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

@Controller("member.memberController")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/member/member", method=RequestMethod.GET)
	public String memberForm(Model model) {
		model.addAttribute("mode", "created");
		return ".member.member";
	}
	
	@RequestMapping(value="/member/userIdCheck")
	@ResponseBody
	public Map<String, Object> userIdCheck(
			@RequestParam String userId
			) throws Exception {
		String passed="false";
		Member dto=service.readMember(userId);
		if(dto==null)
			passed="true";
		
   	    // 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>(); 
		model.put("passed", passed);
		return model;
	}

	@RequestMapping(value="/member/userEmailCheck")
	@ResponseBody
	public Map<String, Object> userEmailCheck(
			@RequestParam String email
			) throws Exception {
		String passed="false";
		Member dto=service.readMemberByEmail(email);
		if(dto==null)
			passed="true";
		
		// 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>(); 
		model.put("passed", passed);
		return model;
	}
	
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String loginForm(@RequestParam(required=false)String login_error, Model model) {
		
		if (login_error != null) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
		}

		return ".member.login";
	}

	@RequestMapping(value="/member/kakao_oauth", method=RequestMethod.GET)
	public String kakaologinForm(HttpServletRequest request,
			@RequestParam(required=true) String memberId,
			@RequestParam(required=true) String memberName,
			@RequestParam(required=false) String email) {
		
		System.out.println("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
		
		
		// 회원테이블에 아이디가 존재하는지 확인
		Member dto = service.readMember(memberId);
		
		// 아이디가 없을 경우 회원가입
		try {
			if(dto == null) {
				dto = new Member();
				long seq = service.userSeq();
				dto.setUsersCode(seq);
				dto.setMemberId(memberId);
				dto.setMemberName(memberName);
				dto.setEmail(email);
				dto.setJoinPath("카카오톡");
				service.insertMember(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 세션에 로그인 정보 저장
		HttpSession session = request.getSession();
		SessionInfo info = new SessionInfo();
		info.setMemberId(memberId);
		info.setMemberName(dto.getMemberName());
		info.setUsersCode(dto.getUsersCode());
		info.setAuthority(dto.getAuthority());
		
		// 로그인 날짜 변경
		try {
			service.updateLastLogin(dto.getUsersCode());
		} catch (Exception e) {
			e.printStackTrace();
		}

		// session에 member라는 이름으로 사용자 정보 저장
		session.setAttribute("member", info);

		// 메인으로 이동
		return "redirect:/main";
	}
	
	/*@RequestMapping(value="/member/login", method=RequestMethod.POST)
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
	}*/
	
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
