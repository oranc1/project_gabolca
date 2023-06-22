<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
	<style>
		section#buttonArea {
	  float: right;
	}
	
	.search-form {
	  margin-top: 40px;
	  padding-right: 70px;
	}
	
	</style>

    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="${pageContext.request.contextPath}/resources/css/inc/top.css" rel="styleSheet">
    <link href="${pageContext.request.contextPath}/resources/css/inc/footer.css" rel="styleSheet">
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/member/question/question_board.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/resources/js/inc/jquery-3.7.0.js"></script>
</head>
<body>
    <header>
        <jsp:include page="../../../inc/top1.jsp"></jsp:include>
    </header>
                
     <div id="notice_cont">
        <section id="sec_con" class="inr">
            <h1 class="con_title">1:1 문의 게시판</h1>
            <section id="board_list" class="notice">
                <section id="buttonArea">
                    <form action="QuestionList" class="search-form">
                        <select name="searchType" id="searchType">
                            <option value="subject" <c:if test="${param.searchType eq 'subject' }">selected</c:if>>제목</option>        
                            <option value="content" <c:if test="${param.searchType eq 'content' }">selected</c:if>>내용</option>        
                            <option value="subject_content" <c:if test="${param.searchType eq 'subject_content' }">selected</c:if>> 제목&내용</option>       
                            <option value="name" <c:if test="${param.searchType eq 'name' }">selected</c:if>>작성자</option>        
                        </select>
                        <input type="text" name="searchKeyword" value="${param.searchKeyword }" id="searchKeyword">
                        <input type="submit" value="검색">
                    </form>
                </section>
                <section id="board_wrap">    
                    <div class="wrapper">
                        <div class="list_wrap">
                            <ul class="list">
                                <li class="list_head">
                                    <p class="list_num">번호</p>
                                    <p class="list_car">구분</p>
                                    <div class="txt_prev">
                                        <h4>제목</h4>
                                    </div>
                                    <p class="writter">
                                        <span class="writter_name">글쓴이</span>
                                    </p>
                                    <p class="date">날짜</p>
                                </li>
                                
                                <c:forEach var="question" items="${qstBoardList}">
                                <li class="list_cont">
                                    <a href="QuestionDetail?qst_idx=${question.qst_idx}&pageNum=${pageNum}">
                                        <p class="list_num">${question.qst_idx}</p>
                                        <p class="list_car">${question.qst_type}</p>
                                        <div class="txt_prev">
                                            <h4>${question.qst_subject}</h4>
                                        </div>
                                        <p class="writter">
                                            <span class="writter_name">${question.mem_name}</span>
                                        </p>
                                        <p class="date">
                                            <fmt:formatDate value="${question.qst_date}" pattern="yy-MM-dd HH:mm" />
                                        </p>
                                    </a>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="write_btn">
                            <a href="QuestionWrietForm">글쓰기</a>
                        </div>
                        <div class="list_pager_wrap">
                            <nav class="pg_wrap">
                                <span class="pg">
                                    <strong class="pg_current">1</strong>
                                    <a href="" class="pg_page">2</a>
                                    <a href="" class="pg_page pg_next">다음</a>
                                    <a href="" class="pg_page pg_end">맨끝</a>
                                </span>
                            </nav>
                        </div>
                    </div>
                </section>
            </section>
        </section>
    </div>
    <footer>
        <jsp:include page="../../../inc/footer.jsp"></jsp:include>
    </footer>
</body>
</html>
