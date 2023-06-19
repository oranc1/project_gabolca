package com.itwillbs.project_gabolcar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		
	//	회원가입 요청 작업을 위한 registMember()메서드 정의
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
		public MemberVO getId(String mem_name, String mem_mtel) {
			// TODO Auto-generated method stub
			System.out.println("아이디찾기");
			return mapper.selectId(null);
		}

	
}
