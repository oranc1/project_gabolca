package com.itwillbs.project_gabolcar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.QuestionMapper;
import com.itwillbs.project_gabolcar.vo.QuestionVO;

@Service
public class QuestionService {
	@Autowired
	private QuestionMapper mapper;
	
	// 1:1 게시판 작성
	public int questionBoard(QuestionVO question) {
		return mapper.insertQuestionBoard(question);
	}
}
