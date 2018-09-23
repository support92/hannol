package com.sp.show;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("show.service")
public class ShowServiceimpl implements ShowService {
	
	@Autowired
	CommonDAO dao;

	@Override
	public List<Show> listShow(Map<String, Object> map) throws Exception {
		List<Show> list = null;
		try {
			list = dao.selectList("show.listShow", map);
			Map<String, Object> pMap = new HashMap<>();
			pMap.put("screenDate", map.get("screenDate"));
			for(Show s : list) {
				pMap.put("showInfoCode", s.getShowInfoCode());
				s.setShowTime(listShowTime(pMap));
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<String> listShowTime(Map<String, Object> map) throws Exception {
		List<String> showTimeList = null;
		try {
			showTimeList = dao.selectList("show.listShowTime", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return showTimeList;
	}
	
}
