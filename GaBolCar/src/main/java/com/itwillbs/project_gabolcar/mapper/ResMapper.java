package com.itwillbs.project_gabolcar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_gabolcar.vo.ResInfoVO;

@Mapper
public interface ResMapper {

	int insertResInfo(ResInfoVO resinfo);

	//인기 차량 리스트 (desc 는 내림차순 관련 true 면 동작)
	List<Map<String,Object>> selectResPopuler(@RequestParam(required = false) @Param("desc") String desc);
	
}
