package com.sp.assets;

import java.util.List;
import java.util.Map;

public interface AssetsService {
	public List<Map<String, Object>> listTheme();
	public List<Map<String, Object>> searchPayment(long num);
	public Map<String, Object> searchPayment2(Map<String, Object> map);
	public Map<String, Object> searchFacility(Map<String, Object> map);
	
	public int insertAssetsBook(Assets dto);
}
