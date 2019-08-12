<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<!-- 파비콘 -->

<link rel="shortcut icon" href="resources/bootstrap/image/favicon.ico" type="image/x-icon">

<!-- 파비콘 -->
<meta charset="UTF-8">
<title>공지사항 게시판 글작성</title>
<%
	MemberDto logindto = (MemberDto)session.getAttribute("logindto");
%>
</head>
<body>
	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../header.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->
		<div>
			<form action="notice_insert.do" method="post">
		<table class="table table-hover">
			
			<tr>
				<th>작성자</th>
				<td>
				<input type="text" name="member_id" value="${logindto.member_name }" readonly="readonly">
				</td>				
			</tr>
			<tr>
				<th>제 목</th>
				<td><input type="text" name="notice_title"></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea rows="10" cols="60" name="notice_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input class="btn" type="submit" value="작 성" >
					<input class="btn" type="button" value="취 소" onclick="location.href='notice_list.do'">
				</td>
			</tr>
		</table>
	</form>

		
		</div>
	
	
	
	
	<!-- ------------------------푸터-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------푸터-------------------------------------------- -->
	
	
</body>
</html>