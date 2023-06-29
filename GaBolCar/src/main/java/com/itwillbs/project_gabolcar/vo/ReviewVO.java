package com.itwillbs.project_gabolcar.vo;



import java.sql.*;
import java.sql.Timestamp;

import org.springframework.web.multipart.*;

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
	private String rev_date_format;
	private int car_idx;
	private String car_model;
	private String sId;
	private String mem_id;//
	private String session_id;//
	
	// 파일명을 저장할 변수 선언
	private String rev_file1;
	private String rev_file2;
	private String rev_file3;
	// 주의! 폼에서 전달받는 실제 파일 자체를 다룰 MultipartFile 타입 변수 선언도 필요
	// => 이 때, 멤버변수명은 input type="file" 태그의 name 속성명(파라미터명)과 동일해야함
	private MultipartFile file1;
	private MultipartFile file2;
	private MultipartFile file3;
	
	private String trashArr[] = {"미친", "C8", "c8", "욕", "나쁜말"};
}





























