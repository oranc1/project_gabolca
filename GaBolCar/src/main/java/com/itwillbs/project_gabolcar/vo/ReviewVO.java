package com.itwillbs.project_gabolcar.vo;



import java.sql.*;
import java.sql.Timestamp;

import com.google.protobuf.*;

import lombok.Data;



@Data
public class ReviewVO {
	private int rev_idx;
	private int res_idx;
	private String rev_name;
	private String rev_subject;
	private String rev_content;
	private int rev_star;
	private Timestamp rev_date;
	private int car_idx;
	private String car_model;
}





























