package com.sp.magicpass;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("magicpass.magicPassService")
public class MagicPassServiceImple implements MagicPassService {

	@Autowired
	private CommonDAO dao;

	@Override
	public int checkTicket(long usersCode) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("magic.checkTicket", usersCode);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public List<MagicPass> listRides(Map<String, Object> map) throws Exception {
		List<MagicPass> list = null;
		try {
			list = dao.selectList("magic.listRides", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("magic.dataCount", map);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

}
