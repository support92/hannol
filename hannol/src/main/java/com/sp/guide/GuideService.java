package com.sp.guide;

import java.util.List;

public interface GuideService {
	public List<Guide> staffList() throws Exception;
	public String getName(int usersCode) throws Exception;
	public int insertGuide(Guide dto) throws Exception;
	public List<Guide> guideList() throws Exception;
	public Guide readInfo(int schCode) throws Exception;
	public int deleteGuide(int schCode, boolean isBooked) throws Exception;
	public int insertBook(Guide dto) throws Exception;
}
