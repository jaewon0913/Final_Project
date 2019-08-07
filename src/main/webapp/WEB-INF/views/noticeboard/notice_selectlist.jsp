<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 파비콘 -->

<link rel="shortcut icon" href="resources/bootstrap/image/favicon.ico" type="image/x-icon">

<!-- 파비콘 -->
<meta charset="UTF-8">
<title>공지사항 게시판</title>
</head>
<body>
	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../header.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->
	<div class="container">
		<h1>공지사항 게시판 리스트</h1>
		<br/>
		<div class="container col-sm-12 text-center"> 
			<table class="table table-hover">
				
				<tr>
					<th>번 호</th>
					<th>작성자</th>
					<th>제 목</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>

				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="5" align="center">=======작성된 글이 존재하지
								않습니다.=======</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${ list}" var="NoticeDto">
							<tr>
								<td id="seq">${NoticeDto.notice_postnum}</td>
								<td>${NoticeDto.member_id }</td>
								<td><a href="notice_detail.do?notice_postnum=${NoticeDto.notice_postnum}">${NoticeDto.notice_title}</a></td>
								<td>${NoticeDto.notice_regdate}</td>
								<td>${NoticeDto.notice_views}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<td colspan="5" align="right"><input class="btn btn-outline-dark" type="button" value="글쓰기"
						onclick="location.href='notice_insertform.do'"></td>
				</tr>
			</table>
		</div>

	</div>




	<!-- ------------------------푸터-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------푸터-------------------------------------------- -->

</body>
</html>