package com.itwillbs.project_gabolcar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_gabolcar.vo.PageInfo;
import com.itwillbs.project_gabolcar.vo.ResInfoVO;

@Mapper
public interface ResMapper {

	int insertResInfo(ResInfoVO resinfo);

	//인기 차량 리스트 (desc 는 내림차순 관련 true 면 동작)
	List<Map<String,Object>> selectResPopuler(@RequestParam(required = false) @Param("desc") String desc);
	
	// 대시보드 지점별 월 렌트수
	List<Map<String, Object>> dsbBrcMonthlyCount(List<Map<String, Object>> brcList);

	List<ResInfoVO> selectResInfo(String sId);

	ResInfoVO selectDetail(int res_idx);
	
	// 대시보드 지점별 월 매출액
	List<Map<String, Object>> dsbBrcMonthlySale(List<Map<String, Object>> brcList);
	
	// 예약 목록 조회 (관리자)
	List<ResInfoVO> selectResList(
			@Param("searchType") String searchType, 
			@Param("searchKeyword") String searchKeyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);
	
	// 목록 갯수 조회 요청 (관리자)
	int selectResListCount(
			@Param("searchType") String searchType, 
			@Param("searchKeyword") String searchKeyword);
	
	// 예약 상세 조회 (관리자)
	public ResInfoVO selectResDetail(int res_idx);


	


	
}
