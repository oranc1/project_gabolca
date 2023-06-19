package com.itwillbs.project_gabolcar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.project_gabolcar.vo.MemberVO;



@Mapper
public interface MemberMapper {

	int idCheck(String id);

	int insertMember(MemberVO member);

	// 로그인(아이디와 패스워드가 일치하는 레코드 조회)
	MemberVO selectCorrectUser(MemberVO member);

	// 로그인(아이디가 일치하는 레코드의 패스워드 조회)
	String selectPasswd(MemberVO member);

	//아이디 찾기 이름, 핸드폰번호가 일치하는 레코드 조회
	MemberVO selectId(MemberVO member);

	

}