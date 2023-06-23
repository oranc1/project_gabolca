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

import com.itwillbs.project_gabolcar.service.BrcService;
import com.itwillbs.project_gabolcar.service.MemberService;
import com.itwillbs.project_gabolcar.service.QuestionService;
import com.itwillbs.project_gabolcar.service.ResService;
import com.itwillbs.project_gabolcar.vo.*;
import com.mysql.cj.Session;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	
	@Autowired
	private ResService resService;

	// 1:1 문의 게시판 서비스
	@Autowired
	private QuestionService qst_service;
	@Autowired
	private BrcService brc_service;
	


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
	@GetMapping("MemberRes")
	public String resInq(HttpSession session, Model model) {
		
		String sId = (String) session.getAttribute("sId");
		
		if (sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "inc/fail_back";
		}
	
		List<ResInfoVO> resinfo;
		try {
			resinfo = resService.getResInfo(sId);
			 if (resinfo.isEmpty()) {
		            model.addAttribute("msg", "예약 내역이 없습니다!");
		            return "inc/fail_back";
		        }
		} catch (Exception e) {
			model.addAttribute("msg", "예약 내역을 가져오는 중에 오류가 발생했습니다!");
			return "inc/fail_back";
		}
		
		System.out.println(resinfo);
		
	
		model.addAttribute("resinfo", resinfo);
		
		return "html/member/mem_page/mem_res_inq";
	}


	
	
	//예약 상세 정보
	@GetMapping("resDetail")
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
	
	
	
	// 1:1 상담 게시판 작성 폼
	@GetMapping("QuestionWrietForm")
	public String quetionWriteForm(HttpSession session, Model model) {
		
		String sId = (String) session.getAttribute("sId");
		
		if (sId == null) {
			model.addAttribute("msg", "로그인이 필요합니다!");
			return "inc/fail_back";
		}
		
	    List<Map<String, Object>> memQuestionList = memberService.memQuestionList();
	    model.addAttribute("memQuestionList", memQuestionList);
	    return "html/member/question/question_write_form";
	}
	
	// 1:1 상담 게시판 작성
	@PostMapping("QuestionWritePro")
	public String quetionWritePro(@RequestParam String mem_name, QuestionVO question, Model model) {
		  // 로그인한 사용자의 mem_idx를 가져오기
	    int mem_idx = memberService.getCurrentUserMemIdx(mem_name);

	    // 가져온 mem_idx를 QuestionVO의 mem_idx에 설정
	    question.setMem_idx(mem_idx);
		
		int insertCount = qst_service.questionBoard(question);
		
		if(insertCount > 0) {
			System.out.println("QuestionWrite 성공");
			return "redirect:/QuestionList";
		} else {
			model.addAttribute("msg", "1:1 문의 쓰기 실패!");
			return "fail_back";
		}
	}
	//
	// 1:1 상담 게시판 리스트
	@GetMapping("QuestionList")
	public String questionBoard(
			@RequestParam(defaultValue = "") String searchType, 
			@RequestParam(defaultValue = "") String searchKeyword, 
			@RequestParam(defaultValue = "1") int pageNum, 
			Model model) {
		
		System.out.println("검색타입 : " + searchType);
		System.out.println("검색어 : " + searchKeyword);
		
		int listLimit = 10; // 한 페이지에서 표시할 목록 갯수 지정
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행(레코드) 번호
		
		List<QuestionVO> qstBoardList = qst_service.getQstBoardList(searchType, searchKeyword, startRow, listLimit);
		
		int listCount = qst_service.getQstBoardListCount(searchType, searchKeyword);
		
		int pageListLimit = 2;
		
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);		
		
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		QstPageInfoVO qstPageInfo = new QstPageInfoVO(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("qstBoardList", qstBoardList);
		model.addAttribute("pageInfo", qstPageInfo);
		
		System.out.println(" qstBoardList : " + qstBoardList);
		return "html/member/question/question_board";
	}
	
	// "QuestionDetail" 서블릿 요청에 대한 글 상세정보 조회 요청
	@GetMapping("QuestionDetail")
	public String detail(@RequestParam int qst_idx, Model model) {
		// BoardService - getBoard() 메서드 호출하여 글 상세정보 조회 요청
		// => 파라미터 : 글번호   리턴타입 : BoardVO 객체(board)
		QuestionVO question = qst_service.getQuestionBoard(qst_idx);
		
		// 상세정보 조회 결과 저장
		model.addAttribute("question", question);
		
		return "html/member/question/question_detail";
	}
	
	// "QuestionDelete" 서블릿 요청에 대한 글 삭제 요청
	@GetMapping("QuestionDelete")
	public String qstDelet(
			@RequestParam int qst_idx,
			@RequestParam(defaultValue = "1") int pageNum,
			HttpSession session, 
			Model model) {
		
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "inc/fail_back";
		}
		
		if(!sId.equals("admin")) {
			boolean isBoardWriter = qst_service.isBoardWriter(qst_idx, sId);
			
			if(!isBoardWriter) {
				model.addAttribute("msg", "권한이 없습니다!");
				return "inc/fail_back";
			}
		}
		
		int deleteCount = qst_service.removeBoard(qst_idx);
	
		if(deleteCount == 0) {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
	
		return "redirect:/QuestionList?pageNum=" + pageNum;
	}
	
//	@GetMapping("QuestionModifyForm")
//	public String 
	

	
	//============= etc ==============
	// 찾아 오는 길
	@GetMapping("branchLocation")
	public ModelAndView branchLocation() {
		List<Map<String, Object>> brcList = brc_service.brcList();
		return new ModelAndView("html/member/etc/branch_location","brcList",brcList);
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
