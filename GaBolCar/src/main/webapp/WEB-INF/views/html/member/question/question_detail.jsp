<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%-- JSTL 의 함수를 사용하기 위해 functions 라이브러리 추가 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
    <link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">
    <link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/member/question/question_detail.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script>
	function confirmDelete() {
		let isDelete = confirm("정말 삭제하시겠습니까?");
		
		// isDelete 가 true 일 때 BoardDelete 서블릿 요청
		if(isDelete) {
			location.href='QuestionDelete?qst_idx=${question.qst_idx}&pageNum=${pageNum}';
		}
	}
</script> 
<title>1:1 문의 게시판 상세보기</title>
</head>
<body>
    <header>
        <jsp:include page="../../../inc/top1.jsp"></jsp:include>
    </header>
    <div id="notice_cont">
        <section id="sec_con" class="inr">
            <h1 class="con_title">1:1 문의 게시판</h1>
            <form action="" method="get">
                <c:set var="loginId" value="${member.mem_id}"/>
                <section id="board_wrap">
                    <section id="board_list" class="notice">
                        <div class="wrapper">
                            <div class="list_wrap">
                                <ul class="list">
                                    <li>
                                        <div class="subject">
                                            ${question.qst_subject} <!-- 1:1 문의 게시판 작성 제목 DB 불러오기 -->
                                        </div>
                                    </li>
                                    
                                    <li class="write_info">
                                        <div class="write_box">
                                            <span class="write_t">작성자명</span>
                                            <span class="write_c">${question.mem_name }</span>
                                        </div>
                                        <div class="write_box">
                                            <span class="write_t">등록일</span>
                                            <span class="write_c"><fmt:formatDate value="${question.qst_date}" pattern="yyyy-MM-dd"/></span>
                                        </div>
                                        <div class="write_box">
                                            <span class="write_t">구분</span>
                                            <span class="write_c">${question.qst_type}</span>
                                        </div>
                                    </li>
                                </ul>
                                <div class="write_cont">
                                    <!-- 작성글 출력 -->
                                    <p>
                                        ${question.qst_content}
                                    </p>
                                </div>

                                <div class="mod_box">
                                    <a href="QuestionListForm?qst_idx=${question.qst_idx}&pageNum=${pageNum}" class="modify_btn">목록</a>
					                <c:if test="${loginId eq 'admin@naver.com'}">
					                    <a href="QuestionReplyForm?qst_idx=${question.qst_idx}&pageNum=${pageNum}" class="modify_btn">답변</a>&nbsp;&nbsp;&nbsp;&nbsp;
					                </c:if>
                                    <a href="QuestionModifyForm?qst_idx=${question.qst_idx}&pageNum=${pageNum}" class="modify_btn">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a class="modify_delete" onclick="confirmDelete()">삭제</a>
                                </div>

                            </div>
                        </div>
                    </section>
                </section>
            </form>
        </section>
    </div>
    <footer>
        <jsp:include page="../../../inc/footer.jsp"></jsp:include>
    </footer>
</body>
</html>
