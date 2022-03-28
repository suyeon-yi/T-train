package com.t_train.train.controller;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.t_train.train.service.TrainService;
import com.t_train.train.vo.TrainVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/train")
@Log4j
public class TrainController {
	
	@Autowired
	private TrainService service;
	
	//1. list
	@GetMapping("/list.do")
	public String list(@ModelAttribute PageObject pageObject, Model model) throws Exception {
		if(pageObject.getPage()<1) pageObject.setPage(1);
		log.info("TrainController.list().pageObject : " + pageObject);
		model.addAttribute("list", service.list(pageObject));
		return "train/list";
	}
	
	//2. view
	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception {
		log.info("TrainController.view().no : " + no);
		TrainVO vo = service.view(no);
		model.addAttribute("vo", vo);
		return "train/view";
	}
	
	//3-1. writeForm
	@GetMapping("/write.do")
	public String writeForm() throws Exception {
		log.info("TrainController.writeForm()");
		return "train/write";
	}
	
	//3-2. write
	@PostMapping("/write.do")
	public String write(TrainVO vo, int perPageNum, RedirectAttributes rttr) throws Exception {
		log.info("TrainController.write().vo : " +vo);
		service.write(vo);
		rttr.addFlashAttribute("msg", "시간표 등록이 완료되었습니다.");
		return "redirect:list.do?page=1&perPageNum=" + perPageNum;
	}
	
	//4-1. updateForm
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception {
		log.info("TrainController.updateForm().no : " +no);
		model.addAttribute("vo", service.view(no));
		return "train/update";
	}
	
	//4-2. update
	@PostMapping("/update.do")
	public String update(PageObject pageObject, TrainVO vo, RedirectAttributes rttr) throws Exception {
		log.info("TrainController.update().vo : " +vo);
		service.update(vo);
		rttr.addFlashAttribute("msg", "시간표 수정이 완료되었습니다.");
		return "redirect:view.do?no=" + vo.getNo()
		+ "&page=" +pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum()
		//자바 부분의 한글 코드와 운영 한글 코드가 다르므로 자바에서 꺼내서 넣으면 깨진다. 엔코딩을 해야한다.
		+ "&key=" +pageObject.getKey() + "&word=" + URLEncoder.encode(pageObject.getWord(), "UTF-8") ;
	}

	//5. delete
	@GetMapping("/delete.do")
	public String delete(long no, int perPageNum, RedirectAttributes rttr) throws Exception {
		log.info("TrainController.delete().no : " +no);
		service.delete(no);
		rttr.addFlashAttribute("msg", "시간표가 삭제되었습니다.");
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
}
