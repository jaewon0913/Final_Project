<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.orderbtn{
		width : 8rem;
		height : 5rem;
	}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
	
		<div style = "float : right">
			<input type="button" class = "orderbtn btn btn-outline-light" style = "font-size : 2rem;" value="오늘" onclick="location.href='todayorderresult.do?member_id=${member_id}'">
			<input type="button" class = "orderbtn btn btn-outline-light" style = "font-size : 2rem;" value="일주일" onclick="location.href='weekorderresult.do?member_id=${member_id}'">
			<input type="button" class = "orderbtn btn btn-outline-light" style = "font-size : 2rem;" value="1개월" onclick="location.href='monthorderresult.do?member_id=${member_id}'">
		</div>
		<br>
	
		<c:choose>
			<c:when test="${empty list }">
				<div>
					<p>결제내역이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
			
		<c:forEach items="${list }" var="dto">
			<table style="float: left; width: 50%; vertical-align: center; margin-bottom: 5rem; margin-top: 3rem; margin-left: 1rem; " class="table">
					<tr>
						<th>결제일</th>
						<td>${dto.order_regdate }</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>${dto.dosirak_title }</td>
					</tr>
					<tr>
						<th>배달 시간</th>
						<td>${dto.dosirak_delivery }</td>
					</tr>
					<tr>
						<th>상품 가격</th>
						<td>${dto.dosirak_price }</td>
					</tr>
					<c:if test="${dto.dish1 != null && dto.dish1 != '없음'}">
					<tr>
						<th>반찬1</th>
						<td>${dto.dish1 }</td>
					</tr>
					<tr>
						<th>반찬2</th>
						<td>${dto.dish2 }</td>
					</tr>
					<tr>
						<th>반찬3</th>
						<td>${dto.dish3 }</td>
					</tr>
					<tr>
						<th>반찬4</th>
						<td>${dto.dish4 }</td>
					</tr>
					<tr>
						<th>반찬5</th>
						<td>${dto.dish5 }</td>
					</tr>
					<tr>
						<th>반찬6</th>
						<td>${dto.dish6 }</td>
					</tr>
					<tr>
						<th>반찬7</th>
						<td>${dto.dish7 }</td>
					</tr>
					</c:if>
					<tr>
						<th>수령인</th>
						<td>${dto.get_name }</td>
					</tr>
					<tr>
						<th>수령인 휴대폰 번호</th>
						<td>${dto.get_phone }</td>
					</tr>
					<tr>
						<th>수령 장소</th>
						<td>${dto.get_subway }</td>
					</tr>
					<tr>
						<th>총 금액</th>
						<td>${dto.price }</td>
					</tr>

				</table>
				
			</c:forEach>
			</c:otherwise>
		</c:choose>
</div>

<%@ include file="../footer.jsp"%>
</body>
</html>