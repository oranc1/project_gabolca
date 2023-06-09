package com.itwillbs.project_gabolcar.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.project_gabolcar.service.BrcService;
import com.itwillbs.project_gabolcar.service.CarService;
import com.itwillbs.project_gabolcar.service.DriverService;
import com.itwillbs.project_gabolcar.service.MemberService;
import com.itwillbs.project_gabolcar.service.PaymentService;
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
	private DriverService driService;

	@Autowired
	private ResService resService;

	// 1:1 문의 게시판 서비스
	@Autowired
	private QuestionService qst_service;
	@Autowired
	private BrcService brc_service;

	@Autowired
	private PaymentService payService;

	@Autowired
	private CarService carService;

	// =============== 멤버 페이지, 멤버 정보 관련 ================
	// 회원 정보 수정
	@GetMapping("MemberUpdatePro")
	public String memberupdate(HttpSession session, Model model) {

		String sId = (String) session.getAttribute("sId");

		if (sId == null) {
			model.addAttribute("msg", "로그인 후 이용가능!");
			return "inc/fail_back";
		}

		// 세션 아이디를 사용하여 회원 상세정보 조회 요청
		MemberVO member = memberService.getMemberInfo(sId);
		System.out.println(member);
		System.out.println(sId);
//							System.out.println(member);
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
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); //비밀번호 암호화

		if (sId == null) {
			model.addAttribute("msg", "로그인 후 이용 가능!");
			return "inc/fail_back";
		} else if (!sId.equals("admin")) {

			if (member.getMem_passwd() == null || member.getMem_passwd().equals("")) { // 패스워드가 입력되지 않았을 경우
				model.addAttribute("msg", "패스워드 입력 필수!");
				return "inc/fail_back";
			} else if (!passwordEncoder.matches(member.getMem_passwd(), securePasswd)) { // 현재 비밀번호가 일치하지 않았을 경우
				model.addAttribute("msg", "현재 비밀번호 불일치!");
				return "inc/fail_back";
			} else if (!newPasswd.equals(newPasswd1)) { // 새로운 비밀번호 두개가 일치하지 않았을 경우
				model.addAttribute("msg", "비밀번호 확인 불일치!"); 
				return "inc/fail_back";

			}

		}
		
		System.out.println("member : " + member);
		// 일반 회원이 패스워드가 일치하거나, 관리자일 때 ModifyMember() 메서드 호출하여 회원 정보 수정 요청
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
			model.addAttribute("msg", "로그인 후 이용 가능!");
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

		model.addAttribute("resinfo", resinfo);

		MemberVO member = memberService.memName(sId);
		model.addAttribute("member", member);
		System.out.println(member);

		// CarVO
		List<Integer> resIdxList = resinfo.stream().map(ResInfoVO::getRes_idx).collect(Collectors.toList());

		List<Integer> carIdxList = carService.insertCar(resIdxList);
		List<CarVO> car = carService.selectCarInfo(carIdxList);
		model.addAttribute("carIdxList", carIdxList);
		model.addAttribute("car", car);

		return "html/member/mem_page/mem_res_inq";
	}

	// 예약 상세 정보
	@GetMapping("resDetail")
	public String resDetail(@RequestParam int res_idx, HttpSession session, Model model) {
		String sId = (String) session.getAttribute("sId");

		if (sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "inc/fail_back";
		}
		System.out.println(res_idx);
		ResInfoVO resinfo = resService.detail(res_idx);
		model.addAttribute("resinfo", resinfo);

		PaymentVO payment = payService.totalPay(res_idx);
		System.out.println(payment);
		model.addAttribute("payment", payment);

		DriverVO driver = driService.driverInfo(res_idx);
		model.addAttribute("driver", driver);

		CarVO car = carService.carInfo(res_idx);
		model.addAttribute("car", car);

		MemberVO member = memberService.memName(sId);
		model.addAttribute("member", member);

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
			model.addAttribute("msg", "로그인 후 이용 가능!");
			return "inc/fail_back";
		} else if (!sId.equals("admin")) {

			if (member.getMem_passwd() == null || member.getMem_passwd().equals("")) { // 패스워드가 입력되지 않았을 경우
				model.addAttribute("msg", "패스워드 입력 필수!");
				return "inc/fail_back";
			} else if (!passwordEncoder.matches(member.getMem_passwd(), securePasswd)) { // 패스워드 틀렸을 경우
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
			session.invalidate();
			model.addAttribute("msg", "회원 탈퇴가 완료되었습니다!");
			model.addAttribute("targetURL", "login");
			
			return "inc/success_forward";
		}

	}

	// =============== 로그인 회원가입 관련 ================

	// 임시로 OnController 사용중

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

	// 1:1 문의 게시판 리스트 클릭
