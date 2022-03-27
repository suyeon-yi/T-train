package com.t_train.member.mapper;

import java.util.List;

import com.t_train.member.vo.LoginVO;
import com.t_train.member.vo.MemberVO;
import com.webjjang.util.PageObject;

public interface MemberMapper {

			// 1-1. 리스트
			public List<MemberVO> list(PageObject pageObject) throws Exception;
			// 1-2. 전체 데이터 개수
			public long getTotalRow(PageObject pageObject) throws Exception;
			// 2-1. 보기
			public MemberVO view(String id) throws Exception;
			// 3. 회원가입
			public int write(MemberVO vo) throws Exception;
			// 4. 수정
			public int update(MemberVO vo) throws Exception;
			// 5. 탈퇴
			public int delete(MemberVO vo) throws Exception;
			//6. 로그인처리
			public LoginVO login(LoginVO invo) throws Exception;
			//7.아이디 중복 체크
			public String idCheck(String id)throws Exception;
			//8.상태 변경
			public int changeStatus(MemberVO vo)throws Exception;
			//8.등급 변경
			public int changeGradeNo(MemberVO vo)throws Exception;
			//9. 카카오 로그인 저장소
			public void save(MemberVO vo)throws Exception;
			
}
