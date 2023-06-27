<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_sidebar.css">
<%--     <link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="stylesheet"> --%>
<%--     <link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="stylesheet"> --%>
    <link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/member/question/question_write_form.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
    <title>1:1 문의 게시판</title>
<!-- 브랜치 병합 되는지 확인 3-->
</head>
<body>
    <header>
<%--         <jsp:include page="../../../inc/top1.jsp"></jsp:include> --%>
    </header>
    <div id="notice_cont">
        <section id="sec_con" class="inr">
            <h1 class="con_title">관리자 페이지</h1>
            <div class="main-content">
            <jsp:include page="../../../inc/adm_sidebar.jsp" />
            <div class="board_container">
            <form action="QuestionWritePro" name="QuestionWritePro" method="post" >
                <section id="board_wrap">
                    <section id="board_list" class="notice">
                        <div class="wrapper">
                            <div class="list_wrap">
                                <ul class="list">
                                    <li>
                                        <div class="category"><label for="qst_type">분류</label>  
                                            <select name="qst_type" id="qst_type" required="required">
                                                <option value="" selected>선택하세요</option>
                                                <option value="예약">예약</option>
                                                <option value="예약 취소">예약 취소</option>
                                                <option value="환불">환불</option>
                                                <option value="기타">기타</option>
                                            </select>
                                        </div>
										<div class="writer">
										    <input type="text" name="mem_name" id="mem_name" class="inputBox" value="${member.mem_name}" readonly >
										</div>
                                    </li>
                                    <li>
<!--                                         <div class="password"> -->
<!--                                             <input type="password" name="qst_pass" id="qst_pass" placeholder="비밀번호를 입력해주세요" class="inputBox"> -->
<!--                                         </div> -->
                                        <div class="title">
                                            <input type="text" name="qst_subject" id="qst_subject" placeholder="제목을 입력해주세요" class="inputBox">
                                        </div>
                                    </li>
                                </ul>
                                <div class="write_cont">
                                    <p>
                                        <textarea name="qst_content" id="qst_content" rows="" cols="" class="inputBox" placeholder="내용을 입력해주세요"></textarea>
                                    </p>
                                </div>
                                <div class="mod_box">
									<a href="QuestionListForm?qst_idx=${question.qst_idx}&pageNum=${pageNum}">
									    <input type="button" class="delete_btn" value="목록">
									</a>                                    
									<input type="submit" class="delete_btn" value="등록">
                                </div>
                            </div>
                        </div>
                    </section>
                </section>
            </form>
            </div>
            </div>
        </section>
    </div>
    <footer>
<%--         <jsp:include page="../../../inc/footer.jsp"></jsp:include> --%>
    </footer>
</body>
</html>
