<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
</head>
<body>

	<%@ include file="../header.jsp"%>

	<h2>자유게시판 상세보기</h2>
	<table class="table table-hover">
	
		<col width="100">
		<col width="300">
		<col width="200">
		<col width="300">
	
	  	<%-- <tr>
	  		<th>번 호</th>
	  		<th>${dto.free_postnum }</th>
	  	</tr> --%>
<%-- 	  	<tr>
	  		<th>번 호</th>
	  		<th><input type="text" name="free_postnum" value="${dto.free_postnum }" readonly="readonly" size="60"></th>
	  	</tr>
	  	
	  	<tr>
			<th>작성자</th>
			<td><input type="text" name="memeber_name" value="${dto.member_name }" readonly="readonly" size="60"></td>
			
		</tr>
		<tr>
			<th>제  목</th>
			<td><input type="text"	name="free_title" value="${dto.free_title }" readonly="readonly" size="60"></td>
		</tr>
		<tr>
			<th>내  용</th>
			<td><input type="text" name="free_content" value="${dto.free_content }" readonly="readonly" size="60"></td>
		</tr> --%>
		<tr>
			<th>번호</th>
			<td>${dto.free_postnum }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${dto.free_regdate }</td>
		</tr>
		
		<tr>
			<th>작성자</th>
			<td>${dto.member_name }</td>
		</tr>
		<tr>
			<th>제   목</th>
			<td>${dto.free_title }</td>
		</tr>
		<tr>
			<th>내   용</th>
			<td><textarea readonly="readonly">${dto.free_content }</textarea></td>
		</tr>
			

		<tr>
			<td colspan="3">
					<input type="button" value=" 목록으로 " onclick="location.href='freeboard_list.do'">
					<c:choose>
					<c:when test="${logindto.member_id ne null }">
					<input type="button" value=" 글수정 " onclick="location.href='freeboard_updateform.do?free_postnum=${dto.free_postnum }'">
					<input type="button" value=" 삭  제 " onclick="location.href='freeboard_delete.do?free_postnum=${dto.free_postnum }'">
					</c:when>
					</c:choose>
			</td>
		</tr>	
	</table>




	<br>
	<br>
	
	<%@ include file="../footer.jsp"%>

</body>
</html>