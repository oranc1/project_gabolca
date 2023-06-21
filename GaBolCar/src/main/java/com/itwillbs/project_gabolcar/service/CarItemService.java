package com.itwillbs.project_gabolcar.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.itwillbs.project_gabolcar.mapper.BrcMapper;
import com.itwillbs.project_gabolcar.mapper.CarMapper;

import com.itwillbs.project_gabolcar.mapper.*;
import com.itwillbs.project_gabolcar.vo.*;



@Service
public class CarItemService {
	@Autowired
	BrcMapper brcMapper;
	
	@Autowired
	CarItemMapper carItemMapper;
	
	@Autowired
	CarMapper carMapper;
	
	@Autowired
	ResMapper resMapper;
	
	// db 에서 지점 찾기
	public List<String> findBrcList(){
		// 변수 초기화
		List<String> brcList = new ArrayList<String>();
		List<Map<String, Object>> brcMapList = null;
		
		brcMapList = brcMapper.selectBrcList();
		if(brcMapList != null) {
			for(Map<String, Object> map : brcMapList) {
				brcList.add(map.get("brc_name").toString());
			} // for 문 끝
		}// if 문 끝
		return brcList;
	} // findBrcList 끝
	
	// ========== 차량 인기 순위 리스트 ============
	public List<Map<String,Object>> getCarPopuler(){
		
		return resMapper.selectResPopuler(null);
	}
	// ========== 차량 인기 순위 리스트(내림차순) ============
	public List<Map<String,Object>> getCarPopuler(String desc){
		
		return resMapper.selectResPopuler(desc);
	}
	//==================================================
	
	// 최대 페이지 등 페이지 관련에쓸 차량 총 댓수
	public int getCarCount() {
		return carMapper.selectCarListCount();
	}
	//==============================================
	
	// ====== 차량 옵션 리스트 ======
	public List<Map<String,Object>> getCarOptionList(String car_idx){
		return carItemMapper.selectCarOptions(car_idx);
	}
	//===============================
	
	
	public List<Integer> getCarIndexList(){
		return carMapper.selectCarIdxList();
	}
	
//==============리뷰 서비스=============================
	/*public List<ReviewVO> getReviewList(int startRow, int listLimit){
	
	
	return carItemMapper.selectReviewList(startRow, listLimit);
}

public int getReviewListCount() {
	// TODO Auto-generated method stub
	return carItemMapper.selectReviewListCount();
}
*/

//car_res_info 안에 작은 리뷰창
public List<ReviewVO> getReviewListSmall(String car_model) {
	return carItemMapper.getReviewListSmall(car_model);
}

// 리뷰게시판 글 목록, 페이지 나눔
public List<ReviewVO> getReviewListPaging(Criteria cri) {
	return carItemMapper.getReviewListPaging(cri);
}

// 리뷰 게시판 총 갯수
public int getTotal() {
	return carItemMapper.getTotal();
}

// 리뷰 글 상세보기
public ReviewVO reviewDetail(ReviewVO review) {
	return carItemMapper.reviewDetail(review);
}

// 리뷰 글 수정
public int modifyReview(ReviewVO review) {
	return carItemMapper.modifyReview(review);
}

// 리뷰 글 삭제
public int deleteReview(ReviewVO review) {
	return carItemMapper.deleteReview(review);
}

// 리뷰 글 삭제 시 글 번호 업데이트
public int updateIdx(ReviewVO review) {
	return carItemMapper.updateIdx(review);
}


// 리뷰 글 작성
public int insertReview(ReviewVO review) {
	// 최대 글번호 선택
	//int maxIdx = carItemMapper.selectMaxIdx();
	//review.setRev_idx(maxIdx);
	return carItemMapper.insertReview(review);
}
	//==========================================================
	
	
	
	
	
	
	
	
	
	
	
	
// ============ 차량 소개 ==================================
	public List<Map<String, Object>> carInfoList() {
		return carItemMapper.selectCarInfoList();
	}

	

	
}


