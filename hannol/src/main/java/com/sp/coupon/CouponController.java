package com.sp.coupon;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtilGeneral;
import com.sp.member.SessionInfo;
import com.sp.notice.Notice;

@Controller("coupon.couponcontroller")
public class CouponController {
	@Autowired
	CouponService service;

	@Autowired
	MyUtilGeneral util;

	@RequestMapping(value = "/mypage/rankCouponList")
	public String rankCouponList(HttpSession session, Model model) throws Exception {

		return ".four.menu3.mypage.rankCouponList";
	}

	@RequestMapping(value = "/mypage/couponList")
	public String couponList(@RequestParam(value = "page", defaultValue = "1") String page, Model model)
			throws Exception {

		model.addAttribute("page", page);
		model.addAttribute("thema", 0);

		return ".four.menu3.mypage.couponList";
	}

	@RequestMapping(value = "/mypage/ajaxCouponList")
	public String aJaxListForm(@RequestParam(value = "page", defaultValue = "1") int current_page, int couponType,
			HttpSession session, HttpServletRequest req, Model model) throws Exception {

		int rows = 10;
		int total_page = 0;
		int dataCount = 0;

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Map<String, Object> map = new HashMap<>();
		map.put("usersCode", info.getUsersCode());

		if (couponType == 0) {
			dataCount = service.dataCount(map);
		}

		if (dataCount != 0) {
			total_page = util.pageCount(rows, dataCount);
		}

		if (total_page < current_page) {
			current_page = total_page;
		}

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<Coupon> list = null;
		if (couponType == 0) {
			list = service.ajaxGiftCouponList(map);

			int listNum, n = 0;
			Iterator<Coupon> it = list.iterator();
			while (it.hasNext()) {
				Coupon data = it.next();
				listNum = dataCount - (start + n - 1);
				data.setListNum(listNum);
				n++;
			}
		}

		String paging = util.paging(current_page, total_page);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return "/menu3/mypage/couponList-body";

	}
}
