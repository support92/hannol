package com.sp.coupon;

import java.util.List;
import java.util.Map;

public interface CouponService {
	public int dataCount(Map<String, Object> map)throws Exception; 
	public List<Coupon> ajaxGiftCouponList(Map<String, Object> map) throws Exception;
}
