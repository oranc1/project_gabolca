package com.itwillbs.project_gabolcar.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.project_gabolcar.vo.CarVO;
import com.itwillbs.project_gabolcar.vo.DriverVO;
import com.itwillbs.project_gabolcar.vo.MemberVO;
import com.itwillbs.project_gabolcar.vo.PaymentVO;
import com.itwillbs.project_gabolcar.vo.ResInfoVO;

@Mapper
public interface PaymentMapper {

	MemberVO selectMemberInfo(String id);

	int insertDriver(DriverVO driver);

	int insertResInfo(ResInfoVO res);

	Integer getIdx(String id);

	CarVO getCarName(String string);

	int getResIdx();

	int insertPayment(@Param("payment") PaymentVO payment, @Param("res_idx") int res_idx);

	ResInfoVO selectResInfo(int res_idx);

	CarVO selectCarName(int res_idx);

	PaymentVO selectPayInfo(int res_idx);
}
