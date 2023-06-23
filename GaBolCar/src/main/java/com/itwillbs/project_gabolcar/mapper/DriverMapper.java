package com.itwillbs.project_gabolcar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.project_gabolcar.vo.DriverVO;

@Mapper
public interface DriverMapper {

	DriverVO selectDriver(int res_idx);

}
