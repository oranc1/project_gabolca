package com.itwillbs.project_gabolcar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_gabolcar.mapper.MemberMapper;
import com.itwillbs.project_gabolcar.vo.MemberVO;

import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;



@Service
public class MemberService{
	@Autowired
	private MemberMapper mapper;

		//아이디 중복체크 mapper 접근
		public int idCheck(String id) {
			int cnt = mapper.idCheck(id);
			System.out.println("cnt: " + cnt);
			return cnt;
		}
		
		//회원가입 요청 작업을 위한 registMember()메서드 정의
		public int registMember(MemberVO member) {
			System.out.println("MemberService-registMember()");
			return mapper.insertMember(member);
		}

		// 로그인 정보 조회(아이디와 패스워드가 일치하는 레코드 조회)
		public MemberVO selectCorrectUser(MemberVO member) {
			System.out.println("서비스-selectCorrectUser()");
			return mapper.selectCorrectUser(member);
		}


		// 로그인 정보 조회(아이디가 일치하는 레코드의 패스워드 조회
		public String getPasswd(MemberVO member) {
			// TODO Auto-generated method stub
			return mapper.selectPasswd(member);
		}
		
		//아이디 찾기
		public String getId(MemberVO member) {
			System.out.println("아디찾기");
			return mapper.getId(member);
		}
		

		//회원 정보 띄우기
		public MemberVO getMemberInfo(String id) {
			
			return mapper.selectMemberinfo(id);
		}
		
		//회원 정보 수정하기
		public int ModifyMember(MemberVO member, String newPasswd, @RequestParam String newPasswd1) {
			return mapper.updateMember(member,newPasswd, newPasswd1);
			
		}
		
		//회원 탈퇴
		public int removeMember(MemberVO member) {
			
			return mapper.deleteMember(member);
		}
		
		//일치하는 회원 레코드 있는지 확인(비밀번호 찾기 과정 1)
		public String isExistUser(MemberVO member) {
			// TODO Auto-generated method stub
			return mapper.isExistUser(member);
		}

		public int changePw(MemberVO member) {
			// TODO Auto-generated method stub
			return mapper.changePw(member);
		}

		public List<Map<String, Object>> dsbUserAges() {
			return mapper.dsbUserAges();
		}
		
		
		//-----------------------------------------------------------
		
		// 1:1 문의 게시판 DB 값 넘겨주기
		public List<MemberVO> memQuestionList() {
			return mapper.selectMemQuestionList();
		}

		// 1:1 문의게시판 로그인 상태 이름 넘겨주기
		public int getCurrentUserMemIdx(String mem_name) {
		    return mapper.getMemIdxByMemName(mem_name);
		}
		
		// 1:1 문의게시판 로그인 상태 idx 넘겨주기
		public String getMemNameByIdx(int mem_idx) {
			// TODO Auto-generated method stub
			return mapper.getMemNameByMemIdx(mem_idx);
		}
		
	
		


}
