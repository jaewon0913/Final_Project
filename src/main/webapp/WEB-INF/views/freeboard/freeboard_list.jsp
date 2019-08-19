<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
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
	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../header.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->
		<h1>자유 게시판</h1>
<div class="container" style="margin-bottom: 5%;">

	
		<c:choose>
			<c:when test="${empty list }">
				<h3>고객 정보가 없습니다. ㅜ.ㅜ...</h3>
			</c:when>
			<c:otherwise>
			<div class="container">
				<form action="muldel.do" method="post">
					<table class="table">
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
								<td><input type="checkbox" name="chk"
									value="${dto.member_id} }"></td>
								<td>${dto.member_name }</td>
								<td><a
									href="freeboad_detail.do?free_title=${dto.free_title }">${dto.free_title }</a></td>
								<td>${dto.free_views }</td>
								<td>${dto.free_regdate }</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="5" align="right"><input type="button" value="처음으로"
								onclick="location.href='mainpage.jsp'" class="btn btn-outline-light"> <input
								type="button" value="글쓰기"
								onclick="location.href='freeboard_detail.do" class="btn btn-outline-light"></td>
						</tr>
					</table>
				</form>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->

</body>
</html>