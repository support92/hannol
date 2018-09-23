package com.sp.pay;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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

import com.sp.common.MyUtilGeneral;
import com.sp.member.SessionInfo;

@Controller("pay.payContoller")
public class PayController {
	@Autowired
	PayService service;

	@Autowired
	MyUtilGeneral util;

	@RequestMapping(value = "/pay/list")
	public String payList(PayOrder dto, HttpSession session, Model model) throws Exception {

		if (dto == null)
			return "redirect:/giftshop/list";

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		List<MCoupon> mcouponlist = null;
		int gubunCode = dto.getParentCode().get(0);

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		Date date = new Date();
		String curDate = format.format(date);

		if (gubunCode == 1) { // 이용권이라면

			// 쿠폰 가져오기
			Map<String, Object> map = new HashMap<>();
			map.put("usersCode", info.getUsersCode());
			map.put("curDate", curDate);

			mcouponlist = service.couponCount(map);
		}

		// 할인전 총 금액
		int price = 0;
		for (int i = 0; i < dto.getGoodsPrice().size(); i++) {
			price += dto.getGoodsPrice().get(i) * dto.getQuantity().get(i);
		}

		Pay pay = null;
		List<Pay> list = new ArrayList<>();
		int usableCount = 0;
		for (int i = 0; i < dto.getGubunCode().size(); i++) {
			pay = new Pay();
			pay.setGubunCode(dto.getGubunCode().get(i));
			pay.setGoodsCode(dto.getGoodsCode().get(i));
			pay.setGoodsName(dto.getGoodsName().get(i));
			pay.setGoodsPrice(dto.getGoodsPrice().get(i));
			pay.setQuantity(dto.getQuantity().get(i));
			pay.setGubunName(dto.getGubunName().get(i));
			pay.setParentCode(dto.getParentCode().get(i));

			if(dto.getGubunCode().get(i) == 3 || dto.getGubunCode().get(i)==6)
				usableCount++;
			
			if (dto.getCartCode() != null)
				pay.setCartCode(dto.getCartCode().get(i));

			list.add(pay);
		}

		model.addAttribute("gubunCode", gubunCode);
		model.addAttribute("mcouponlist", mcouponlist);
		model.addAttribute("price", price);
		model.addAttribute("payPrice", price);
		model.addAttribute("dcPrice", 0);
		model.addAttribute("dto", list);
		model.addAttribute("curDate", curDate);
		model.addAttribute("usableCount", usableCount);

		return ".four.menu9.pay.list";
	}

