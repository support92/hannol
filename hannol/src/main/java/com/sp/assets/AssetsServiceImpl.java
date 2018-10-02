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
	public List<Map<String, Object>> listTheme() {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("assets.listTheme");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public List<Map<String, Object>> searchPayment(long num) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("assets.searchPayment", num);  
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public Map<String, Object> searchPayment2(Map<String, Object> data) {
		Map<String, Object> map = null;
		
		try {
			map = dao.selectOne("assets.searchPayment2", data);
		} catch (Exception e) {
			System.out.println(e.toString());
		} 
		return map;
	}

	@Override
	public Map<String, Object> searchFacility(Map<String, Object> data) {
		Map<String, Object> map = null;
		
		try {
			map = dao.selectOne("assets.searchFacility", data);
		} catch (Exception e) {
			System.out.println(e.toString());
		} 
		return map;
	}

	@Override
	public int insertAssetsBook(Assets dto) {
		int result = 0;
		
		try {
			result = dao.insertData("assets.insertAssetsBook", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	

}
