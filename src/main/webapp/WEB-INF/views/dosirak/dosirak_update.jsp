<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<form:form action="dosirak_update.do" method="post" enctype="multipart/form-data" >
			<input type="hidden" name="dosirak_postnum" value="${dosirakdto.dosirak_postnum}" />
			<table class="table table-hover">
				<tr>
					<th>도시락이름</th>
					<td><input type="text" name="dosirak_name" value="${dosirakdto.dosirak_name}"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="dosirak_title" value="${dosirakdto.dosirak_title}"></td>
				</tr>

				<tr>
					<th>내용</th>
					<td><input type="text" name="dosirak_content" value="${dosirakdto.dosirak_content}"></td>
				</tr>

				<tr>
					<th>배달시간</th>
					<td><input type="text" name="dosirak_delivery" value="${dosirakdto.dosirak_delivery}"></td>
				</tr>

				<tr>
					<th>가격</th>
					<td><input type="text" name="dosirak_price" value="${dosirakdto.dosirak_price}"></td>
				</tr>

				<tr>
					<th>수량</th>
					<td><input type="text" name="dosirak_num" value="${dosirakdto.dosirak_num}"></td>
				</tr>

				<tr>
					<th>주문수량</th>
					<td><input type="text" name="dosirak_afternum" value="${dosirakdto.dosirak_afternum}">
					</td>
				</tr>

				<tr>
					<th>탄수화물</th>
					<td><input type="text" name="tan" value="${dosirakdto.tan}"></td>
				</tr>

				<tr>
					<th>단백질</th>
					<td><input type="text" name="dan" value="${dosirakdto.dan}"></td>
				</tr>

				<tr>
					<th>지방</th>
					<td><input type="text" name="gi" value="${dosirakdto.gi}"></td>
				</tr>

				<tr>
					<th>칼로리</th>
					<td><input type="text" name="kcal" value="${dosirakdto.kcal}"></td>
				</tr>

				<tr>
					<th>메인이미지</th>
					<td><input type="text" name="mainimage" value="${dosirakdto.mainimage}"></td>
				</tr>
				
				<tr>
					<th>메인이미지</th>
					<td><input multiple="multiple" type="file" name="file"></td>				
				</tr>
					
				<tr>
					<th>썸네일이미지</th>
					<td><input type="text" name="thumbnail" value="${dosirakdto.thumbnail}"></td>
				</tr>
				
				<tr>
					<th>썸네일이미지</th>
					<td><input multiple="multiple" type="file" name="file2"></td>				
				</tr>				
				
				<tr>
					<th>날짜</th>
					<td><fmt:formatDate value="${dosirakdto.dosirak_regdate}" pattern="yyyy-MM-hh"/></td>
				</tr>

				<tr>
					<td colspan="14"><input type="submit" value="수	정">
						<input type="button" value="취	소" onclick="location.href='dosirak_listpaging.do'">
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