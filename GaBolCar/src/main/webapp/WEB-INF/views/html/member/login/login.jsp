<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 네이버 로그인 관련 모듈 --%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<%-- 0627 배경인 수정 네이버 로그인 --%>
  <%
    String clientId = "iyG93Byk9xPFZKJeZAaH";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8089/project_gabolcar/login/oauth2/code/naver", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
 <%-- ======================= --%>
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
    
    <%-- 0627 배경인 수정 네이버 로그인 js --%>
<!--     <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> -->
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
<!--                                         <a href="memberFind" onclick="">비밀번호 찾기</a> -->
                                        <a href="memberFind" onclick="">아이디/비밀번호 찾기</a>
                                    </div>
                                </div>


                                <input type="submit" class="btn_login btn_typeB2" value="로그인">

                                <div class="login_other">
                                    <ul class="clear">
                                        <li>
<!--                                             <a href="" onclick="" class="naver"> -->
<!--                                                 <span></span> -->
<!--                                                 <span>네이버로 로그인</span> -->
<!--                                             </a> -->

											<!-- 네이버 로그인 버튼 노출 영역 -->
<!-- 										    <div id="naver_id_login"></div> -->
  											<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
  
										    <!-- //네이버 로그인 버튼 노출 영역 -->
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

<%-- 0627 배경인 수정 네이버 로그인 --%>
<%-- 네이버 로그인 --%>
    <script type="text/javascript">
//         var naver_id_login = new naver_id_login("iyG93Byk9xPFZKJeZAaH", "http://localhost:8089/project_gabolcar/login/oauth2/code/naver");
//         var state = naver_id_login.getUniqState();
//         naver_id_login.setButton("white", 2,40);
//         naver_id_login.setDomain("http://localhost:8089/");
//         naver_id_login.setState(state);
//         naver_id_login.setPopup();
//         naver_id_login.init_naver_id_login();
    </script>

</body>

</html>