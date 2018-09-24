package com.sp.show;

import java.util.List;
import java.util.Map;

public interface ShowService {
	public List<Show> listShow(Map<String, Object> map) throws Exception;
	public List<String> listShowTime(Map<String, Object> map) throws Exception;
	public Show readShowInfo(Map<String, Object> map) throws Exception;
}
