package com.sp.pay;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.member.SessionInfo;

@Controller("pay.payContoller")
public class PayController {
	@Autowired
	PayService service;

	@RequestMapping(value = "/pay/list")
	public String payList(@RequestParam(required = false) Map<String, List<Pay>> maps, HttpSession session, Model model)
			throws Exception {

		List<Pay> testList = new ArrayList<>();

		Pay testlist = new Pay();
		testlist.setGubunCode(8);
		testlist.setGoodsCode(3);
		testlist.setGoodsName("미니언즈 팝콘통");
		testlist.setGoodsPrice(50000);
		testlist.setQuantity(2);
		testlist.setGubunName("미니언즈");
		testlist.setParentCode(2);
		testList.add(testlist);

		testlist = new Pay();
		testlist.setGubunCode(9);
		testlist.setGoodsCode(4);
		testlist.setGoodsName("프린세스 왕관");
		testlist.setGoodsPrice(30000);
		testlist.setQuantity(3);
		testlist.setGubunName("프린세스빌리지");
		testlist.setParentCode(2);
		testList.add(testlist);

		maps.put("itemPay", testList);
		
		/////////////////////////////
		List<Pay> itemPaylist = maps.get("itemPay");

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		int couponCount = 0;
		
		// 이용권인지 기프트샵인지 구분
		if (itemPaylist.get(0).getParentCode() == 1) {

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
			Date date = new Date();
			String curDate = format.format(date);

			Map<String, Object> map = new HashMap<>();
			map.put("usersCode", info.getUsersCode());
			map.put("curDate", curDate);

			// 쿠폰 가져오기
			couponCount = service.couponCount(map);
			if (couponCount >= 4)
				couponCount = 4;

		}
		
		// 할인전 총 금액
		int price = 0;
		for (Pay pay : itemPaylist) {
			price += pay.getGoodsPrice() * pay.getQuantity();
		}

		model.addAttribute("couponCount", couponCount);
		model.addAttribute("price", price);
		model.addAttribute("itemPaylist", itemPaylist);

		return ".four.menu9.pay.list";
	}

	@RequestMapping(value = "/pay/price", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> price(
			@RequestParam(value = "couponCount") int couponCount, 
			@RequestParam(value = "price") int price, 
			@RequestParam(value = "card") String card, 
			HttpSession session)
			throws Exception {

		int payPrice = price;

		// 매직패스만 할인(매직패스 가격 가져와서 곱해주기)
		int dcPrice = couponCount * 10000;
		
		// 이용권일때만 제휴카드 목록 가져와서 card랑 비교해서 할인율만큼 자유이용권 가격 할인

		Map<String, Object> model = new HashMap<>();
		model.put("dcPrice", dcPrice);
		model.put("payPrice", payPrice);

		return model;
	}

	@RequestMapping(value = "/pay/insertPay", method = RequestMethod.POST)
	public String createdSubmit(Pay dto, HttpSession session, Model model) throws Exception {

		// 구분 코드에 따라서 어느 디비 사용할지 변경
		service.insertGift(dto);
		model.addAttribute("dto", dto);

		return "redirect:/card/result";
	}
}
