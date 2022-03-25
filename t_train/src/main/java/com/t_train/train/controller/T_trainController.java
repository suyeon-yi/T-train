package com.t_train.train.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.t_train.train.service.TrainService;

@Controller
public class T_trainController {

	private String key = "Jxwqcdkk560ifanyQyzs7RdyYjABCow9oOnsYt%2FaIgqOOdfpS615bY%2B4AvnnC5l7qtPQERSgw30wZtL6%2FP%2Fm%2BA%3D%3D";
	@Autowired 
	private TrainService service;
	
	@GetMapping("/train/write.do")
	public String searchForm() throws Exception {
		
		return "train/write";
	}
	
	@PostMapping("/train/write.do")
	public String search() throws Exception {
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/train/list.do")
	public String data(HttpSession session) throws Exception {
		session.setAttribute("category", "da");
		
		return "train/list";
	}
	
	//기차 시간표 조회 요청
	@ResponseBody
	@RequestMapping(value="/train/timetable", produces = "applications/json; charset=utf-8")
	public String timetable_list(int pageNo) throws Exception {
		StringBuilder url = new StringBuilder("http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo");
		url.append("?servicekey=" + key);
		url.append("&_type=json");
		url.append("&pageNo=" + pageNo);
		
		return service.json_list(url);
		
	}
}
