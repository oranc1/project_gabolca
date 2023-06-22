package com.itwillbs.project_gabolcar.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PaymentVO {
	private int pay_idx;
	private int res_idx;
	private int pay_method;
	private int pay_total;
	private String pay_status;
	private Date pay_time;
}
