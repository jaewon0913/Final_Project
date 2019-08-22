<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp"%>

<form action="kakaopay.do" method="POST">
	<table>
		<tr>
			<th>도시락 이름</th>
			<td><input type="text" name="dosirak_name" value="${dosirakdto.dosirak_name }"></td>
		</tr>
		<tr>
			<th>도시락 제목</th>
			<td><input type="text" name="dosirak_title" value="${dosirakdto.dosirak_title }"></td>
		</tr>
		<tr>
			<th>도시락 내용</th>
			<td><input type="text" name="dosirak_content" value="${dosirakdto.dosirak_content }"></td>
		</tr>
		<tr>
			<th>도시락 배달시간</th>
			<td><input type="text" name="dosirak_delivery" value="${dosirakdto.dosirak_delivery }"></td>
		</tr>
		<tr>
			<th>도시락 가격</th>
			<td><input type="text" name="dosirak_price" value="${dosirakdto.dosirak_price }"></td>
		</tr>
		<tr>
			<th>탄수화물</th>
			<td><input type="text" name="tan" value="${dosirakdto.tan }"></td>
		</tr>
		<tr>
			<th>단백질</th>
			<td><input type="text" name="dan" value="${dosirakdto.dan }"></td>
		</tr>
		<tr>
			<th>지방</th>
			<td><input type="text" name="gi" value="${dosirakdto.gi }"></td>
		</tr>
		<tr>
			<th>칼로리</th>
			<td><input type="text" name="kcal" value="${dosirakdto.kcal }"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="결제하기" >
			</td>
		</tr>
	</table>
</form>

<%@ include file="../footer.jsp"%>
</body>
</html>