//	@GetMapping("QuestionList")
//	public String quetionListForm(MemberVO member, HttpSession session, Model model) {
//		String sId = (String) session.getAttribute("sId");
//		
//		if (sId == null) {
//			model.addAttribute("msg", "로그인이 필요합니다!");
//			return "inc/fail_back";
//		}
//		return "redirect:/QuestionListForm";
//	}
	
	// 1:1 문의 게시판 작성 폼
	@GetMapping("QuestionWriteForm")
	public String quetionWriteForm(HttpSession session, Model model) {

		String sId = (String) session.getAttribute("sId");

		if (sId == null) {
			model.addAttribute("msg", "로그인이 필요합니다!");
			return "inc/fail_back";
		}
		
		MemberVO loggedInUser = (MemberVO) session.getAttribute("loggedInUser");

		if (loggedInUser == null) {
			model.addAttribute("msg", "로그인 다시 해주세요");
			return "inc/fail_back"; // 로그인 페이지로 리다이렉트
		}
		
		int mem_idx = loggedInUser.getMem_idx();
		
		MemberVO member = memberService.getMemberInfo(sId);
		model.addAttribute("member", member);

		// 매개 변수 가져 오기
//	      int mem_idx = (int)session.getAttribute("mem_idx");
//	      // 서비스에서 이름 가져 오기
//	      String mem_name = memberService.getMemNameByIdx(mem_idx);
//
//	      // 모델에 이름 추가
//	      model.addAttribute("mem_name", mem_name);
//	      System.out.println("mem_name " + mem_name);
//	      System.out.println("mem_name " + mem_name);

		return "admin@admin.com".equals(sId) ? "html/member/question/question_write_form_admin" : "html/member/question/question_write_form_member";

	}

	// 1:1 문의 게시판 작성
	@PostMapping("QuestionWritePro")
	public String quetionWritePro(@RequestParam String mem_name, QuestionVO question, HttpSession session,
			Model model) {
		String sId = (String) session.getAttribute("sId");

		// 로그인한 사용자의 mem_idx를 가져오기
		int mem_idx = memberService.getCurrentUserMemIdx(mem_name);

		// 가져온 mem_idx를 QuestionVO의 mem_idx에 설정
		question.setMem_idx(mem_idx);

		int insertCount = qst_service.questionBoard(question);

		if (insertCount > 0) {
			System.out.println("QuestionWrite 성공");
			return "redirect:/QuestionListForm";
		} else {
			model.addAttribute("msg", "1:1 문의 쓰기 실패!");
			return "inc/fail_back";
		}
	}
	
	// 1:1 문의 게시판 폼
	@GetMapping("QuestionListForm")
	public String questionBoard(MemberVO member,
			@RequestParam(name = "searchType", defaultValue = "") String searchType,
			@RequestParam(name = "searchKeyword", defaultValue = "") String searchKeyword,
			@RequestParam(defaultValue = "1") int pageNum, HttpSession session, Model model) {
		
		String sId = (String) session.getAttribute("sId");

		MemberVO loggedInUser = (MemberVO) session.getAttribute("loggedInUser");

		if (loggedInUser == null) {
			model.addAttribute("msg", "로그인 다시 해주세요");
			return "inc/fail_back"; // 로그인 페이지로 리다이렉트
		}

		int mem_idx = loggedInUser.getMem_idx();
		System.out.println("mem_idx 게시판 : " + mem_idx);
		int listLimit = 6;
		int startRow = (pageNum - 1) * listLimit;

//	    List<QuestionVO> qstBoardList = qst_service.getQstBoardListForMember(searchType, searchKeyword, startRow, listLimit, mem_idx);
		List<QuestionVO> qstBoardList;

	    if ("admin@admin.com".equals(sId)) {
	        // 관리자인 경우: 모든 게시글 가져오기
	        qstBoardList = qst_service.getQstBoardList(searchType, searchKeyword, startRow, listLimit);
	    } else {
	        // 일반 사용자인 경우: 자신이 작성한 글과 관리자가 작성한 답변 글만 가져오기
	        qstBoardList = qst_service.getQstBoardListForMember(searchType, searchKeyword, startRow, listLimit,
	                mem_idx);
	    }

		int listCount = qst_service.getQstBoardListCount(searchType, searchKeyword);

		int pageListLimit = 2;
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		QstPageInfoVO pageInfo = new QstPageInfoVO(listCount, pageListLimit, maxPage, startPage, endPage);

		model.addAttribute("qstBoardList", qstBoardList);
		model.addAttribute("pageInfo", pageInfo);

		// mem_idx = 1(관리자) 면 question_board (관리자 뷰페이지) 아닐경우(회원)
		// question_board_member(회원 뷰페이지) 로 이동
		return "admin@admin.com".equals(sId) ? "html/member/question/question_board" : "html/member/question/question_board_member";
	}

	// "QuestionDetail" 서블릿 요청에 대한 글 상세정보 조회 요청
	@GetMapping("QuestionDetail")
	public String detail(@RequestParam int qst_idx, Model model, HttpSession session) {

		String sId = (String) session.getAttribute("sId");

		if (sId == null) {
			model.addAttribute("msg", "로그인이 필요합니다!");
			return "inc/fail_back";
		}

//		   작성자가 맞는 지 확인
		if (!sId.equals("admin@admin.com")) {

			boolean isBoardWriter = qst_service.isBoardWriter(qst_idx, sId);

			if (!isBoardWriter) {
				model.addAttribute("msg", "권한이 없습니다!");
				return "inc/fail_back";
			}
		}
		
		MemberVO loggedInUser = (MemberVO) session.getAttribute("loggedInUser");

		if (loggedInUser == null) {
			model.addAttribute("msg", "로그인 다시 해주세요");
			return "inc/fail_back"; // 로그인 페이지로 리다이렉트
		}

		int mem_idx = loggedInUser.getMem_idx();
		
		// 글 작성자 정보
		QuestionVO question = qst_service.getQuestionBoard(qst_idx);
		// 로그인한 회원 정보
		MemberVO member = memberService.getMemberInfo(sId);
		model.addAttribute("member", member);
		// 상세정보 조회 결과 저장
		model.addAttribute("question", question);

		return "admin@admin.com".equals(sId) ? "html/member/question/question_detail_admin" : "html/member/question/question_detail_member";

		
	}

	// "QuestionDelete" 서블릿 요청에 대한 글 삭제 요청
	@GetMapping("QuestionDelete")
	public String qstDelet(@RequestParam int qst_idx, @RequestParam(defaultValue = "1") int pageNum,
			HttpSession session, Model model) {

		String sId = (String) session.getAttribute("sId");
		if (sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "inc/fail_back";
		}

		// 작성자가 맞는 지 확인
		if (!sId.equals("admin@admin.com")) {

			boolean isBoardWriter = qst_service.isBoardWriter(qst_idx, sId);

			if (!isBoardWriter) {
				model.addAttribute("msg", "권한이 없습니다!");
				return "inc/fail_back";
			}
		}

		int deleteCount = qst_service.removeBoard(qst_idx);

		if (deleteCount == 0) {
			model.addAttribute("msg", "삭제 실패!");
			return "inc/fail_back";
		}

		return "redirect:/QuestionListForm?pageNum=" + pageNum;
	}

	// 1:1 문의 게시판 답변 폼
	@GetMapping("QuestionReplyForm")
	public String qstReplyForm(@RequestParam int qst_idx, @RequestParam(defaultValue = "1") int pageNum,
			HttpSession session, Model model) {

		String sId = (String) session.getAttribute("sId");
		if (sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "inc/fail_back";
		}
		// 현재 로그인한 회원 (관리자)
		MemberVO member = memberService.getMemberInfo(sId);
		model.addAttribute("member", member);

		QuestionVO question = qst_service.getQuestionBoard(qst_idx);
		model.addAttribute("question", question);

		return "html/member/question/question_reply_form";
	}

	// 문의 게시판 답변 기능
	@PostMapping("QuestionReplyPro")
	public String qstReplyPro(@RequestParam int qst_idx, @RequestParam String mem_name, QuestionVO question,
			HttpSession session, Model model, HttpServletRequest request) {

		String sId = (String) session.getAttribute("sId");

		if (sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "inc/fail_back";
		}
		// 로그인한 회원 이름
		int mem_idx = memberService.getCurrentUserMemIdx(mem_name);
		question.setMem_idx(mem_idx);

		// 답글을 달 qst_board_re_ref 값을 추출
		int qst_board_re_ref = qst_service.getCurrentQstBoardReRef(qst_idx);
		question.setQst_board_re_ref(qst_board_re_ref);
		System.out.println("qst_board_re_ref : " + qst_board_re_ref);

		// 답변 글쓰기
		int insertCount = qst_service.registReplyQstBoard(question);

		if (insertCount > 0) {
			System.out.println("답변 성공");
			return "redirect:/QuestionListForm";
		} else {
			model.addAttribute("msg", "답변 실패!");
			return "inc/fail_back";
		}

	}

	// 문의 게시판 수정 폼
	@GetMapping("QuestionModifyForm")
	public String qstModiyForm(@RequestParam int qst_idx, @RequestParam(defaultValue = "1") int pageNum,
			HttpSession session, Model model) {

		String sId = (String) session.getAttribute("sId");
		if (sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "inc/fail_back";
		}
		
		MemberVO loggedInUser = (MemberVO) session.getAttribute("loggedInUser");

		if (loggedInUser == null) {
			model.addAttribute("msg", "로그인 다시 해주세요");
			return "inc/fail_back"; // 로그인 페이지로 리다이렉트
		}

		int mem_idx = loggedInUser.getMem_idx();
		

		QuestionVO question = qst_service.getQuestionBoard(qst_idx);

		model.addAttribute("question", question);

		return "admin@admin.com".equals(sId) ? "html/member/question/question_modify_admin" : "html/member/question/question_modify_member";

	}
	
	// 문의 게시판 수정 기능
	@PostMapping("QuestionModifyPro")
	public String qstModiyPro(@RequestParam String mem_name, @RequestParam int qst_idx, QuestionVO question,
			@RequestParam(defaultValue = "1") int pageNum, HttpSession session, Model model) {
		int mem_idx = memberService.getCurrentUserMemIdx(mem_name);
		question.setMem_idx(mem_idx);
		question.setQst_idx(qst_idx);

		int updateCount = qst_service.qstModifyBoard(question);

		if (updateCount > 0) {
			System.out.println("수정 성공");
			return "redirect:/QuestionListForm?qst_idx=" + question.getQst_idx() + "&pageNum=" + pageNum;
		} else {
			model.addAttribute("msg", "수정 실패!");
			return "inc/fail_back";
		}
	}

	// ============= etc ==============
	// 찾아 오는 길
	@GetMapping("branchLocation")
	public ModelAndView branchLocation() {
		List<Map<String, Object>> brcList = brc_service.brcList();
		return new ModelAndView("html/member/etc/branch_location", "brcList", brcList);
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
	
	// 이용약관
	@GetMapping("UseAgree")
	public String UseAgree() {
		return "html/member/etc/use_agree";
	}
	
	// 개인정보처리방침
	@GetMapping("PerInfo")
	public String PerInfo() {
		return "html/member/etc/per_info";
	}
	
	// 이메일 수집거부
	@GetMapping("EmailRej")
	public String EmailRej() {
		return "html/member/etc/email_rej";
	}
	
	// 자동차 대여약관
	@GetMapping("CarClause")
	public String CarClause() {
		return "html/member/etc/car_clause";
	}
		
}
