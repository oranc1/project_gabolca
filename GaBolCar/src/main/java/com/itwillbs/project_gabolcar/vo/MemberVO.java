package com.itwillbs.project_gabolcar.vo;

import java.sql.Date;


import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
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
private int mem_idx; 

@Email(message = "유효한 이메일 주소를 입력해주세요.") @NotBlank(message = "이메일을 입력해 주세요")
private String mem_id;//null 유효성 이메일

@NotBlank(message = "비밀번호를 입력해주세요.") @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$" ,message = "비밀번호는 영문, 숫자, 특수문자 포함 8~20글자 이상 입력해주세요.")
@Size(min = 8, message = "비밀번호는 최소 8자 이상이어야 합니다.")
private String mem_passwd;

@NotBlank(message = "이름을 입력해주세요.") @Pattern(regexp = "!^[\\uAC00-\\uD7A3]{2,10}$/ || /[\\u314F-\\u3163]",message = "이름을 다시 입력해주세요.")
private String mem_name;
//------------

@NotBlank @Pattern(regexp = "/01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/",message = "유효한 핸드폰 번호를 입력 해 주세요.")
private String mem_mtel;
@Size(max = 3) 
private String phone1;//ㅇ
@Size(max = 4)
private String phone2;//ㅇ
@Size(max = 4)
private String phone3;//ㅇ
//-------------
@NotBlank
private String mem_addr;
@NotBlank(message = "주소를 입력해 주세요")
private String sample6_address;//하고
private String sample6_detailAddress;
private String sample6_extraAddress;
@NotBlank(message = "주소를 입력해 주세요")
private String sample6_postcode;//하고
//---------------
@NotBlank(message = "생년월일을 입력해 주세요") @Past 
private Date mem_birthday;
private	String mem_bir1;
private	String mem_bir2;
private	String mem_bir3;
private Date mem_sign_date; //now()

}