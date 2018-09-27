package com.sp.enjoy;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("rides.ridesServiceImple")
public class EnjoyServiceImpl implements EnjoyService{

	@Autowired
	private CommonDAO  dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("enjoy.dataCount");
		} catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public List<Enjoy> listEnjoy(Map<String, Object> map) {
		List<Enjoy> list = null;
		
		try {
			list = dao.selectList("enjoy.listEnjoy", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public List<Enjoy> listEnjoy() {
		List<Enjoy> list = null;
		
		try {
			list = dao.selectList("enjoy.listEnjoy2");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
