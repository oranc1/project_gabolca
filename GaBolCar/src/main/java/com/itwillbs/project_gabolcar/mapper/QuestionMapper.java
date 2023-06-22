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

}
