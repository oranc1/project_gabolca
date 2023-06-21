package com.itwillbs.project_gabolcar.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.project_gabolcar.vo.*;

@Mapper
public interface CarItemMapper {
	
	// =========================
	//차량 옵션 리스트 받아오기
	List<Map<String,Object>> selectCarOptions(String car_idx);
	//=======================
	
	//리뷰 관련 Mapper========================================================================
	//리뷰게시판 목록조회
	//List<ReviewVO> selectReviewList(int startRow, int listLimit);
	
	//List<ReviewVO> selectReviewList(int startRow, int listLimit);
	//리뷰게시판 목록 수 참고위한 카운터
	//int selectReviewListCount();
	//리뷰게시판 메퍼 종료
	
	//car_res_info 작은 리뷰창	
	List<ReviewVO> getReviewListSmall(String car_model);
	
	// 최대 글번호 선택
	int selectMaxIdx();

	// 글 작성
	int insertReview(ReviewVO review);
	
	//  리뷰게시판 글 목록, 페이지 나눔
	List<ReviewVO> getReviewListPaging(Criteria cri);

	// 리뷰게시판 총 갯수
	int getTotal();
	
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
