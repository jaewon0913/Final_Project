<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 파비콘 -->

<link rel="shortcut icon" href="resources/bootstrap/image/favicon.ico" type="image/x-icon">

<!-- 파비콘 -->
<meta charset="UTF-8">
<title>공지사항 게시판 수정</title>
</head>
<body>
	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../header.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->

	<div class="container">
		<h1>공지사항 게시판 수정</h1>
		<br/>
		<div class="container col-sm-12 " style="padding-left: 10%;"> 
		<form action="notice_update.do?notice_postnum=${NoticeDto.notice_postnum}" method="post" >
			<table class="table" >
				
				<tr>
					<th>번 호</th>
					<td id="notice_postnum">${NoticeDto.notice_postnum}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${NoticeDto.member_id }</td>
				</tr>
				<tr>
					<th>제 목</th>
					<td><input type="text" value="${NoticeDto.notice_title}" name="notice_title" ></td>
				</tr>
				<tr>
					<th>내 용</th>
					<td>
					<textarea rows="40" cols="100"  name="notice_content">${NoticeDto.notice_content}</textarea></td>
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
					<td colspan="5" align="right">
					<input class="btn btn-outline-light" type="submit" value="수정" >
					<input class="btn btn-outline-light" type="button" value="취소" onclick="location.href='notice_list.do'">
					</td>
				</tr>
			</table>
			</form>

</div>
	</div>
	
	
	<!-- ------------------------푸터-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------푸터-------------------------------------------- -->

</body>
</html>