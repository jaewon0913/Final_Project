<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../header.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->
		<div>
			<form action="dosirak_insertres.do" method="post">
		<table class="table table-hover">
			
			<tr>
				<th>도시락이름</th>
				<td><input type="text" name="dosirak_name"></td>				
			</tr>
			<tr>
				<th>도시락제목</th>
				<td><input type="text" name="dosirak_title"></td>				
			</tr>
			<tr>
				<th>도시락내용</th>
				<td><input type="text" name="dosirak_content"></td>				
			</tr>
			<tr>
				<th>도시락배달시간</th>
				<td><input type="text" name="dosirak_delivery"></td>				
			</tr>
			<tr>
				<th>도시락가격</th>
				<td><input type="text" name="dosirak_price"></td>				
			</tr>
			<tr>
				<th>탄수화물</th>
				<td><input type="text" name="tan"></td>				
			</tr>
			<tr>
				<th>단백질</th>
				<td><input type="text" name="dan"></td>				
			</tr>
			<tr>
				<th>지방</th>
				<td><input type="text" name="gi"></td>				
			</tr>
			<tr>
				<th>칼로리</th>
				<td><input type="text" name="kcal"></td>				
			</tr>
			<tr>
				<th>이미지1</th>
				<td><input type="text" name="image1"></td>				
			</tr>
			<tr>
				<th>이미지2</th>
				<td><input type="text" name="image2"></td>				
			</tr>
			<tr>
				<th>이미지3</th>
				<td><input type="text" name="image3"></td>				
			</tr>
			
			<tr>
				<td colspan="12">
					<input class="btn" type="submit" value="작 성" >
					<input class="btn" type="button" value="취 소">
				</td>
			</tr>
		</table>
	</form>

		
		</div>
	
	
	<!-- ------------------------푸터-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------푸터-------------------------------------------- -->
	

</body>
</html>