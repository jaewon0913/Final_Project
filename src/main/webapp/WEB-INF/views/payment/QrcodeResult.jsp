<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
 function receiveChk(){
	 alert("이미 수령하였습니다.");
	 location.href="mainpage.do";
 }
</script>
<body>
<%@ include file="../header.jsp"%>
<div class="container">
	<h1>qrcode 페이지</h1>

	<form action="receive.do" method="post">
	<input type="hidden" name="member_id" value="${dto.member_id }">
	<input type="hidden" name ="ordernumber" value="${dto.ordernumber }">
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
			<th>아이디</th>
			<td>${dto.member_id }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${dto.member_name }</td>
		</tr>
		<tr>
			<th>도시락 이름</th>
			<td>${dto.dosirak_title }</td>
		</tr>
		<tr>
			<th>배달 시간</th>
			<td>${dto.dosirak_delivery }</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${dto.price }</td>
		</tr>
		<tr>
			<th>주문 시간</th>
			<td>${dto.order_regdate }</td>
		</tr>
		<c:choose>
			<c:when test="${dto.receivechk eq 'N'}">
				<tr>
					<td colspan="2">
						<input type="submit" value="수령하기" class="btn btn-outline-light">
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="2" align="right">
						<input type="button" value="수령완료" onclick="receiveChk()" class="btn btn-outline-light">
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	</form>
	</div>
<%@ include file="../footer.jsp"%>
</body>
</html>