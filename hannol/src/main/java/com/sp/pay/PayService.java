package com.sp.pay;

import java.util.Map;

public interface PayService {
	public Map<String, Object> list() throws Exception;
	public int couponCount(Map<String, Object> map) throws Exception;
	public int insertGift(Pay dto) throws Exception;
}
