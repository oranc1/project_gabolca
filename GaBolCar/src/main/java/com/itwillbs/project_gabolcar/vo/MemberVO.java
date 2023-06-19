package com.itwillbs.project_gabolcar.vo;

import java.sql.Date;

import lombok.Data;

/*mem_info 컬럼들
mem_idx
mem_id
mem_passwd
mem_name
mem_mtel
mem_addr
mem_birthday
mem_sign_date

*/

@Data
public class MemberVO {
private int mem_idx; //null
private String mem_id;
private String mem_passwd;
private String mem_name;
//------------
private String mem_mtel;
private String phone1;
private String phone2;
private String phone3;
//-------------
private String mem_addr;
private String sample6_address;
private String sample6_detailAddress;
private String sample6_extraAddress;
//---------------
private Date mem_birthday;
private Date mem_sign_date; //now()

}