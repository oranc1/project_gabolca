package com.itwillbs.project_gabolcar.vo;

import java.util.Date;
import lombok.Data;

@Data
public class NoticeVO {
	private int bo_idx;
	private String bo_title;
	private String bo_content;
	private Date bo_sysdate;
	private int bo_readcount;
}
