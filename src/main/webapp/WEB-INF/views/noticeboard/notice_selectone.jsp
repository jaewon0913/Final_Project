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
	<div>
		<h1>공지사항 게시판</h1>
			<table class="table">
				
				<tr>
					<th>번 호</th>
					<td id="notice_postnum">${NoticeDto.notice_postnum}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${NoticeDto.notice_writer }</td>
				</tr>
				<tr>
					<th>제 목</th>
					<td>${NoticeDto.notice_title}</td>
				</tr>
				<tr>
					<th>내 용</th>
					<td>${NoticeDto.notice_content}</td>
				</tr>
				<tr>	
					<th>작성일</th>
					<td>${NoticeDto.notice_regdate}</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${NoticeDto.notice_views}</td>
				</tr>

							
				<tr>
					<td colspan="5" align="right"><input class="btn" type="button" value="글쓰기"
						onclick="location.href='notice_insertform.do'"></td>
				</tr>
			</table>


	</div>




	<!-- ------------------------푸터-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------푸터-------------------------------------------- -->

</body>
</html>