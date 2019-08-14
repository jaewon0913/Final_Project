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
<div class="container">
	<h1>결제 완료 페이지</h1>

	<table class="table">
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
		<tr>
			<th>QR코드</th>
			<td>${dto.qrcode }</td>
		</tr>
	</table>
	</div>
	
<%@ include file="../footer.jsp"%>
</body>
</html>