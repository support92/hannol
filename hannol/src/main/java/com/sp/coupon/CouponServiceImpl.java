package com.sp.coupon;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("coupon.couponService")
public class CouponServiceImpl implements CouponService {

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

	@Override
	public Coupon readGiftCoupon(int giftCode) throws Exception {
		Coupon dto = null;
		try {
			dto = dao.selectOne("coupon.readGiftCoupon", giftCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateGiftCoupon(Coupon dto) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("coupon.updateGiftCoupon", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}

	@Override
	public int updateGoodsCount(int goodsCode) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("coupon.updateGoodsCount", goodsCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int goodsCount(int goodsCode) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("coupon.goodsCount", goodsCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}