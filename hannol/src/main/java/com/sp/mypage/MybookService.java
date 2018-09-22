package com.sp.mypage;

import java.util.List;
import java.util.Map;

public interface MybookService {
	public int dataCount(Map<String, Object> map) throws Exception;

	public List<Mybook> listMybook(Map<String, Object> map) throws Exception;
	public int deleteGuideBook(int bookCode) throws Exception;
}
