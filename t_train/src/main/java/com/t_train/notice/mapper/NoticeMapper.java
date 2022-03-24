package com.t_train.notice.mapper;

import java.util.List;

import com.t_train.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

public interface NoticeMapper {

	public List<NoticeVO> list(PageObject pageObject) throws Exception;
	// 1-2. 전체 데이터 개수
	public long getTotalRow(PageObject pageObject) throws Exception;
	// 2-1. 보기
	public NoticeVO view(long no) throws Exception;
	// 3. 글쓰기
	public int write(NoticeVO vo) throws Exception;
	// 4. 수정
	public int update(NoticeVO vo) throws Exception;
	// 5. 삭제
	public int delete(long no) throws Exception;
	
}
