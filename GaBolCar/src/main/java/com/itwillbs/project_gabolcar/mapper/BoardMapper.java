package com.itwillbs.project_gabolcar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.project_gabolcar.vo.Criteria;
import com.itwillbs.project_gabolcar.vo.NoticeVO;

@Mapper
public interface BoardMapper {
	// 최대 글번호 선택
	int selectMaxIdx();

	// 글 작성
	int insertNotice(NoticeVO notice);

	// 공지사항 목록(페이징 적용)
	List<NoticeVO> getNoticeListPaging(@Param("cri") Criteria cri, @Param("searchType") String searchType, @Param("searchKeyword") String searchKeyword);

	// 게시판 총 갯수
	int getTotal();

	// 글 상세보기
	NoticeVO noticeDetail(NoticeVO notice);

	// 조회수 업데이트
	int updateReadcount(NoticeVO notice);

	// 글 수정
	int modifyBoard(NoticeVO notice);

	// 글 삭제
	int deleteNotice(NoticeVO notice);

	// 글 삭제 시 글 번호 업데이트
	int updateIdx(NoticeVO notice);
}
