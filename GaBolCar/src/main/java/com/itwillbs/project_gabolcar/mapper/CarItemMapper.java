package com.itwillbs.project_gabolcar.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.project_gabolcar.vo.*;

@Mapper
public interface CarItemMapper {
	//리뷰 관련 Mapper
	//리뷰게시판 목록조회
	List<ReviewVO> selectReviewList();
	//리뷰게시판 목록 수 참고위한 카운터
	int selectReviewListCount();
	//리뷰게시판 메퍼 종료
	
	
	// 차량 소개 Mapper
	List<Map<String, Object>> selectCarInfoList();


}
