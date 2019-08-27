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
<%
	MemberDto logindto = (MemberDto)session.getAttribute("logindto");
%>
</head>
<body>
	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../header.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->
	<div class="container">
		<h1>공지사항 게시판 상세보기</h1>
		<br/>
		<div class="container col-sm-12 "> 
			<table class="table ">
				
				<tr>
					<th>제 목</th>
					<td>${NoticeDto.notice_title}</td>
					<th>작성자</th>
					<td>${NoticeDto.member_id }</td>
					
				</tr>
				<tr>
					<th>내 용</th>
					<td colspan="6">
					<textarea rows="8" cols="80" readonly="readonly">${NoticeDto.notice_content}</textarea></td>
				</tr>
				<tr>	
					<th colspan="1">작성일</th >
					<td>${NoticeDto.notice_regdate}</td>
					<th colspan="1">조회수</th>
					<td>${NoticeDto.notice_views}</td>
				</tr>

							
				<tr>
					<td colspan="7" align="right">
					<c:choose>
					<c:when test="${logindto.member_id eq 'admin'}">
								<input class="btn btn-outline-light" type="submit" value="수정" onclick="location.href='notice_updateform.do?notice_postnum=${NoticeDto.notice_postnum}'">
								<input class="btn btn-outline-light" type="button" value="삭제" onclick="location.href='notice_delete.do?notice_postnum=${NoticeDto.notice_postnum}'">
								<input class="btn btn-outline-light" type="button" value="목록" onclick="location.href='notice_list.do'">
					</c:when>
					<c:otherwise>
						<input class="btn btn-outline-light" type="button" value="목록" onclick="location.href='notice_list.do'">
					</c:otherwise>
				</c:choose>
					
					
					</td>
				</tr>
			</table>

</div>
	</div>




	<!-- ------------------------푸터-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------푸터-------------------------------------------- -->

</body>
</html>