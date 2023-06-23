package com.itwillbs.project_gabolcar.mapper;

import java.util.List;
import java.util.Map;

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

	//아이디찾기
	String getId(MemberVO member);


	// 회원 정보 눌렀을 때 내 정보 가져와서 띄우기
	MemberVO selectMemberinfo(String mem_id);

	// 회원 정보 수정하기
	int updateMember(@Param("member") MemberVO member, @Param("newPasswd") String newPasswd,
			@Param("newPasswd1") String newPasswd1);

	String getPasswd(MemberVO member);

	// 회원 탈퇴
	int deleteMember(MemberVO member);

	//비번찾기
	String isExistUser(MemberVO member);

	//임시비밀번호 설정
	int changePw(MemberVO member);

	// 대시보드 연령대별 사용자 조회
	List<Map<String, Object>> dsbUserAges();
	
	// 1:1 문의게시판에 회원 DB 값 보내기는 List
	List<MemberVO> selectMemQuestionList();
	
	// 1:1 문의게시판 로그인 상태 이름 넘겨주기
	int getMemIdxByMemName(String mem_name);

<<<<<<< HEAD

	String getMemNameByMemIdx(int mem_idx);
	
	//
=======
	//회원 이름 가져오기
	MemberVO getMemName(String sId);
>>>>>>> origin/main

}