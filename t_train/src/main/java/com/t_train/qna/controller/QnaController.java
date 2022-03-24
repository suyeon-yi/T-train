package com.t_train.qna.controller;


import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.t_train.member.vo.LoginVO;
import com.t_train.qna.servicer.QnaService;
import com.t_train.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/qna")
@Log4j
public class QnaController {

	@Autowired
	private QnaService service;
	
	//1. list
	@GetMapping("/list.do")
	public String list(@ModelAttribute PageObject pageObject, Model model) throws Exception {
	      if(pageObject.getPage()<1) pageObject.setPage(1);
	      model.addAttribute("list", service.list(pageObject));
		return "qna/list";
	}
	
	//2. view
	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception{
		
		QnaVO vo = service.view(no);
		vo.setContent(vo.getContent().replace("\n", "<br>"));
		model.addAttribute("vo", vo);
		
		return "qna/view";
	}
	
	//3-1. writeForm
	@GetMapping("/write.do")
	public String writeForm() throws Exception{
		
		return "qna/write";
	}
	
	//3-2. write
	@PostMapping("/write.do")
	public String write(QnaVO vo, int perPageNum, RedirectAttributes rttr, HttpSession session) throws Exception {
		
		vo.setId(((LoginVO)session.getAttribute("login")).getId());
		service.write(vo);
		
		rttr.addFlashAttribute("msg", "문의하신 글이 등록되었습니다.");
		
		return "redirect:list.do?page=1&perPageNum=" + perPageNum;
	}
	
	//4-1. updateForm
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception {
		
		model.addAttribute("vo", service.view(no));
		
		return "qna/update";
	}
	
	//4-2. update
	@PostMapping("/update.do")
	public String update(PageObject pageObject, QnaVO vo) throws Exception {
		
		service.update(vo);
		
		return "redirect:view.do?no=" + vo.getNo()
			+ "&page=" +pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum()
			+ "&key=" + pageObject.getKey() + "&word=" + URLEncoder.encode(pageObject.getWord(), "utf-8");
	}
	
	//5. delete
	@GetMapping("/delete.do")
	public String delete(long no, int perPageNum, RedirectAttributes rttr) throws Exception {
		
		service.delete(no);
		rttr.addFlashAttribute("msg", "문의하신 내용이 삭제되었습니다.");
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
	//6-1. answerForm
	@GetMapping("/answer.do")
	public String answerForm(long no, Model model) throws Exception {
		
		model.addAttribute("vo", service.view(no));
		
		return "qna/answer";
	}
	
	//6-2. answer
	@PostMapping("/answer.do")
	public String answer(QnaVO vo, int perPageNum, RedirectAttributes rttr, HttpSession session) throws Exception {
		
		vo.setId(((LoginVO)session.getAttribute("login")).getId());
		service.answer(vo);
		
		log.info("vo : " + vo);
		rttr.addFlashAttribute("msg", "문의하신 내용의 답변이 등록되었습니다.");
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
}
