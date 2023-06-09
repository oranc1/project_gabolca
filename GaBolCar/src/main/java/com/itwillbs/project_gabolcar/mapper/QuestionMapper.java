package com.itwillbs.project_gabolcar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.project_gabolcar.vo.QuestionVO;

@Mapper
public interface QuestionMapper {
	// 1:1 문의 게시판 글 쓰기 작업 요청
	int insertQuestionBoard(QuestionVO question);

	// 1:1 문의 게시판 글 목록 조회 요청
	List<QuestionVO> selectQstBoardList(
			@Param("searchType") String searchType, 
			@Param("searchKeyword") String searchKeyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);
	
	// 1:1 게시판 전체 글 목록 갯수 조회 요청
	int selectQstBoardListCount(
			@Param("searchType") String searchType, 
			@Param("searchKeyword") String searchKeyword);
	
	// 1:1 게시판 글 상세정보 조회
	QuestionVO selectQuestionBoard(int qst_idx);
	
	// 1:1 게시판 조회수 증가
	void updateReadcount(QuestionVO question);
	
	// 작성자 조회
	QuestionVO isBoardWriter(@Param("qst_idx") int qst_idx, @Param("mem_id") String mem_id);
	
	// 글삭제
	int qstDeleteBoard(int qst_idx);

	//  작성자가 맞는 지 확인
	String getMemNameByIdx(int mem_idx);
	
	//  작성자가 맞는 지 확인
	String getMemNameById(String mem_id);
	
	// 답글 등록 전 순서번호 증가
	void updateQstBoardReSeq(QuestionVO question);
	
	//	답글을 달 qst_board_re_ref 값
	int selectCurrentQstBoardQstIdx(int qst_idx);
	
	// 답글 등록
	int insertQstReplyBoard(QuestionVO question);
	
	
	// 글 수정
	int updateQstBoard(QuestionVO question);
	
	// 관리자 작성자 비교 폐기 대상
	Integer getAdminQstReRef(int qst_idx);

	List<QuestionVO> selectRelatedQuestions(int qst_board_re_ref);

	List<QuestionVO> getQstBoardListForMember(
		    @Param("searchType") String searchType, 
		    @Param("searchKeyword") String searchKeyword, 
		    @Param("startRow") int startRow, 
		    @Param("listLimit") int listLimit,
		    @Param("mem_idx") int mem_idx);
	
	
	


}
