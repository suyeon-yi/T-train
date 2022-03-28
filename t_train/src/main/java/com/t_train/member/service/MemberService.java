package com.t_train.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.t_train.member.mapper.MemberMapper;
import com.t_train.member.vo.LoginVO;
import com.t_train.member.vo.MemberVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberService {

	@Inject
	private MemberMapper mapper;
	
	//로그인 처리
	public LoginVO login(LoginVO invo) throws Exception {
		log.info("로그인" + invo);
		return mapper.login(invo);
	}
	
	//회원 리스트
	public List<MemberVO> list(PageObject pageObject) throws Exception {
		//전체 데이터의 갯수를 구해서 pageObject에 넣는다.
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
		
	//회원 정보 보기 / 내 정보 보기
	public MemberVO view(String id) throws Exception {
		return mapper.view(id);
	}
	
	//회원가입
	public int write(MemberVO vo) throws Exception{
		return mapper.write(vo);
	}
	
	//아이디 중복 체크 -> 아이디를 가져옴
	public String idCheck(String id) throws Exception {
		return mapper.idCheck(id);
	}
	
	//정보 수정
	public int update(MemberVO vo) throws Exception {
		log.info("수정 : " + vo);
		return mapper.update(vo);
	}
	
	//회원 탈퇴
	public int delete(MemberVO vo) throws Exception {
		log.info("탈퇴 : " + vo);
		return mapper.delete(vo);
	}
	
	//상태 변경
	public int changeStatus(MemberVO vo) throws Exception {
		return mapper.changeStatus(vo);
	}
	
	//등급 변경
	public int changeGradeNo(MemberVO vo) throws Exception {
		return mapper.changeGradeNo(vo);
	}

	public static int snsLoginCheck(String naverid) {
		// TODO Auto-generated method stub
		return 0;
	}

	public static void snsRegister(String naverid, String name, String gender, String email) {
		// TODO Auto-generated method stub
		
	}

	public MemberVO snsLogin(String naverid) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
