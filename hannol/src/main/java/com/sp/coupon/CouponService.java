package com.sp.coupon;

import java.util.List;
import java.util.Map;

public interface CouponService {
	public int dataCount(Map<String, Object> map)throws Exception; 
	public List<Coupon> ajaxGiftCouponList(Map<String, Object> map) throws Exception;
	public Coupon readGiftCoupon(int giftCode) throws Exception;
	public int updateGiftCoupon(Coupon dto) throws Exception;
	public int updateGoodsCount(int goodsCode) throws Exception;
	public int goodsCount(int goodsCode) throws Exception;
}
