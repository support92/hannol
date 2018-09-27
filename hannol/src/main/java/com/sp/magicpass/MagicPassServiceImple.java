package com.sp.magicpass;

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
			result = dao.selectOne("masic.checkTicket", usersCode);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

}
