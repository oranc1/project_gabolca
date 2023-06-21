package com.itwillbs.project_gabolcar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.project_gabolcar.vo.DriverVO;
import com.itwillbs.project_gabolcar.vo.MemberVO;

@Mapper
public interface PaymentMapper {

	MemberVO selectMemberInfo(String id);

	int insertDriver(DriverVO driver);

}
