package com.sp.pay;

import java.util.Map;

public interface PayService {
	public int couponCount(Map<String, Object> map) throws Exception;
	public int insertGift(Pay dto) throws Exception;
}
