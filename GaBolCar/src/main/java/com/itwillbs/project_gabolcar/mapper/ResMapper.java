package com.itwillbs.project_gabolcar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.project_gabolcar.vo.ResInfoVO;

@Mapper
public interface ResMapper {

	int insertResInfo(ResInfoVO resinfo);
	
}
