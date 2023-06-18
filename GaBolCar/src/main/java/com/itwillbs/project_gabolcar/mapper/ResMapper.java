package com.itwillbs.project_gabolcar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.project_gabolcar.vo.ResInfoVO;

@Mapper
public interface ResMapper {

	int insertResInfo(ResInfoVO resinfo);
	List<Map<String,Object>> selectResPopuler();
	
}
