<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<header id="header">
		<div class="top_wrapper">
			<h1 class="h_logo">
				<a href="${pageContext.request.contextPath }"></a>
			</h1>
			<nav class="top_nav">
				<ul class="gnb">
					<li class="gnb_cont"><a href="${pageContext.request.contextPath }/carRes">차량예약</a></li>
					<li class="gnb_cont"><a href="${pageContext.request.contextPath }/carInfoList">차량안내</a></li>
					<li class="gnb_cont"><a href="#">고객센터</a>
						<ul class="sub_menu shadow" style="display: none;">
							<li><a href="${pageContext.request.contextPath }/noticeList">공지사항</a></li>
							<li><a href="${pageContext.request.contextPath }/siteFAQ">FAQ</a></li>
							<li><a href="${pageContext.request.contextPath }/question">1:1 문의</a></li>
						</ul></li>
					<li class="gnb_cont"><a href="${pageContext.request.contextPath }/MemberRes">예약확인</a></li>
				</ul>
				
				<%-- 0531 추가 
						로그인 현황 체크하여 항목 띄우기--%>
				<ul class="login_section">
					<c:choose>
						<c:when test="${empty sessionScope.sId }">
							<li>
								<a href="${pageContext.request.contextPath }/login"> <i class="xi-user"></i> 로그인
								</a>
							</li>
							<li class="btn_register">
								<a href="${pageContext.request.contextPath }/signup"> 회원가입 </a>
							</li>
						</c:when>
						<c:otherwise>
						<li>
							<a href="${pageContext.request.contextPath }/MemberUpdatePro"> <i class="xi-user"></i> ${sessionScope.sId } 님
							</a>
						</li>
						<li>
							<a href="javascript:logout()"> <i class="xi-user"></i> 로그아웃
							</a>
						</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
	</header>
	<header class="header mb">
		<div class="top_wrapper">
			<h2 class="h_logo">
				<a href="${pageContext.request.contextPath }"></a>
			</h2>
			<div class="hbg_btn">
				<span></span> <span></span> <span></span>
			</div>
		</div>

	</header>
	<nav class="gnb mb" style="display: none;">
		<div class="bg"></div>
		<div class="menu">
			<div class="menu_wrap">
				<h2 class="h_logo">
					<a href="${pageContext.request.contextPath }"></a>
				</h2>
				<ul class="menu_section">
					<li class="gnb_cont"><a href="${pageContext.request.contextPath }/carRes">차량예약</a></li>
					<li class="gnb_cont"><a href="${pageContext.request.contextPath }/carInfoList">차량안내</a></li>
					<li class="gnb_cont plus"><a href="#">고객센터</a>
						<ul class="sub_menu" style="display: block;">
							<li><a href="${pageContext.request.contextPath }/notice">공지사항</a></li>
							<li><a href="${pageContext.request.contextPath }/siteFAQ">FAQ</a></li>
							<li><a href="${pageContext.request.contextPath }/question">1:1 문의</a></li>
						</ul></li>
					<li class="gnb_cont"><a href="${pageContext.request.contextPath }/MemberRes">예약확인</a></li>
					<%-- 0531 추가 
						로그인 현황 체크하여 항목 띄우기--%>
					
					<ul class="login_section">
					<c:choose>
						<c:when test="${empty sessionScope.sId }">
						<li>
							<a href="${pageContext.request.contextPath }/login"> <i class="xi-user"></i> 로그인
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/signup"> <i class="xi-user"></i> 회원가입
							</a>
						</li>
						</c:when>
						<c:otherwise>
						<li>
							<a href=""> <i class="xi-user"></i> ${sessionScope.sId } 님
							</a>
						</li>
						<li>
							<a href="javascript:logout()"> <i class="xi-user"></i> 로그아웃
							</a>
						</li>
						</c:otherwise>
					</c:choose>
					</ul>
				</ul>
				<div class="btn_close">
					<span></span> <span></span>
				</div>
			</div>

		</div>

	</nav>
	<script>
		function logout(){
			let isLogout = confirm("로그아웃 하시겠습니까?");
			
			if(isLogout){
				location.href="Logout";
			}
					}
	</script>
	<script>
        let subMenu = $('#header .gnb .sub_menu');
        let mainMenu = $('#header .gnb .gnb_cont');
        subMenu.hide(); //서브메뉴 안보이게 처리
        mainMenu.hover(function () { //메인메뉴 마우스오버했을 때
            $(this).find('.sub_menu').stop().fadeIn();
        }, function () { //마우스 떨어졌을때
            subMenu.stop().fadeOut();
        });
        subMenu.hover(function () {
            $(this).siblings('a').addClass('active');
        }, function () {
            $('#header .gnb .gnb_cont > a').removeClass('active');
        });


        //모바일 메뉴
        $('.gnb.mb').hide();
        $('.header.mb .hbg_btn').click(function () {
            $('.gnb').fadeIn();
        });


        $('.gnb.mb .menu .menu_section .sub_menu').hide();
        $('.gnb.mb .menu .menu_section .gnb_cont').click(function (e) {
            $(this).toggleClass('open');
            $(this).find('.sub_menu').slideToggle();
        });

        $('.gnb.mb .bg , .gnb.mb .menu .btn_close').click(function () {
            $('.gnb').fadeOut();

        });
        
        // 0523 경인 업데이트 
        //		스크롤시 탑 네비바 색 변화
        $(function () {
            $(document).scroll(function () {
                var $nav = $("#header");
                $nav.toggleClass("scroll", $(this).scrollTop() > $nav.height()*0.5);
            });
        });
    </script>

