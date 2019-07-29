<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>
</head>
<body>
	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../header.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->
	<div>
		<h1>공지사항 게시판</h1>
			<table class="table table-hover">
				
				<tr>
					<th>번 호</th>
					<th>작성자</th>
					<th>제 목</th>
					<th>작성일</th>
				</tr>

				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="4" align="center">=======작성된 글이 존재하지
								않습니다=======</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td id="seq">${dto.notice_postnum}</td>
								<td>${dto.notice_writer }</td>
								<td><a href="notice_detail.do">${dto.notice_title}</a></td>
								<td>${dto.notice_regdate}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<td colspan="4" align="right"><input class="btn" type="button" value="글쓰기"
						onclick="location.href='notice_insertform.do'"></td>
				</tr>
			</table>


	</div>




	<!-- ------------------------푸터-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------푸터-------------------------------------------- -->

</body>
</html>