package com.sp.mypage;

import java.util.List;
import java.util.Map;

import com.sp.magicpass.MagicPass;

public interface MybookService {
	public int dataCount(Map<String, Object> map) throws Exception;

	public List<Mybook> listMybook(Map<String, Object> map) throws Exception;
	public int deleteGuideBook(int bookCode) throws Exception;
	
	//매직패스부분
	public int dataCountMagic(Map<String, Object> map) throws Exception;
	public List<MagicPass> listMymagic(Map<String, Object> map) throws Exception;
	public int deleteMagicPass(Map<String, Object> map) throws Exception;
}
