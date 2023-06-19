<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
	<link href="${pageContext.request.contextPath }/resources/css/common.css"  rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/member/login/login.css" rel="styleSheet">
    <link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
    <link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">

    <script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>
<body>
    <header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	
 <div id="contents" class="subPage">
        <div id="sign">

            <!-- 서브컨텐츠 -->
            <article class="sign_in">

                <!-- pageTitle -->
                <div class="pageTitle">
                    <div class="layout1">
                        <h2 class="tit">가볼카 로그인</h2>
                    </div>
                </div>
                <!--// pageTitle -->

                <!-- 로그인 -->
                <form action="MemberLoginPro" method="post">
                <section class="container">
                    <div class="layout2">
                        <div class="wrap_box">
                            <div class="inner600">
                                <h3 class="t_tit1">로그인</h3>
				
                                <div class="login_input">
                                    <div class="inp_bundle">
                                        <input type="text" name="mem_id"  value="${cookie.REMEMBER_ID.value}" class="inp" placeholder="아이디" />
                                    </div>
                                    <!--// 아이디 -->

                                    <!-- 비밀번호 -->
                                    <div class="inp_bundle">
                                        <input type="password" name="mem_passwd" class="inp flex"
                                            placeholder="비밀번호 (영문, 숫자, 특수문자 포함 8~30자)" />
                                    </div>
                                    <!--// 비밀번호 -->
                                </div>

                                <div class="input_bottom">
                                    <div class="checkbox_ui type1">
                                        <input type="checkbox" id="rememberId" name="rememberId" <c:if test="${not empty cookie.REMEMBER_ID.value}">checked</c:if>>
                                        <label for="rememberId">아이디 저장</label>
                                    </div>
                                    <div class="find_btns">
                                        <a href="memberFind" onclick="">아이디 찾기</a>
                                        <a href="memberFind" onclick="">비밀번호 찾기</a>
                                    </div>
                                </div>


                                <input type="submit" class="btn_login btn_typeB2" value="로그인">

                                <div class="login_other">
                                    <ul class="clear">
                                        <li>
                                            <a href="" onclick="" class="naver">
                                                <span></span>
                                                <span>네이버로 로그인</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>

                                <div class="join">
                                    <p>아이디가 없으신가요? </p>
                                    <a href="signup">회원가입</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
               </form>
                <!--// 로그인 -->

            </article>
            <!--[E] 서브컨텐츠 -->
        </div>
    </div>
    
	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>



</body>

</html>