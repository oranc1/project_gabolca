<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
	<style>
.list_head,
.list_cont {
  display: flex;
  align-items: center;
}

.list_num,
.list_car,
.txt_prev,
.writter_name,
.writter,
.readcount,
.date {
  flex: 1;
  text-align: center;
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
                                    <p class="writter">조회수</p>
                                    <p class="date">날짜</p>
                                </li>
                                
                                <c:forEach var="question" items="${qstBoardList}">
                                <li class="list_cont">
                                    <p class="list_num">${question.qst_idx}</p>
                                    <p class="list_car">${question.qst_type}</p>
                                    <div class="txt_prev">
                                        <h4><a href="QuestionDetail?qst_idx=${question.qst_idx}&pageNum=${pageNum}">${question.qst_subject}</a></h4> <!-- 링크를 제목으로 이동 -->
                                    </div>
                                    <p class="writter">
                                        <span class="writter_name">${question.mem_name}</span>
                                    </p>
									<p class="readcount">
									    <span class="readcount">0</span>
									</p>
                                    <p class="date">
                                        <fmt:formatDate value="${question.qst_date}" pattern="yy-MM-dd HH:mm" />
                                    </p>
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
						            <c:choose>
						                <c:when test="${pageNum > 1 }">
						                    <a href="QuestionList?pageNum=${pageNum - 1}" class="pg_page">이전</a>
						                </c:when>
						                <c:otherwise>
						                    <a class="pg_page disabled" disabled>이전</a>
						                </c:otherwise>
						            </c:choose>
						
						            <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
						                <c:choose>
						                    <c:when test="${pageNum eq i }">
						                        <strong class="pg_current">${i }</strong>
						                    </c:when>
						                    <c:otherwise>
						                        <a href="QuestionList?pageNum=${i }" class="pg_page">${i }</a>
						                    </c:otherwise>
						                </c:choose>
						            </c:forEach>
						
						            <c:choose>
						                <c:when test="${pageNum < pageInfo.maxPage }">
						                    <a href="QuestionList?pageNum=${pageNum + 1}" class="pg_page pg_next">다음</a>
						                </c:when>
						                <c:otherwise>
						                    <a class="pg_page pg_next disabled" disabled>다음</a>
						                </c:otherwise>
						            </c:choose>
						
						            <c:choose>
						                <c:when test="${pageNum < pageInfo.maxPage }">
						                    <a href="QuestionList?pageNum=${pageInfo.maxPage }" class="pg_page pg_end">맨끝</a>
						                </c:when>
						                <c:otherwise>
						                    <a class="pg_page pg_end disabled" disabled>맨끝</a>
						                </c:otherwise>
						            </c:choose>
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
