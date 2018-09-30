package com.sp.enjoy;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("enjoy.enjoyController")
public class EnjoyController {
	
	@Autowired
	private EnjoyService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/enjoy/rides")
	public String list(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception {

		List<Enjoy> list = service.listEnjoy();
		
	    model.addAttribute("listEnjoy", list);
		model.addAttribute("page", current_page);
	    
		System.out.println("**********************list******************************");
		
		return ".four.menu6.rides.list";
	}
	
	@RequestMapping(value="/enjoy/subList")
	public String subList(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		System.out.println("**********************SUBlist 입장******************************");
		String cp = req.getContextPath();
		
		//현재시간 구하기
		//SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		//방법1
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyyMMdd");
		//방법2
		SimpleDateFormat formatter2 = new SimpleDateFormat ("yyyy-MM-dd");
		SimpleDateFormat formatter3 = new SimpleDateFormat ("hh");
		
		//방법1
		LocalDate test = LocalDate.now();
		System.out.println(dateFormat.format(test)+":::::::왓::::");
		
		//방법2_1
		String date = formatter2.format(new Date());
		
		System.out.println(date+":::::::::::::::::::::::::::");
		
		Calendar cal = Calendar.getInstance();
		String yyyymmdd = null;
		String chh = null;
		
		//방법2_2
		yyyymmdd = formatter2.format(cal.getTime());
		chh = formatter3.format(cal.getTime());
		 
		System.out.println("test:::::::"+test);
		System.out.println("formatter2:"+formatter2);
		System.out.println("string:"+yyyymmdd);
		System.out.println("int:"+chh);
		
		int hh = Integer.parseInt(chh);
		/////////////////////////////////////////////////////////////////////////////////
		int rows = 9;
		int total_page;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		  // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;

		map.put("start", start);
		map.put("end", end);
		map.put("yyyymmdd", dateFormat.format(test));
		map.put("hh", hh-1);
		
		/*Enjoy dto = new Enjoy();
        dto.setYyyymmdd(yyyymmdd);
        dto.setHh(hh-1);
        dto.setWaiting(0);
        dto = service.calcul(dto);*/
       
		//List<Enjoy> list1 = service.listEnjoy(map);	
		List<Enjoy> list2 = service.listEnjoy2(map);	
        

		String query = "";
        String articleUrl = cp+"/enjoy/article?page=" + current_page;
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + 
        	             "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(query.length()!=0) {
        	articleUrl = cp+"/enjoy/article?page=" + current_page + "&"+ query;
        }
		
        String paging = myUtil.paging(current_page, total_page);
        
        /*if(dto.getWaiting()==0) {
        	System.out.println("데이터가 없습니다.");
        	String state="집계중";
        	model.addAttribute("state",state);
        	model.addAttribute("list", list1);
        }else {
        	model.addAttribute("list", list2);
        	
        }        */
        model.addAttribute("list", list2);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		System.out.println("**********************SUBlist 퇴장******************************");
	    
		return "/menu6/rides/subList";
	}
}
