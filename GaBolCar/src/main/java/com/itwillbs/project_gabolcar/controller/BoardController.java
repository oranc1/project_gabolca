package com.itwillbs.project_gabolcar.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_gabolcar.service.BoardService;
import com.itwillbs.project_gabolcar.vo.Criteria;
import com.itwillbs.project_gabolcar.vo.NoticeVO;
import com.itwillbs.project_gabolcar.vo.PageDTO;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	// 공지사항 글 작성 폼
	@GetMapping("noticeWriteForm")
	public String noticeWriteForm(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "html/member/notice/fail_back";
		}

		return "html/member/notice/notice_write_form";
	}
	
	// 공지사항 글 작성
	@PostMapping("noticeWritePro")
	public String noticeWritePro(HttpSession session, NoticeVO notice, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "html/member/notice/fail_back";
		}
		
		int insertCount = service.insertNotice(notice);
		
		if(insertCount == 0) {
			model.addAttribute("msg", "등록 실패");
			return "html/member/notice/fail_back";
		}
		
		return "redirect:/noticeList";
	}
	
	// 공지사항 글 목록
	@GetMapping("noticeList")
	public String noticeList(Model model, Criteria cri) {

		List<NoticeVO> noticeListWithPaging = service.getNoticeListPaging(cri);
		model.addAttribute("noticeListP", noticeListWithPaging);
		
		int total = service.getTotal();
		PageDTO pageMaker = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMaker);		
		
		return "html/member/notice/notice";
		
	}
	
	// 공지사항 상세 글 보기
	@GetMapping("noticeDetail")
	public String noticeDetail(NoticeVO notice, Model model, HttpServletRequest request, HttpServletResponse response, Criteria cri) {
		
		// 파라미터에 request 없애고 HttpSession 으로 
		NoticeVO noticeResult = service.noticeDetail(notice);
		model.addAttribute("noticeDetail", noticeResult);
		model.addAttribute("cri", cri);

//			Cookie[] cookies = request.getCookies();
//
//			if (cookies != null) {
//				String cookieName = "board" + notice.getBo_idx(); // 쿠키 이름 설정 (게시물마다 고유한 이름)
//
//				// 쿠키 검사
//				for (Cookie cookie : cookies) {
//					if (cookie.getName().equals(cookieName)) {
//						// 이미 쿠키가 존재하면 중복 조회로 간주하여 처리하지 않음
//						model.addAttribute("bo_reacount", noticeResult.getBo_readcount());
//						return "html/member/notice/notice_detail";
//					}
//				}
//			}
			
			int updateCount = service.updateReadcount(notice);
			if (updateCount > 0) {

				// 쿠키 생성하여 중복 조회 방지
//				String cookieName = "board" + notice.getBo_idx(); // 쿠키 이름 설정 (게시물마다 고유한 이름)
//				Cookie cookie = new Cookie(cookieName, "viewed");
//				cookie.setMaxAge(24 * 60 * 60); // 쿠키 유효 기간 설정 (예: 24시간)
//				response.addCookie(cookie);

				// 조회수가 증가된 게시물 정보를 모델에 담아서 전달
				model.addAttribute("bo_reacount", noticeResult.getBo_readcount() + 1);
			}
		
		return "html/member/notice/notice_detail";
	}
	
	// 공지사항 글 수정 폼
	@GetMapping("noticeModify")
	public String noticeModify(HttpSession session, NoticeVO notice, Model model, Criteria cri) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "html/member/notice/fail_back";
		}
		
		NoticeVO noticeResult = service.noticeDetail(notice);
		model.addAttribute("noticeDetail", noticeResult);
		model.addAttribute("cri", cri);
		
		return "html/member/notice/notice_modify_form";
	}
	
	// 공지사항 글 수정
	@PostMapping("noticeModifyPro")
	public String noticeModifyPro(HttpSession session, NoticeVO notice, Model model, Criteria cri) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "html/member/notice/fail_back";
		}
		
		int ModifySuccess = service.modifyBoard(notice);
		if(ModifySuccess < 0) {
			model.addAttribute("msg", "수정 실패");
			return "html/member/notice/fail_back";
		}
		
		
		return "redirect:/noticeDetail?pageNum=" + cri.getPageNum() + "&bo_idx=" + notice.getBo_idx();
	}
	
	// 공지사항 글 삭제
	@GetMapping("noticeDelete")
	public String noticeDelete(HttpSession session, NoticeVO notice, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "html/member/notice/fail_back";
		}
		
		int deleteNoticeCount = service.deleteNotice(notice);
		
		if(deleteNoticeCount < 0) {
			model.addAttribute("msg", "삭제 실패");
			return "html/member/notice/fail_back";
		}
		
		int updateCount = service.updateIdx(notice);
		if(updateCount < 0) {
			model.addAttribute("msg", "업데이트 실패");
			return "html/member/notice/fail_back";
		}
		
		return "redirect:/noticeList";
	}
	
}

