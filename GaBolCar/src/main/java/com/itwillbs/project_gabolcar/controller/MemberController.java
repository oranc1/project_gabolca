package com.itwillbs.project_gabolcar.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.project_gabolcar.service.MemberService;
import com.itwillbs.project_gabolcar.vo.*;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

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
//	@GetMapping("login")
//	public String login() {
//		return "html/member/login/login";
//	}
	
	// 아이디 비밀번호 찾기

	//회원가입
	@GetMapping("signup")
	public String signup() {
		return "html/member/login/signup";
	}
	
	
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		System.out.println("컨트롤러까지 옴");
		int cnt = memberService.idCheck(id);
		return cnt;
	}
	
	@PostMapping("MemberJoinPro")
	public String memberJoin(MemberVO member, Model model) {
		
		System.out.println(member);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
		String securePasswd = passwordEncoder.encode(member.getMem_passwd());
		
		member.setMem_passwd(securePasswd);
		
		
		int insertCount = memberService.registMember(member);
		// 등록 실패(insertCount == 0) 시 Model 객체에 "등록 실패!" 저장(속성명 msg) 후 fail_back.jsp 로 포워딩
		if(insertCount > 0) {
			return "main";
		} else {
			model.addAttribute("msg", "회원 가입 실패!");
			return "html/member/login/fail_back";
		}
		
	}
	

	@GetMapping("login")
	public String login(@CookieValue(value = "REMEMBER_ID", required = false) Cookie cookie) {
		
		if(cookie != null) {
			System.out.println("저장된 쿠키 확인 : " + cookie.getValue());
		}
		
		return "html/member/login/login";
	}
	
	
	@PostMapping("MemberLoginPro")
	public String loginPro(MemberVO member, @RequestParam(required = false) boolean rememberId, 
			Model model, HttpSession session, HttpServletResponse response) {
		System.out.println("넘어요냐???");
		
//		MemberVO memberResult = memberService.selectCorrectUser(member);
//		
//		System.out.println("null값 뭔데");
//		System.out.println(memberResult);
//	
//		if(memberResult == null) {
//			model.addAttribute("msg", "로그인 실패!");
//			return "html/fail_back";
//			
//		} 
		
		String securePasswd = memberService.getPasswd(member);
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
	
//		String mem_passwd = memberService.getPasswd(member);
//		System.out.println(mem_passwd);
		
		if(member.getMem_passwd() == null || !passwordEncoder.matches(member.getMem_passwd(), securePasswd)) { // 로그인 실패
			model.addAttribute("msg", "로그인 실패!");
			return "html/member/login/fail_back";
		} else { // 로그인 성공(= 패스워드 일치)
			// 세션 객체에 아이디 저장(속성명 sId)
			session.setAttribute("sId", member.getMem_id());
			Cookie cookie = new Cookie("REMEMBER_ID", member.getMem_id());
			if(rememberId) { // 아이디 저장 체크 시(쿠키 생성)
				cookie.setMaxAge(60 * 60 * 24 * 30); // 쿠키 유효기간 1개월(30일) 설정
			} else { // 아이디 저장 체크 해제 시(쿠키 삭제)
				cookie.setMaxAge(0); // 쿠키 유효기간 0으로 설정 = 쿠키 삭제
			}
			
			response.addCookie(cookie); // 응답 데이터에 쿠키 추가
			
			return "redirect:/"; // 메인페이지(루트)로 리다이렉트
		}
		}
	
	@GetMapping("Logout")
	public String logout(HttpSession session) {
//		session.removeAttribute("sId"); // 세션 아이디만 제거
		
		// 세션 객체 초기화 후 메인페이지로 리다이렉트
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("memberFind")
	public String memberFind() {
		return "html/member/login/find";
	}
	
	//id찾기 입력
//	@GetMapping("findId")
//	public String findId() {
//		return "html/Find";
//	}
	
	@GetMapping("findIdPro")
	public String findIdPro(@RequestParam(required = false) String mem_name,@RequestParam(required = false) String mem_mtel, Model model) {
		System.out.println("여기까지 오니?"
				+ "");
		com.itwillbs.project_gabolcar.vo.MemberVO member = memberService.getId(mem_name, mem_mtel); 
		model.addAttribute("member",member);
		return "html/member/login/findIdResult";
	}
	
	//id찾기 입력 데이터 받아오기
	
	//id 찾기 결과페이지
	@GetMapping("findIdResult")
	public String findIdResult() {
		return "html/member/login/findIdRes";
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
