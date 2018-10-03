package com.sp.show;

import java.util.List;
import java.util.Map;

public interface ShowService {
	public List<Show> listShow(Map<String, Object> map) throws Exception;
	public List<String> listShowTime(Map<String, Object> map) throws Exception;
	public Show readShowInfo(Map<String, Object> map) throws Exception;
	public int readSeatCount(int facilityCode) throws Exception;
	public List<Ticket> listTicket(Map<String, Object> map) throws Exception;
	public List<Integer> listSeat(Map<String, Object> map) throws Exception;
	public int readSstartCode(Map<String, Object> map) throws Exception;
	public int insertShowBook(Map<String, Object> map) throws Exception;
	public int readShowBookCode(Map<String, Object> map) throws Exception;
	public int insertShowBookInfo(Map<String, Object> map) throws Exception;
	public int readShowBookCount(Map<String, Object> map) throws Exception;
}
