package com.itwillbs.project_gabolcar.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		/*//  리뷰게시판 글 목록, 페이지 나눔
		List<ReviewVO> getReviewListPaging(@Param("searchType") String searchType, 
				@Param("searchKeyword") String searchKeyword, Criteria cri);

		// 리뷰게시판 총 갯수
		int getTotal(@Param("searchType") String searchType, 
				@Param("searchKeyword") String searchKeyword);
		*/
		
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


		// 글 상세정보 조회
		int selectBoard(String sId);

		
		// 글 상세보기
		ReviewVO reviewDetail(ReviewVO review);

		// 글 수정
		int modifyReview(ReviewVO review);

		// 글 삭제
		int deleteReview(ReviewVO review);

		// 글 삭제 시 글 번호 업데이트
		int updateIdx(ReviewVO review);
		
		//=========================================================================================
		
	//========== 0627 경인 추가 ===========
	
	// 리뷰 게시판 - 멤버의 이름으로 검색하여
	// 최신 예약건과 차량이름, 모델, 년도 들고오기
	Map<String,Object> selectResNCarInfo(@Param("sId") @RequestParam(required = false) String sId,@Param("resIdx") int resIdx );
	
	/*
	 * 리뷰 게시판 - 현재 리뷰를 작성할 예약 번호로
		리뷰가 이미 작성이 되어 있는지 확인하기 
	 */
	int selectIsAlreadyWriteRev(int resIdx);
	
	
	
	// 차량 소개 - 차량정보
	List<Map<String, Object>> selectCarInfoList(Map<String, Object> map);
	
	// 차량 소개 - 차량에 등록된 옵션
	List<Map<String, Object>> selectCarOptionListInfo(int carIdx);

	
	// =============== 0626 경인 추가 ================
	// main에 리뷰 항목들 추가
	List<Map<String,Object>> getReviewListMain();


}
