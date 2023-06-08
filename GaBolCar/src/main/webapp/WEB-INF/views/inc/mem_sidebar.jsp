<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 원본 파일 이름 sidebar --%>

<link  href="${pageContext.request.contextPath }/resources/css/inc/mem_sidebar.css" rel="stylesheet">
	<div class="mypage_sidebar">
		<!-- 유저 프로필 -->
		<div class="user_profile">
			<dl class="user_info">
				<dt>
					<b>홍길동</b> 님
				</dt>
				<dd>abcd1234@naver.com</dd>
			</dl>
			<button class="info_manage">내 정보 관리</button>
		</div>

		<ul class="side_menu">
			<li>
				<div class="menu_tit mt_car">
					<span>MY 예약</span>
				</div>
				<ul class="side_sub">
					<li>예약 정보 조회</li>
				</ul>
			</li>
			<li>
				<div class="menu_tit mt_user">
					<span>내 정보 관리</span>
				</div>
				<ul class="side_sub">
					<li>내 정보 수정</li>
					<li>회원탈퇴</li>
				</ul>
			</li>
			<li>
				<div class="menu_tit mt_call">
					<span>고객센터</span>
				</div>
				<ul class="side_sub">
					<li>1:1 카카오톡으로 문의하기</li>
					<li>전화문의 051-123-4567</li>
				</ul>
			</li>
		</ul>
		<script>
			$('.menu_tit').click(function () {
			    $(this).children('span').addClass('on');
			    if ($(this).siblings('.side_sub').is(':hidden')) {
			        $(this).siblings('.side_sub').slideDown();
			        $(this).children('span').removeClass('on');
			    } else {
			        $(this).siblings('.side_sub').slideUp();
			    }
			});
		</script>
	</div>
