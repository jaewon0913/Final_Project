<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.dosirakimg{
	float:left;
	width: 50%;

}
.dosirak_info{
	float: right;
	width: 50%;

}

.doim{
	margin-top: 15rem;
}

</style>
</head>
<body>
	<%@ include file="../header.jsp"%>

	<h1>도시락 상세 보기</h1>
<div class="container" >
<div class="dosirakimg" >
<img alt="test도시락" src="resources/bootstrap/image/do1.jpg" class="doim">
</div>
	<div class="dosirak_info">
	<form action="kakaopay.do" method="POST">
		<table class="table" style="border: none;">
			<tr>
				<th>번호</th>
				<td>
					<input type="text" name="dosirak_postnum" value="${dosirakdto.dosirak_postnum}" required="required" readonly="readonly">
				</td>
			</tr>

			<tr>
				<th>도시락이름</th>
				<td>
					<input type="text" name="dosirak_name" value="${dosirakdto.dosirak_name}" required="required" readonly="readonly">
				</td>
			</tr>

			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="dosirak_title" value="${dosirakdto.dosirak_title}" required="required" readonly="readonly">
				</td>
			</tr>

			<tr>
				<th>내용</th>
				<td>
					<input type="text" name="dosirak_content" value="${dosirakdto.dosirak_content}" required="required" readonly="readonly">
				</td>
			</tr>

			<tr>
				<th>배달시간</th>
				<td>
					<input type="text" name="dosirak_delivery" value="${dosirakdto.dosirak_delivery}" required="required" readonly="readonly">
				</td>
			</tr>

			<tr>
				<th>가격</th>
				<td>
					<input type="text" name="dosirak_price" value="${dosirakdto.dosirak_price}" required="required" readonly="readonly">
				</td>
			</tr>

			<tr>
				<th>수량</th>
				<td>
					<input type="text" name="dosirak_num" value="${dosirakdto.dosirak_num}" required="required" readonly="readonly">
				</td>
			</tr>

			<tr>
				<th>주문수량</th>
				<td>
					<input type="text" name="dosirak_afternum" value="${dosirakdto.dosirak_afternum}" required="required" readonly="readonly">
				</td>
			</tr>

			<tr>
				<th>탄수화물</th>
				<td>
					<input type="text" name="tan" value="${dosirakdto.tan}" required="required" readonly="readonly">
				</td>
			</tr>

			<tr>
				<th>단백질</th>
				<td>
					<input type="text" name="dan" value="${dosirakdto.dan}" required="required" readonly="readonly">
				</td>
			</tr>

			<tr>
				<th>지방</th>
				<td>
					<input type="text" name="gi" value="${dosirakdto.gi}" required="required" readonly="readonly">
				</td>
			</tr>

			<tr>
				<th>칼로리</th>
				<td>
					<input type="text" name="kcal" value="${dosirakdto.kcal}" required="required" readonly="readonly">
				</td>
			</tr>

			<tr>
				<th>이미지1</th>
				<td>
					<input type="text" name="image1" value="${dosirakdto.image1}" required="required" readonly="readonly">
				</td>
			</tr>

			<tr>
				<th>이미지2</th>
				<td>
					<input type="text" name="image2" value="${dosirakdto.image2}" required="required" readonly="readonly">
				</td>
			</tr>

			<tr>
				<th>이미지3</th>
				<td>
					<input type="text" name="image3" value="${dosirakdto.image3}" required="required" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td colspan="16" align="right">
				<input type="submit" value="결제하기" class="btn btn-outline-light"> 
				<input type="button" value="수 정" onclick=""  class="btn btn-outline-light"/> 
				<input type="button" value="삭 제" onclick="" class="btn btn-outline-light"/> 
				<input type="button" value="이 전" onclick="location.href='dosirak_list.do'" class="btn btn-outline-light"/></td>
			</tr>
		</table>
	</form>
	</div>
</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>