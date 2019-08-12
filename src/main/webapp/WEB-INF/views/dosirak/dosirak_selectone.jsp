<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>도시락 상세 보기</h1>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<td><input type="text" name="dosirak_postnum" value="${dto.dosirak_postnum}" required="required"></td>
		</tr>
		
		<tr>
			<th>도시락이름</th>
			<td><input type="text" name="dosirak_name" value="${dto.dosirak_name}" required="required"></td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td><input type="text" name="dosirak_title" value="${dto.dosirak_title}" required="required"></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td><input type="text" name="dosirak_content" value="${dto.dosirak_content}" required="required"></td>
		</tr>
		
		<tr>
			<th>배달시간</th>
			<td><input type="text" name="dosirak_delivery" value="${dto.dosirak_delivery}" required="required"></td>
		</tr>
		
		<tr>
			<th>가격</th>
			<td><input type="text" name="dosirak_price" value="${dto.dosirak_price}" required="required"></td>
		</tr>
		
		<tr>
			<th>수량</th>
			<td><input type="text" name="dosirak_num" value="${dto.dosirak_num}" required="required"></td>
		</tr>
		
		<tr>
			<th>주문수량</th>
			<td><input type="text" name="dosirak_afternum" value="${dto.dosirak_afternum}" required="required"></td>
		</tr>
		
		<tr>
			<th>탄수화물</th>
			<td><input type="text" name="tan" value="${dto.tan}" required="required"></td>
		</tr>
		
		<tr>
			<th>단백질</th>
			<td><input type="text" name="dan" value="${dto.dan}" required="required"></td>
		</tr>
		
		<tr>
			<th>지방</th>
			<td><input type="text" name="gi" value="${dto.gi}" required="required"></td>
		</tr>
		
		<tr>
			<th>칼로리</th>
			<td><input type="text" name="kcal" value="${dto.kcal}" required="required"></td>
		</tr>
		
		<tr>
			<th>이미지1</th>
			<td><input type="text" name="image1" value="${dto.image1}" required="required"></td>
		</tr>
		
		<tr>
			<th>이미지2</th>
			<td><input type="text" name="image2" value="${dto.image2}" required="required"></td>
		</tr>
		
		<tr>
			<th>이미지3</th>
			<td><input type="text" name="image3" value="${dto.image3}" required="required"></td>
		</tr>
		
		<tr>
			<th>날짜</th>
			<td><input type="text" name="dosirak_regdate" value="${dto.dosirak_regdate}" required="required"></td>
		</tr>
		
		<tr>
			<td colspan="16">
				<input type="submit" value="수 정" onclick="" />
				<input type="button" value="삭 제" onclick="" />
				<input type="button" value="이 전" onclick="location.href='dosirak_list.do'" />
			</td>
		</tr>
		
	</table>

</body>
</html>