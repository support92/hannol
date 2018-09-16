package com.sp.pay;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("pay.payService")
public class PayServiceImpl implements PayService {
	@Autowired
	CommonDAO dao;
	
	@Override
	public Map<String, Object> list() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int couponCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("pay.couponCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int insertPay(Pay dto) throws Exception {
		int result = 0;
		try {
			int seq = dao.selectOne("pay.seq");
			dto.setPayCode(seq);
			
			result = dao.insertData("pay.insertPay", dto);
			dao.insertData("pay.insertPayInfo", dto);
			dao.insertData("pay.insertCardInfo", dto);
			
		} catch (Exception e) {
			throw e;
		}
		return result;
	}
	
	@Override
	public int insertGift(Pay dto) throws Exception {
		int result = 0;
		try {
			result = dao.insertData("pay.insertPay", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
