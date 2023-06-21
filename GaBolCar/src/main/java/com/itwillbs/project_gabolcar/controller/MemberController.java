package com.itwillbs.project_gabolcar.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.project_gabolcar.service.MemberService;
import com.itwillbs.project_gabolcar.service.QuestionService;
import com.itwillbs.project_gabolcar.vo.*;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	// 1:1 문의 게시판 서비스
	@Autowired
	private QuestionService qst_service;
	

	// =============== 멤버 페이지, 멤버 정보 관련 ================
	// 회원 정보 수정
	@GetMapping("MemberUpdatePro")
	public String memberupdate(HttpSession session, Model model) {

		String sId = (String) session.getAttribute("sId");
		
		
		if (sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "inc/fail_back";
		}
		

		// 세션 아이디를 사용하여 회원 상세정보 조회 요청
		MemberVO member = memberService.getMemberInfo(sId);
//			System.out.println(member);
		member.setPhone1(member.getMem_mtel().split("-")[0]);
		member.setPhone2(member.getMem_mtel().split("-")[1]);
		member.setPhone3(member.getMem_mtel().split("-")[2]);

		member.setMem_bir1(member.getMem_birthday().toString().split("-")[0]);
		member.setMem_bir2(member.getMem_birthday().toString().split("-")[1]);
		member.setMem_bir3(member.getMem_birthday().toString().split("-")[2]);

		member.setSample6_postcode(member.getMem_addr().toString().split("/")[0]);
		member.setSample6_address(member.getMem_addr().toString().split("/")[1]);

		if (member.getMem_addr().toString().split("/").length > 2) {
			member.setSample6_detailAddress(member.getMem_addr().toString().split("/")[2]);

		}
		if (member.getMem_addr().toString().split("/").length > 3) {

			member.setSample6_extraAddress(member.getMem_addr().toString().split("/")[3]);
		}

		// 회원 상세정보(MemberVO) 저장
		model.addAttribute("member", member);
		return "html/member/mem_page/mem_info_update";

	}

	@PostMapping("MemberModify")
	public String MemberModify(MemberVO member, @RequestParam String newPasswd, @RequestParam String newPasswd1,HttpSession session, Model model) {
	
		String sId = (String) session.getAttribute("sId");
		String securePasswd = memberService.getPasswd(member);
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

		if (sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "inc/fail_back";
		} else if (!sId.equals("admin")) {

			if (member.getMem_passwd() == null || member.getMem_passwd().equals("")) { // 패스워드가 입력되지 않았을 경우
				model.addAttribute("msg", "패스워드 입력 필수!");
				return "inc/fail_back";
			} else if(!passwordEncoder.matches(member.getMem_passwd(), securePasswd)) {
				model.addAttribute("msg", "패스워드 불일치!");
				return "inc/fail_back";
			} else if (!newPasswd.equals(newPasswd1)) {
				model.addAttribute("msg", "비밀번호 확인 불일치!");
				return "inc/fail_back";
			
			}

		}

		// 일반 회원이 패스워드가 일치하거나, 관리자일 때
		// MemberService - ModifyMember() 메서드 호출하여 회원 정보 수정 요청
		memberService.ModifyMember(member, newPasswd1, passwordEncoder.encode(newPasswd));

		// " 회원 정보 수정 성공! " 메세지 출력 및 포워딩
		model.addAttribute("msg", "회원 정보 수정 성공!");
		model.addAttribute("targetURL", "MemberUpdatePro");

		return "inc/success_forward";

	}



	// 멤버) 차량 예약 조회
	@GetMapping("resInq")
	public String resInq() {
		return "html/member/mem_page/mem_res_inq";
	}

	//예약 상세 정보
	@GetMapping("member/resDetail")
	public String resDetail() {
		return "html/member/mem_page/mem_res_detail";
	}

	// 회원 탈퇴
	@GetMapping("MemberDeleteForm")
	public String memberOut() {
		return "html/member/mem_page/mem_member_out";
	}

	@PostMapping("MemberDeletePro")
	public String memberDelete(@RequestParam String mem_passwd, MemberVO member, HttpSession session, Model model) {
		String sId = (String) session.getAttribute("sId");

		member.setMem_id(sId);
		String securePasswd = memberService.getPasswd(member);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

		if (sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "inc/fail_back";
		} else if (!sId.equals("admin")) {

			if (member.getMem_passwd() == null || member.getMem_passwd().equals("")) { // 패스워드가 입력되지 않았을 경우
				model.addAttribute("msg", "패스워드 입력 필수!");
				return "inc/fail_back";
			} else if(!passwordEncoder.matches(member.getMem_passwd(), securePasswd)) { //패스워드 틀렸을 경우
				model.addAttribute("msg", "패스워드 불일치!");
				return "inc/fail_back";
			}
		}

		int deleteCount = memberService.removeMember(member);
		if (deleteCount == 0) {
			model.addAttribute("msg", "회원 탈퇴 실패!");
			return "inc/fail_back";
		} else {
			// 세션 초기화
			model.addAttribute("msg", "회원 탈퇴 성공!");
			session.invalidate();
			
			// 메인페이지로 리다이렉트
			return "redirect:/";
		}

	}
	
	
	// =============== 로그인 회원가입 관련 ================

	//임시로 OnController 사용중

	
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
	
	// 1:1 상담 게시판 작성 폼
	@GetMapping("QuestionWrietForm")
	public ModelAndView quetionWriteForm() {
		List<Map<String, Object>> memQuestionList = memberService.memQuestionList();
		return new ModelAndView("html/member/question/question_write_form","memQuestionList",memQuestionList);
//		return "html/member/question/question_write_form";
	}
	
	// 1:1 상담 게시판 작성
	@PostMapping("QuestionWritePro")
	public String quetionWritePro(QuestionVO question, Model model) {
		int insertCount = qst_service.questionBoard(question);
		if(insertCount > 0) {
			System.out.println("QuestionWrite 성공");
			return "html/member/question/question_board";
		} else {
			model.addAttribute("msg", "1:1 문의 쓰기 실패!");
			return "fail_back";
		}
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
