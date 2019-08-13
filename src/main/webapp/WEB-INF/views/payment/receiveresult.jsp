<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../header.jsp"%>

	<h1>수령 완료 페이지</h1>

	<table>
	<c:choose>
			<c:when test="${dto.receivechk eq 'N'}">
				<tr>
					<td colspan="2">수령 전</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="2">수령완료 </td>
				</tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td>${dto.member_name }님의 도시락을 수령 완료 하였습니다.</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="홈" onclick="location.href='mainpage.do'">
			</td>
		</tr>
	</table>
	
	
<%@ include file="../footer.jsp"%>

</body>
</html>