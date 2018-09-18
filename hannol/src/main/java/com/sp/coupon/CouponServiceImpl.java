package com.sp.coupon;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("coupon.couponService")
public class CouponServiceImpl implements CouponService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		
		try {
			result = dao.selectOne("coupon.dataCount", map);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Coupon> ajaxGiftCouponList(Map<String, Object> map) throws Exception {
		List<Coupon> list = null;
		try {
			list = dao.selectList("coupon.ajaxGiftCouponList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

}
