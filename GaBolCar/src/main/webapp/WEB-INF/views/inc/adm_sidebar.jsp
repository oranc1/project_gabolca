<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="mypage_sidebar">
	<!-- 유저 프로필 -->
  	<div class="user_profile">
		<dl class="user_info">
           	<dt>
           		<b>홍길동</b> 님
<%-- 				<b>${member.mem_name }</b> 님 --%>
           	</dt>
           	<dd>abcd1234@naver.com</dd>
<%--            	<dd>${sessionScope.sId }</dd> --%>
       	</dl>
   	</div>
   	<ul class="side_menu">
       	<li>
           	<div class="menu_tit mt_dash">
               	<span>대시 보드</span>
           	</div>
           	<ul class="side_sub">
               	<li>
                   	<a href="admDash">대시 보드</a>
               	</li>
           	</ul>
       	</li>
       	<li>
           	<div class="menu_tit mt_car">
               	<span>차량 및 점포 관리</span>
           	</div>
           	<ul class="side_sub">
               	<li>
                   	<a href="admCarList">차량 관리</a>
               	</li>
               	<li>
                   	<a href="admBrcList">지점 관리</a>
               	</li>
           	</ul>
       	</li>
       	<li>
           	<div class="menu_tit mt_user">
               	<span>회원 및 예약 관리</span>
           	</div>
           	<ul class="side_sub">
                <li>
                	<a href="admMemList">회원 목록</a>
                </li>
                <li>
                	<a href="admResList">예약 목록</a>
                </li>
            </ul>
       	</li>
       	<li>
           	<div class="menu_tit mt_list">
               	<span>리뷰 및 문의사항</span>
            </div>
            <ul class="side_sub">
                <li>
                	<a href="#">리뷰 리스트</a>
                </li>
                <li>
                    <a href="#">1:1 문의사항</a>
                </li>
            </ul>
        </li>
    </ul>
</div> <!-- mypage_sidebar -->
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