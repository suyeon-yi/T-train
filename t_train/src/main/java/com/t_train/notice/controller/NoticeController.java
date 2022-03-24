package com.t_train.notice.controller;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.t_train.notice.service.NoticeService;
import com.t_train.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;



@Controller
@RequestMapping("/notice")
//log 객체를 자동으로 만들어 준다.
@Log4j
public class NoticeController {
	
	//private static final Logger log = LoggerFactory.getLogger(NoticeController.class);

	//의존성 자동 주입 (dependency inject) ->자동으로 하도록 지정하는 어노테이션 " @Autowired, @Inject
		@Autowired
		private NoticeService service;
		
		// 1. list
		//처리 결과를 request에 담아야 하는데 Spring 에서는 request가 model에 존재한다.
		//model에 넣어주면 request에 담기도록 프로그램 되어 있다. 파라메터로 모델 객체를 전달 받아서 사용한다.
		//현재 공지 : pre, 지난 공지 : old, 예약 공지 : res, 전체 공지 : all
		@GetMapping("/list.do")
		 public String list(@ModelAttribute PageObject pageObject, Model model) throws Exception{
		      if(pageObject.getPage()<1) pageObject.setPage(1);
		      //콘솔에 출력
		      System.out.println("NoticeController.list().pageObject - " + pageObject);
		      //로그 정보 출력
		      log.info("log info 출력 - pageObject : " + pageObject);
		      //로그 경고 출력
		      //log.warn("log warn 출력 - pageObject : " + pageObject);
		      //로그 오류 출력
		      //log.error("log error 출력 - pageObject : " + pageObject);
		      model.addAttribute("list", service.list(pageObject));
		      // /WEB-INF/views/ + board/list + .jsp → servlet-context.xml에 설정
		      return "notice/list";

		}
	
		// 2. view
		//처리 결과를 request에 담아야 하는데 Spring 에서는 request가 model에 존재한다.
		//model에 넣어주면 request에 담기도록 프로그램 되어 있다. 파라메터로 모델 객체를 전달 받아서 사용한다,
		@GetMapping("/view.do")
		public String view(long no, Model model) throws Exception {
			System.out.println("NoticeController.view().no, inc -" + no );
			
			// 글 내용 중에서 줄바꿈 처리 해야만 한다. \n -> <br>로 바꾼다.
			NoticeVO vo = service.view(no);
			vo.setContent(vo.getContent().replace("\n", "<br>"));
			model.addAttribute("vo", vo);
			return "notice/view";
		}
		
		// 3-1. writeForm
		@GetMapping("/write.do")
		public String writeForm() throws Exception {
			System.out.println("NoticeController.writeForm()");
			return "notice/write";
		}
		
		// 3-2. write
		@PostMapping("/write.do")
		public String write(NoticeVO vo, int perPageNum, RedirectAttributes rttr) throws Exception {
			System.out.println("NoticeController.write().vo - " + vo);
			service.write(vo);
			//redirect 하는 페이지에서 한번만 사용되는 속성값을 전달할 수 있다. -> session
			rttr.addFlashAttribute("msg", "성공적으로 공지사항이 등록 되었습니다.");
			return "redirect:list.do?page=1&perPageNum=" + perPageNum;
		}
		
		// 4-1. updateForm
		@GetMapping("/update.do")
		public String updateForm(long no, Model model) throws Exception {
			System.out.println("NoticeController.updateForm().no - " + no);
			
			model.addAttribute("vo", service.view(no));
			
			return "notice/update";
		}
		
		// 4-2. update
		@PostMapping("/update.do")
		public String update(PageObject pageObject, NoticeVO vo, RedirectAttributes rttr) throws Exception {
			System.out.println("NoticeController.update().vo - " + vo);
			service.update(vo);
			//redirect 하는 페이지에서 한번만 사용되는 속성값을 전달할 수 있다. -> session
			rttr.addFlashAttribute("msg", "성공적으로 공지사항이 수정 되었습니다.");
			return "redirect:view.do?no=" + vo.getNo()
				+ "&page=" +pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum()
				//자바 부분의 한글 코드와 운영 한글 코드가 다르므로 자바에서 꺼내서 넣으면 깨진다. 엔코딩을 해야한다.
				+ "&key=" +pageObject.getKey() + "&word=" + URLEncoder.encode(pageObject.getWord(), "UTF-8") ;
		}
		
		// 5. delete
		@GetMapping("/delete.do")
		public String delete(long no, int perPageNum, RedirectAttributes rttr) throws Exception {
			System.out.println("NoticeController.delete().no - " + no);
			service.delete(no);
			//redirect 하는 페이지에서 한번만 사용되는 속성값을 전달할 수 있다. -> session
			rttr.addFlashAttribute("msg", "성공적으로 글삭제가 되었습니다.");
			
			return "redirect:list.do?perPageNum=" + perPageNum;
		}
}
