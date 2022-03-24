package com.t_train.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main")
@Log4j
public class MainController {

	// 자동 DI 적용
//	@Autowired
//	@Qualifier("noticeService")
//	private NoticeService noticeService;
//	@Autowired
//	@Qualifier("qnaService")
//	private QnaService qnaService;
//	@Autowired
//	@Qualifier("memberService")
//	private MemberService memberService;
	
	@GetMapping("/main.do")
	public String main(Model model) throws Exception {
		log.info("main페이지");
		return "main/main";
	}
	
}
