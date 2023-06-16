package com.itwillbs.project_gabolcar.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ResInfoVO {
	private int res_idx; //
	private Timestamp res_time;//예약 일시
	private Timestamp res_rental_date;// 대여 일시 
	private Timestamp res_return_date;//반납 일시
	//총 대여 시간 
	private String brc_rent_name;//대여 장소
	private String brc_return_name;//반납 장소
	private int car_idx;//차량코드
	private String car_insurance;//자동차 보험
	private String lic_num;//면허증 번호
	private int mem_idx;//회원 번호
}