	@RequestMapping(value = "/pay/price", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> price(
			@RequestParam(value = "couponPrice") String couponPrice,
			@RequestParam(value = "dcTicketPay") int dcTicketPay,
			@RequestParam(value = "price") String price, 
			@RequestParam(value = "card") String cardCo, 
			HttpSession session)
			throws Exception {
		
		couponPrice = couponPrice.replaceAll(",", "");
		couponPrice = couponPrice.replaceAll("원", "");
		price = price.replaceAll(",", "");
		price = price.replaceAll("원", "");
		// 지불할 금액
		int payPrice = Integer.parseInt(price);

		// 매직패스쿠폰 할인가격
		int dcPrice = 0; 
		dcPrice += Integer.parseInt(couponPrice);

		// 이용권일때만 제휴카드 목록 가져와서 card랑 비교해서 할인율만큼 자유이용권 가격 할인
		if(cardCo != null && cardCo.length() > 0) {
			int discount = service.isCard(cardCo+"%");
			double discountd = (double)discount/(double)100;
			
			if(discount > 0) {
				dcPrice = (int) (dcPrice + dcTicketPay * discountd);
			}
		}
		
		payPrice = payPrice - dcPrice;

		DecimalFormat df = new DecimalFormat("#,###원");
		
		Map<String, Object> model = new HashMap<>();
		model.put("dcPrice", df.format(dcPrice));
		model.put("payPrice", df.format(payPrice));

		return model;
	}

	@RequestMapping(value = "/pay/insertPay", method = RequestMethod.POST)
	public String createdSubmit(Pay dto, HttpSession session, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		dto.setUsersCode(info.getUsersCode());

		// 할인쿠폰을 사용했으면 dto.setPayWay("신용카드+할인쿠폰");
		dto.setPayWay("신용카드");

		// 카드번호
		String cardNum2 = dto.getCardNum2();
		cardNum2 = cardNum2.substring(0, 2) + "**";
		String cardNum = dto.getCardNum1() + "-" + cardNum2 + "-****-" + dto.getCardNum4();
		dto.setCardNum(cardNum);
		dto.setState("승인완료");

		if (dto.getPaySection() == null || dto.getPaySection().length() == 0)
			dto.setPaySection("일시불");

		// 1년후
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.YEAR, +1);
		Date currentTime = cal.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		String endDate = formatter.format(currentTime);

		dto.setPlist2(dto.getPlist());
		// 발급할 기프트콘 개수
		int n = 0;
		List<Pay> plist = new ArrayList<>();
		for (int i = 0; i < dto.getPlist().size(); i++) {
			for (int j = 0; j < dto.getPlist().get(i).getQuantity(); j++) {
				plist.add(dto.getPlist().get(i));
				plist.get(n).setEndDate(endDate);
				n++;
			}
		}
		dto.setPlist(plist);

		int result = service.insertPay(dto);
		if (result != 1)
			return "redirect:/giftshop/list";
		// 구분 코드에 따라서 어느 디비 사용할지 변경
		/*
		 * service.insertGift(dto); model.addAttribute("dto", dto);
		 */

		return "redirect:/pay/result?payCode=" + dto.getPayCode();
	}

	@RequestMapping(value = "/pay/result")
	public String result(@RequestParam(value = "payCode") int payCode, Model model) throws Exception {
		Pay dto = service.readResult(payCode);

		model.addAttribute("dto", dto);

		return ".four.menu9.pay.result";
	}

	// 구매내역
	@RequestMapping(value = "/mypage/paylist")
	public String paylist(HttpServletRequest req, @RequestParam(value = "page", defaultValue = "1") int current_page,
			String year, HttpSession session, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Map<String, Object> map = new HashMap<>();
		map.put("usersCode", info.getUsersCode());

		int rows = 3;
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;

		map.put("start", start);
		map.put("end", end);

		SimpleDateFormat format = new SimpleDateFormat("yyyy", Locale.KOREA);
		Date date = new Date();
		String curDate = format.format(date); // select용
		
		format = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		date = new Date();
		String endDate = format.format(date);
		map.put("endDate", endDate);

		if (year == null) {
			year = curDate;
		}
		map.put("year", year + "%");
		
		int dataCount = service.dataCount(map);
		int total_page = util.pageCount(rows, dataCount);

		List<Integer> uselist = service.useDate(map);

		List<Paylist> list = service.paylist(map);
		if (list != null && list.size() > 0) {
			int count = list.get(list.size() - 1).getRnum();
			int rowspan = 1;
			for (int j = 1; j <= count; j++) {
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getRnum() == j)
						rowspan++;
				}
				for (int i = 0; i < list.size(); i++) {
					list.get(i).setRowspan(rowspan);
				}
			}
			
			
			String cp = req.getContextPath();
			String list_url = cp + "/mypage/list";

			String paging = util.paging(current_page, total_page, list_url);
			String lastPayDate = list.get(0).getPayDate();

			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("lastPayDate", lastPayDate);
			model.addAttribute("uselist", uselist);
			model.addAttribute("count", count);
		}
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("curDate", curDate);
		model.addAttribute("year", year);

		return ".four.menu3.mypage.paylist";
	}
	
	@RequestMapping(value = "/mypage/refundPay")
	public String paylist(int payCode) throws Exception {
		
		service.deleteRefund(payCode);
		
		return "redirect:/mypage/paylist";
	}

}
