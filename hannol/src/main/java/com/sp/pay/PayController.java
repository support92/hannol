package com.sp.pay;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.member.SessionInfo;

@Controller("pay.payContoller")
public class PayController {
	@Autowired
	PayService service;

	@RequestMapping(value = "/pay/list")
	public String payList(HttpSession session, Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		Date date = new Date();
		String curDate = format.format(date);

		Map<String, Object> map = new HashMap<>();
		map.put("usersCode", info.getUsersCode());
		map.put("curDate", curDate);

		int couponCount = service.couponCount(map);
		if (couponCount >= 4)
			couponCount = 4;

		model.addAttribute("couponCount", couponCount);

		return ".four.menu9.pay.list";
	}
}
