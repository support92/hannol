package com.sp.giftshop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("giftshop.giftShopController")
public class GiftShopController {
	@RequestMapping(value="/giftshop/list")
	public String giftShopList() throws Exception{
		return ".four.menu9.list";
	}

}
