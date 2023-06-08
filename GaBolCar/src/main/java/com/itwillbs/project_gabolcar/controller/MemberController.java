package com.itwillbs.project_gabolcar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

	// =============== 멤버 페이지, 멤버 정보 관련 ================
	//회원 정보 수정
	@GetMapping("member/infoUpdate")
	public String member() {
		return "html/member/mem_page/mem_info_update";
	}

	// 멤버) 차량 예약 조회
	@GetMapping("member/resInq")
	public String resInq() {
		return "html/member/mem_page/mem_res_inq";
	}

	//예약 상세 정보
	@GetMapping("member/resDetail")
	public String resDetail() {
		return "html/member/mem_page/mem_res_detail";
	}

	// 회원 탈퇴
	@GetMapping("member/memberOut")
	public String memberOut() {
		return "html/member/mem_page/mem_member_out";
	}
	
	
	// =============== 로그인 회원가입 관련 ================
	//로그인 페이지
	@GetMapping("login")
	public String login() {
		return "html/member/login/login";
	}
	
	// 아이디 비밀번호 찾기
	@GetMapping("memberFind")
	public String memberFind() {
		return "html/member/login/find";
	}
	
	//회원가입
	@GetMapping("signup")
	public String signup() {
		return "html/member/login/signup";
	}
	
	// =============== 공지사항 ================
	

	// 공지사항 게시판
	@GetMapping("notice")
	public String notice() {
		return "html/member/notice/notice";
	}
	
	// 공지사항 글 자세히 보기
	@GetMapping("notice/detail")
	public String noticeDetail() {
		return "html/member/notice/notice_detail";
	}
	
	// 공지사항 쓰기
	@GetMapping("notice/write")
	public String noticeBoard() {
		return "html/member/notice/notice_write_form";
	}

	// =============== 상담게시판 ================
	// 사이트 1:1 상담 게시판
	@GetMapping("question")
	public String questionBoard() {
		return "html/member/question/question_board";
	}

	@GetMapping("question/detail")
	public String questionDetail() {
		return "html/member/question/question_detail";
	}

	@GetMapping("question/write")
	public String questionWrite() {
		return "html/member/question/question_write_form";
	}
	
	//============= etc ==============
	// 찾아 오는 길
	@GetMapping("branchLocation")
	public String branchLocation() {
		return "html/member/etc/branch_location";
	}

	// 사이트 이용 안내
	@GetMapping("siteGuide")
	public String siteHowTo() {
		return "html/member/etc/site_guide";
	}
	
	// 사이트 자주묻는 질문 (FAQ)
	@GetMapping("siteFAQ")
	public String siteFAQ() {
		return "html/member/etc/site_faq";
	}
	
	


}
