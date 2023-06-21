package com.itwillbs.project_gabolcar.controller;

import java.util.HashMap;
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

import com.itwillbs.project_gabolcar.service.MemberService;
import com.itwillbs.project_gabolcar.util.FindUtil;
import com.itwillbs.project_gabolcar.util.SendUtil;
import com.itwillbs.project_gabolcar.vo.MemberVO;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class OnController { //나중에 합칠거임
	@Autowired
	private MemberService memberService;
	
	//회원가입
		@GetMapping("signup")
		public String signup() {
			return "html/member/login/signup";
		}
		
		//id 중복 확인
		@PostMapping("/idCheck")
		@ResponseBody
		public int idCheck(@RequestParam("id") String id) {
			System.out.println("컨트롤러까지 옴");
			int cnt = memberService.idCheck(id);
			return cnt;
		}
		
		
		
		//문자인증 작업중 6/19
		@PostMapping("send-one")
		@ResponseBody
	    public String sendOne(@RequestParam(value="to") String to) {
//			public String sendOne(HttpServletRequest request,@RequestParam(value = "phone1", required=true) String phone1,@RequestParam(value = "phone2", required=true) String phone2,@RequestParam(value = "phone3", required=true) String phone3) {
			//인증번호 필요하고
			System.out.println("여기까지옴ㅇㅇ");
			System.out.println(to);
			String randomNum = FindUtil.getRandomNum();
			//메세지 보낼 번호 필요함 (폼에서 받아 와야한다)
			//폰 번호랑 인증번호 저장 해야하고
			//그리고 sendMsg 불러와서 메세지 전송
//			System.out.println(phone1);
//			String phone = phone1+"-"+phone2+"-"+phone3;
//			System.out.println(phone);
			String msg = "[가볼카 회원가입] 인증번호 ["+randomNum+"]를 입렵해 주세요.";
			SendUtil.sendMsg(to, msg);
			System.out.println("전송완료?");
//			
//			Map<String, String> map = new HashMap<String, String>();
//			map.put(phone, phone);
//			map.put(randomNum, randomNum);
			//입력받은값이 인증번호랑 일치하면 핸드폰 번호가 인증 되었습니다. 하고 회원가입 버튼 활성화
			
			//로그인 화면
	        return "html/member/login/login";
	    }
	   
	   
	   
		//회원가입 db작업
		@PostMapping("MemberJoinPro")
		public String memberJoin(MemberVO member, Model model) {
			
			
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
		
		//로그인 
		@GetMapping("login")
		public String login(@CookieValue(value = "REMEMBER_ID", required = false) Cookie cookie) {
			
			if(cookie != null) {
				System.out.println("저장된 쿠키 확인 : " + cookie.getValue());
			}
			
			return "html/member/login/login";
		}
		
		//로그인 db
		@PostMapping("MemberLoginPro")
		public String loginPro(MemberVO member, @RequestParam(required = false) boolean rememberId, 
				Model model, HttpSession session, HttpServletResponse response) {

			
			String securePasswd = memberService.getPasswd(member);
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

			
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
		
		//로그아웃
		@GetMapping("Logout")
		public String logout(HttpSession session) {
			session.removeAttribute("sId"); // 세션 아이디만 제거
			// 세션 객체 초기화 후 메인페이지로 리다이렉트
			session.invalidate();
			return "redirect:/";
		}
		
		//아이디 비밀번호 찾기페이지
		@GetMapping("memberFind")
		public String memberFind() {
			return "html/member/login/find";
		}
		

		@PostMapping("findIdPro")
		public String findIdPro(MemberVO member, Model model) {
//			System.out.println("여기까지 오니?");
			//count==0일때 history.back
			//else 모델에 저장하고 뷰페이지에 아이디 보여주기
			//핸드폰 번호 입력부분 어떻게 할지?
			//DB에는 010-1234-5678 형태로 저장 되어있음
			//^js로 해결완료~__~

			//로그인 방식으로 다시 시도 해봅니다..
			String idResult = memberService.getId(member);
//			System.out.println(idResult);
			model.addAttribute("idResult",idResult);
			
			//성공 실패 나누기
			if(idResult == null) {
				model.addAttribute("msg", "입력하신 정보와 일치하는 아이디가 없습니다.");
				return "html/member/login/fail_back";
			}
			return "html/member/login/find_id";}
//		}
		

		
		@PostMapping("findPwPro")
		public String findPwPro(MemberVO member, Model model) {
			//아이디 이름 번호 받아와서 일치하면(DB작업1)
			String mem_id = memberService.isExistUser(member);
			
			if(mem_id == null) {
				model.addAttribute("msg", "입력하신 정보와 일치하는 아이디가 없습니다.");
				return "html/member/login/fail_back";
			}
			//조회된 정보가 있으면
			//임시 비밀번호 만들기
			String newPwd = FindUtil.getRamdomPassword();
			
			//임시 비밀번호 암호화
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String securePasswd = passwordEncoder.encode(newPwd);
			member.setMem_passwd(securePasswd);
			
			//파라미터가 고민이 된다 암호화 한 비밀번호를 넣어야함
			//어쨋든 암호화한 비밀번호 DB에 수정하는 작업.
			int updateCount = memberService.changePw(member);
			
			System.out.println(updateCount);
			
			if(updateCount>0) {
				//메일 발송 하자구
				String subject = "[Gabolcar] 임시 비밀번호 입니다.";
				String msg = "회원님의 임시 비밀번호는 "+newPwd+" 입니다.\n 로그인 후 비밀번호를 변경 하세요";
				SendUtil.sendMail(mem_id, subject, msg);
				System.out.println("발송완료");
			}
			//메일로 임시 비밀번호를 발송 했습니다. 실패시 정보를 확인해주세요 등의  msg
			//비밀번호 어떻게 발송 합니까?
			//비밀번호 발송 하고 임시 비밀번호를 DB에 등록 해야한다(DB작업2)
			model.addAttribute("mem_id",mem_id);
			
			return "html/member/login/find_pw";
		}
		
		

}
