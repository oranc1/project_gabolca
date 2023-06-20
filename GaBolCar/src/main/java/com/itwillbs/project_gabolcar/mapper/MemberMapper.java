package com.itwillbs.project_gabolcar.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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

	// 회원 정보 눌렀을 때 내 정보 가져와서 띄우기
	MemberVO selectMemberinfo(String mem_id);

	// 회원 정보 수정하기
	int updateMember(@Param("member") MemberVO member, @Param("newPasswd") String newPasswd,
			@Param("newPasswd1") String newPasswd1);

	String getPasswd(MemberVO member);

	// 회원 탈퇴
	int deleteMember(MemberVO member);

}