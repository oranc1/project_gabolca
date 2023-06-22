package com.itwillbs.project_gabolcar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.QuestionMapper;
import com.itwillbs.project_gabolcar.vo.QuestionVO;

@Service
public class QuestionService {
	@Autowired
	private QuestionMapper mapper;
	
	// 1:1 게시판 글쓰기 작업 요청
	public int questionBoard(QuestionVO question) {
		return mapper.insertQuestionBoard(question);
	}
	// 1:1 게시판 글 목록 조회 요청
	public List<QuestionVO> getQstBoardList(String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.selectQstBoardList(searchType, searchKeyword, startRow, listLimit);
	}
	
	// 1:1 게시판 전체 글 목록 갯수 조회 요청
	public int getQstBoardListCount(String searchType, String searchKeyword) {
		return mapper.selectQstBoardListCount(searchType, searchKeyword);
	}
	
	
	public QuestionVO getQuestionBoard(int qst_idx) {
		// TODO Auto-generated method stub
		return null;
	}
}
