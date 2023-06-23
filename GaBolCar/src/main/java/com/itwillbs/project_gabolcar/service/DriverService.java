package com.itwillbs.project_gabolcar.service;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.DriverMapper;
import com.itwillbs.project_gabolcar.vo.DriverVO;

@Service
public class DriverService {
@Autowired  DriverMapper mapper;
   
	
public DriverVO driverInfo(int res_idx) {
	
	
	return mapper.selectDriver(res_idx);
}

}
