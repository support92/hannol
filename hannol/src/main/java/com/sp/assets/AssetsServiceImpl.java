package com.sp.assets;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service
public class AssetsServiceImpl implements AssetsService{
	@Autowired
	CommonDAO dao;

	@Override
	public List<Map<String, Object>> listTheme() throws Exception{
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("assets.listTheme");
		} catch (Exception e) {
			throw e;
		}
		return list;
	}
	
	@Override
	public List<Map<String, Object>> searchPayment(long num) throws Exception {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("assets.searchPayment", num);  
		} catch (Exception e) {
			throw e;
		}
		return list;
	}
	
	@Override
	public Map<String, Object> searchPayment2(Map<String, Object> data) throws Exception {
		Map<String, Object> map = null;
		
		try {
			map = dao.selectOne("assets.searchPayment2", data);
		} catch (Exception e) {
			throw e;
		} 
		return map;
	}

	@Override
	public Map<String, Object> searchFacility(Map<String, Object> data) throws Exception {
		Map<String, Object> map = null;
		
		try {
			map = dao.selectOne("assets.searchFacility", data);
		} catch (Exception e) {
			throw e;
		} 
		return map;
	}

	@Override
	public int insertAssetsBook(Assets dto) throws Exception {
		int result = 0;
		
		try {
			result = dao.insertData("assets.insertAssetsBook", dto);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public int searchReservation(Map<String, Object> map) throws Exception {
		int result = 0;
		
		try {
			result = dao.selectOne("assets.searchReservation", map);
		} catch (Exception e) {
			throw e;
		}
		return result;  
	}

	

}
