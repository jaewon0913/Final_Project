<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp"%>

	<h1>QRcode 조회</h1>

	<table>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td>조회할 QR코드가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.order_regdate }</td>
					</tr>
					<tr>
						<td>${dto.qrcode }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td><input type="button" value="홈 화면" onclick="location.href='mainpage.do'"></td>
		</tr>
	</table>
	
<%@ include file="../footer.jsp"%>
</body>
</html>