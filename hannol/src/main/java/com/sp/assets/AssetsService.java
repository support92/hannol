package com.sp.assets;

import java.util.List;
import java.util.Map;

public interface AssetsService {
	public List<Map<String, Object>> listTheme() throws Exception;
	public List<Map<String, Object>> searchPayment(long num) throws Exception;
	public Map<String, Object> searchPayment2(Map<String, Object> map) throws Exception;
	public Map<String, Object> searchFacility(Map<String, Object> map) throws Exception;
	
	public int insertAssetsBook(Assets dto) throws Exception;
	
	public int searchReservation(Map<String, Object> map) throws Exception;
}
