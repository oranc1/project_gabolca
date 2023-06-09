<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      

<!DOCTYPE html>
<html>
<head>
<style>


</style>

    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_sidebar.css">
    
<%--     <link href="${pageContext.request.contextPath}/resources/css/inc/top.css" rel="styleSheet"> --%>
<%--     <link href="${pageContext.request.contextPath}/resources/css/inc/footer.css" rel="styleSheet"> --%>
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/member/question/question_board.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/resources/js/inc/jquery-3.7.0.js"></script>
</head>
<body>

	<c:set var="pageNum" value="1" />
	<c:if test="${not empty param.pageNum }">
		<c:set var="pageNum" value="${param.pageNum }" />
	</c:if>

    <header>
<%--         <jsp:include page="../../../inc/top1.jsp"></jsp:include> --%>
    </header>
                
     <div id="notice_cont">
        <section id="sec_con" class="inr">
            <h1 class="con_title">관리자 페이지</h1>
            <div class="main-content">
				<jsp:include page="../../../inc/adm_sidebar.jsp" />
            <section id="board_list" class="notice board_section">
            <section id="board_list" class="notice">
                <section id="buttonArea">
				<form action="QuestionListForm" method="GET" class="search-form">
				    <select name="searchType" id="searchType">
				        <option value="subject" <c:if test="${param.searchType eq 'subject' }">selected</c:if>>제목</option>          
				        <option value="content" <c:if test="${param.searchType eq 'content' }">selected</c:if>>내용</option>          
				        <option value="subject_content" <c:if test="${param.searchType eq 'subject_content' }">selected</c:if>>제목&내용</option>          
				        <option value="name" <c:if test="${param.searchType eq 'name' }">selected</c:if>>작성자</option>        
				    </select>
				    <input type="text" name="searchKeyword" value="${param.searchKeyword }" id="searchKeyword">
				    <input type="submit" id="search" value="검색">
				</form>
                </section>
                <section id="board_wrap">    
                    <div class="wrapper">
                        <div class="list_wrap">
                            <ul class="list">
                                <li class="list_head">
<!--                                     <p class="list_num">번호</p> -->
                                    <p class="list_car">구분</p>
                                    <div class="txt_prev">
                                        <h4>제목</h4>
                                    </div>
                                    <p class="writter">
                                        <span class="writter_name">
                                        
                                        글쓴이
                                        </span>
                                    </p>     
                                    <p class="writter">조회수</p>
                                    <p class="date">날짜</p>
                                </li>
							<c:forEach var="question" items="${qstBoardList}">
								<li class="list_cont">
								    <p class="list_car">${question.qst_type}</p>
								    <div class="txt_prev">
								        <c:if test="${question.qst_board_re_lev > 0 }">
								            <c:forEach var="i" begin="1" end="${question.qst_board_re_lev }">
								            </c:forEach>
<%-- 								            <img class="subject-align" src="${pageContext.request.contextPath }/resources/img/re.gif" style= "width: 25px;"> --%>
								        </c:if>
								        <h4 class="subject-align">
								            <%-- 인라인 스타일을 사용하여 전체 h4 영역이 링크로 작동하도록 함. --%>
								            <a href="QuestionDetail?qst_idx=${question.qst_idx}&pageNum=${pageNum}" >
								                ${question.qst_subject}
								            </a>
								        </h4>
								    </div>
								    <p class="writter">
								        <span class="writter_name">${question.mem_name}</span>
								    </p>
								    <p class="readcount">
								        <span class="readcount">${question.qst_readcount}</span>
								    </p>
								    <p class="date">
								        <fmt:formatDate value="${question.qst_date}" pattern="yyyy-MM-dd HH:mm"/>
								    </p>
								</li>			
							</c:forEach>
                            </ul>
                        </div>
                        <div class="write_btn">
                            <a href="QuestionWriteForm">글쓰기</a>
                        </div>
						<div class="list_pager_wrap">
						    <nav class="pg_wrap">
						        <span class="pg">
                                <section id="pageList">
                                        <c:choose>
                                            <c:when test="${pageNum > 1 }">
                                                <a href="QuestionListForm?pageNum=1" class="pg_page pg_start" id="begin">맨처음</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="pg_page pg_start disabled" disabled id="begin">맨처음</a>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${pageNum > 1 }">
                                                <input type="button" value="이전" onclick="location.href='QuestionListForm?pageNum=${pageNum - 1}'" id="previous">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="button" value="이전" disabled="disabled" id="previous">
                                            </c:otherwise>
                                        </c:choose>     
                                        <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
                                            <!-- 각 페이지마다 하이퍼링크 설정 -->
                                            <c:choose>
                                                <c:when test="${pageNum eq i }">
                                                    <b id="number">${i }</b>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="QuestionListForm?pageNum=${i }">${i }</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach> 
                                        <c:choose>
                                            <c:when test="${pageNum < pageInfo.maxPage }">
                                                <input type="button" value="다음" onclick="location.href='QuestionListForm?pageNum=${pageNum + 1}'" id="next">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="button" value="다음" disabled="disabled" id="next">
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${pageNum < pageInfo.maxPage }">
                                                <a href="QuestionListForm?pageNum=${pageInfo.maxPage }" class="pg_page pg_end" id="end">맨끝</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="pg_page pg_end disabled" disabled id="end">맨끝</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </section>
						        </span>
						    </nav>
						</div>	
                    </div>
                </section>
            </section>
 
            
            </section>
            </div>
        </section>
    </div>
    <footer>
<%--         <jsp:include page="../../../inc/footer.jsp"></jsp:include> --%>
    </footer>
</body>
</html>
