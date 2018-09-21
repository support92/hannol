package com.sp.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("mypage.mybookService")
public class MybookServiceImpl implements MybookService {
	@Autowired
	CommonDAO dao;

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("book.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Mybook> listMybook(Map<String, Object> map) throws Exception {
		List<Mybook> mybook=null;
		try {
			mybook = dao.selectList("book.listMybook", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mybook;
	}

}
