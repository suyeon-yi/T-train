package com.t_train.member.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.t_train.member.service.MemberService;
import com.t_train.member.vo.LoginVO;
import com.t_train.member.vo.MemberVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {

	@Autowired
	private MemberService service;
	
	
	//로그인 폼
	@GetMapping("/login.do")
	public String loginForm() throws Exception {
		log.info("login 폼으로 이동");
		return "member/login";
	}
	

	//로그인 처리
	@PostMapping("/login.do")
	public String login(LoginVO invo, HttpSession session) throws Exception  {
		
		log.info("로그인 처리 - invo : " + invo);
		
		session.setAttribute("login", service.login(invo));
		
		return "redirect:/main/main.do";
	}
	
	
	//로그아웃 처리
	@GetMapping("/logout.do")
	public String logout(HttpSession session) throws Exception{
		//logout처리 - session의 정보를 지운다.
		session.removeAttribute("login");
		log.info("로그아웃 처리");
		return "redirect:/main/main.do";
	}
	
	//회원 리스트 - 관리자만 가능
	@GetMapping("/list.do")
	//@ModelAttribute 변수 - model에 담긴 변수로 처리 -> jsp까지 전달
	public String list(@ModelAttribute PageObject pageObject, Model model) throws Exception {
		
		model.addAttribute("list", service.list(pageObject));
		
		return "member/list";
	}
	
	//회원 정보 보기 / 내 정보 보기
	@GetMapping("/view.do")
	public String view(String id, Model model, HttpSession session) throws Exception{
		
		if(id == null) {
			//내 정보 보기
			model.addAttribute("title", "내 정보 보기");
			id = ((LoginVO)session.getAttribute("login")).getId();
		}else {
			//회원 관리 - 회원 정보 보기
			model.addAttribute("title", "회원 정보 보기");
		}
		model.addAttribute("vo", service.view(id));
		
		return "member/view";
	}
	
	
	//회원가입 폼
	@GetMapping("/write.do")
	public String writeForm() throws Exception {
		return "member/write";
	}
	
	//회원가입 처리
	@PostMapping("/write.do")
	public String write(MemberVO vo, RedirectAttributes rttr) throws Exception {
		
		//회원 가입 처리
		service.write(vo);
		
		//redirect 하는 페이지에서 한번만 사용되는 속성값을 전달할 수 있다. -> session
		rttr.addFlashAttribute("msg", "성공적으로 회원가입이 되셨습니다. \\n로그인 후 사용하세요.");
		
		return "redirect:/member/login.do";
	}
	
	//아이디 중복 체크
	@GetMapping("/idCheck")
	public String idCheck(String id, Model model) throws Exception{
		
		model.addAttribute("id", service.idCheck(id));
		
		return "member/idCheck";
	}
	
	//정보 수정 폼
	@GetMapping("/update.do")
	public String updateForm(String id, Model model, HttpSession session) throws Exception {
		
		if(id == null) {
	        id = ((LoginVO) session.getAttribute("login")).getId();
	        }
		
		model.addAttribute("vo", service.view(id));
		
		return "member/update";
	}
	
	//정보 수정
	@PostMapping("/update.do")
	public String update(MemberVO vo, RedirectAttributes rttr) throws Exception {
		log.info("vo : " + vo);
		service.update(vo);
		log.info("update.vo : " + vo);
		rttr.addFlashAttribute("msg", "회원 정보가 수정되었습니다.");
		return "redirect:/main/main.do";
	}
	
	//회원 탈퇴
	@GetMapping("/delete.do")
	public String delete(MemberVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {
		log.info("vo : " + vo);
		service.delete(vo);
		session.removeAttribute("login");
		rttr.addFlashAttribute("msg", "회원 탈퇴가 완료되었습니다.");
		
		return "redirect:/main/main.do";
	}
	
	//상태 변경
	@PostMapping("/changeStatus.do")
	public String changeStatus(PageObject pageObject, MemberVO vo) throws Exception {
		
		//DB에서 상태 변경
		service.changeStatus(vo);
		
		return "redirect:view.do?id=" + vo.getId() + "&page=" + pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum();
	}
	
	//등급 변경
	@PostMapping("/changeGradeNo.do")
	public String changeGradeNo(PageObject pageObject, MemberVO vo) throws Exception {
		
		//DB에서 등급 변경
		service.changeGradeNo(vo);
		
		return "redirect:view.do?id=" + vo.getId() + "&page=" + pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum();
	}
}
