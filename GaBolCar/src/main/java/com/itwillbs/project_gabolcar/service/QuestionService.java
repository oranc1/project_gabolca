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
	
	// 글 상세정보 조회 요청
	// => 조회 성공 시 조회수 증가
	public QuestionVO getQuestionBoard(int qst_idx) {
		
		QuestionVO question = mapper.selectQuestionBoard(qst_idx);
		
		if(question != null) {
			mapper.updateReadcount(question);
			
		}
		return question;
	}
	// 작성자 확인
	public boolean isBoardWriter(int qst_idx, String mem_id) {
		
		QuestionVO question = mapper.selectQuestionBoard(qst_idx);
		return mem_id.equals(question.getMem_name());
	}
	// 글 삭제
	public int removeBoard(int qst_idx) {
		return mapper.qstDeleteBoard(qst_idx);
	}
}
