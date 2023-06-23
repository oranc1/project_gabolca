package com.itwillbs.project_gabolcar.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.itwillbs.project_gabolcar.vo.*;

@Mapper
public interface CarItemMapper {
	
	// =========================
	//차량 옵션 리스트 받아오기
	List<Map<String,Object>> selectCarOptions(String car_idx);
	//=======================
	
	//리뷰 관련 Mapper========================================================================
	
	//car_res_info 작은 리뷰창	
	List<ReviewVO> getReviewListSmall(String car_model);
	
	// 최대 글번호 선택
	int selectMaxIdx();

	// 글 작성
	int insertReview(ReviewVO review);
	
	// 글 목록 조회
	// => 복수개의 파라미터 구분을 위해 @Param 어노테이션 사용
	List<ReviewVO> getReviewListPaging(
			@Param("searchType") String searchType, 
			@Param("searchKeyword") String searchKeyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	// 전체 글 목록 갯수 조회
	int getTotal(
			@Param("searchType") String searchType, 
			@Param("searchKeyword") String searchKeyword);
	
	// 글 상세보기
	ReviewVO reviewDetail(ReviewVO review);

	// 글 수정
	int modifyReview(ReviewVO review);

	// 글 삭제
	int deleteReview(ReviewVO review);

	// 글 삭제 시 글 번호 업데이트
	int updateIdx(ReviewVO review);
	
	//=========================================================================================
	
	//=========================================================================================
	
	
	
	
	
	
	
	// 차량 소개 Mapper
	List<Map<String, Object>> selectCarInfoList();

	
	


}
