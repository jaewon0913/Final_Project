<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
			<form:form action="dosirak_insert.do" method="post" enctype="multipart/form-data">
		<table class="table table-hover">
			
			<tr>
				<th>도시락이름</th>
				<td><input type="text" name="dosirak_name" required="required"></td>				
			</tr>
			<tr>
				<th>도시락제목</th>
				<td><input type="text" name="dosirak_title" required="required"></td>				
			</tr>
			<tr>
				<th>도시락내용</th>
				<td><input type="text" name="dosirak_content" required="required"></td>				
			</tr>
			<tr>
				<th>도시락배달시간</th>
				<td><input type="text" name="dosirak_delivery" required="required"></td>				
			</tr>
			<tr>
				<th>도시락가격</th>
				<td><input type="text" name="dosirak_price" required="required"></td>				
			</tr>
			<tr>
				<th>도시락주문량</th>
				<td><input type="text" name="dosirak_afternum" required="required"></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><input type="text" name="dosirak_views" required="required"></td>
			<tr>
			<tr>
				<th>탄수화물</th>
				<td><input type="text" name="tan" required="required"></td>				
			</tr>
			<tr>
				<th>단백질</th>
				<td><input type="text" name="dan" required="required"></td>				
			</tr>
			<tr>
				<th>지방</th>
				<td><input type="text" name="gi" required="required"></td>				
			</tr>
			<tr>
				<th>칼로리</th>
				<td><input type="text" name="kcal" required="required"></td>				
			</tr>
			<tr>
				<th>메인이미지</th>
				<td><input multiple="multiple" type="file" name="file" required="required"></td>				
			</tr>
			<tr>
				<th>썸네일이미지</th>
				<td><input multiple="multiple" type="file" name="file2" required="required"></td>				
			</tr>
			<tr>
				<td colspan="12">
					<input class="btn" type="submit" value="작 성" >
					<input class="btn" type="button" value="취 소">
				</td>
			</tr>
		</table>
	</form:form>
	

		
		</div>	
	
	<!-- ------------------------푸터-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------푸터-------------------------------------------- -->


</body>
</html>

			

	<!-- <form name="multifileupload" action="multifileupload.do" method="post" enctype="multipart/form-data">
		<label>썸네일이미지</label>
		
		<input multiple="multiple" type="file" name="multifile">
		
		<input type="text" name="multisrc">
		
		<input type="submit" value="전송">
	</form> -->