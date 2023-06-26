package com.itwillbs.project_gabolcar.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QuestionVO {
	private int qst_idx;
	private int mem_idx;
	private String mem_name;
	private String qst_pass;
	private String qst_subject;
	private String qst_content;
	private int qst_board_re_ref;
	private int qst_board_re_lev;
	private int qst_board_re_seq;
	private int qst_readcount; 
	private Timestamp qst_date;
	private String qst_type;
	
	private int admin_qst_board_re_ref; // 관리자와 작성자 qst_board_re_ref 비교
}
