<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 list</title>
</head>
<script type="text/javascript">

	function allChk(val){
		var chks = document.getElementsByName('chk');
		for(var i=0 ; i<chks.length ; i++){
			chks[i].checked = val;
		}
	}

</script>
<body>

	<h1>자유 게시판</h1>

	<c:choose>
		<c:when test="${empty list }">
			<h3>고객 정보가 없습니다. ㅜ.ㅜ...</h3>
		</c:when>
		<c:otherwise>
			<form action="muldel.do" method="post">
				<table border="1">
					<col width = "50" />
					<col width = "200" />
					<col width = "500" />
					<col width = "70" />
					<col width = "100" />
					<tr>
						<th><input type="checkbox" name="allchk"
							onclick="allchk(this.checked)"></th>
						<th>작성자</th>
						<th>제목</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td><input type="checkbox" name="chk" value="${dto.member_id} }"></td>
							<td>${dto.member_name }</td>
							<td><a href="freeboad_detail.do?free_title=${dto.free_title }">${dto.free_title }</a></td>
							<td>${dto.free_views }</td>
							<td>${dto.free_regdate }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5"><input type="button" value="처음으로" onclick="location.href='mainpage.jsp'"> 
							<input type="button" value="글쓰기" onclick="location.href='freeboard_detail.do">
						    
						</td>
					</tr>
				</table>
			</form>
		</c:otherwise>
	</c:choose>

</body>
</html>