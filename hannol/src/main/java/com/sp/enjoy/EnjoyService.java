package com.sp.enjoy;

import java.util.List;
import java.util.Map;

public interface EnjoyService {
	public int dataCount(Map<String, Object> map);
	public List<Enjoy> listEnjoy();
	public List<Enjoy> listEnjoy(Map<String, Object> map);
}
