<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% MemberDto logindto = (MemberDto) session.getAttribute("logindto");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
</head>
<body>

	<%@ include file="../header.jsp"%>

	<h2>이벤트 상세보기</h2>
	<table class="table table-hover">
	
		<col width="100">
		<col width="300">
		<col width="200">
		<col width="300">
	

		<tr>
			<th>번호</th>
			<td>${dto.event_postnum }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${dto.event_regdate }</td>
		</tr>
		
		<tr>
			<th>작성자</th>
			<td>${dto.member_name }</td>
		</tr>
		<tr>
			<th>제   목</th>
			<td>${dto.event_title }</td>
		</tr>
		<tr>
			<th>내   용</th>
			<td><textarea readonly="readonly">${dto.event_content }</textarea></td>
		</tr>
			

		<tr>
			<td colspan="3">
					<input type="button" value=" 목록으로 " onclick="location.href='eventboard_list.do'">
					<c:choose>
					<c:when test="${logindto.member_id ne null }">
					<input type="button" value=" 글수정 " onclick="location.href='eventboard_updateform.do?event_postnum=${dto.event_postnum }'">
					<%-- <input type="button" value=" 삭  제 " onclick="location.href='eventboard_delete.do?event_postnum=${dto.event_postnum }'"> --%>
					<input type="button" value=" 삭  제 " onclick="removeCheck()">
					</c:when>
					</c:choose>
			</td>
		</tr>	
	</table>
	
	
	<!-- 취소 alert -->
	<script type="text/javascript">
	function removeCheck(){
		if(confirm("정말 삭제하시겠습니까 ??") == true){    //확인
			location.href="eventboard_delete.do?event_postnum=${dto.event_postnum }";
			return true;

		}else{  //취소
			return false;
		}
	}
	
	</script>
	<br>
	<br>
	
	
	
	<%@ include file="../footer.jsp"%>

</body>
</html>