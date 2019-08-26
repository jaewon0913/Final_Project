<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<img alt="메인이미지" src="${pageContext.request.contextPath }/resources/etc/multiupload/${dosirakdto.mainimage}" class="doim">
</div>
	<div class="dosirak_info">
	<form action="kakaopay.do" method="POST">
		<table class="table" style="border: none;">
			<tr>
				<th>번호</th>
				<td>
					<p>${dosirakdto.dosirak_postnum}</p>
				</td>
			</tr>

			<tr>
				<th>도시락이름</th>
				<td>
					<p>${dosirakdto.dosirak_name}</p>
				</td>
			</tr>

			<tr>
				<th>제목</th>
				<td>
					<p>${dosirakdto.dosirak_title}</p>
				</td>
			</tr>

			<tr>
				<th>내용</th>
				<td>
					<p>${dosirakdto.dosirak_content}</p>
				</td>
			</tr>

			<tr>
				<th>배달시간</th>
				<td>
					<p>${dosirakdto.dosirak_delivery}</p>
				</td>
			</tr>

			<tr>
				<th>가격</th>
				<td>
					<p>${dosirakdto.dosirak_price}</p>
				</td>
			</tr>

			<tr>
				<th>수량</th>
				<td>
					<p>${dosirakdto.dosirak_num}</p>
				</td>
			</tr>

			<tr>
				<th>주문수량</th>
				<td>
					<p>${dosirakdto.dosirak_afternum}</p>
				</td>
			</tr>
			
			<tr>
				<th>조회수</th>
				<td>
					<p>${dosirakdto.dosirak_views}</p>
				</td>
			</tr>
			
			<tr>
				<th>탄수화물</th>
				<td>
					<p>${dosirakdto.tan}</p>
				</td>
			</tr>

			<tr>
				<th>단백질</th>
				<td>
					<p>${dosirakdto.dan}</p>
				</td>
			</tr>

			<tr>
				<th>지방</th>
				<td>
					<p>${dosirakdto.gi}</p>
				</td>
			</tr>

			<tr>
				<th>칼로리</th>
				<td>
					<p>${dosirakdto.kcal}</p>
				</td>
			</tr>
			
			<tr>
				<th>메인이미지</th>
				<td>
					<p>${dosirakdto.mainimage}</p>
				</td>
			</tr>

			<tr>
				<th>썸네일이미지</th>
				<td>
					<p>${dosirakdto.thumbnail}</p>
				</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>
					<fmt:formatDate value="${dosirakdto.dosirak_regdate}" pattern="yyyy-MM-hh"/>
				</td>
			</tr>
			<tr>
				<td colspan="14" align="right">
				<input type="submit" value="결제하기" class="btn btn-outline-light"> 
				<input type="button" value="수 정" onclick="location.href='dosirak_updateform.do?dosirak_postnum=${dosirakdto.dosirak_postnum}'"  class="btn btn-outline-light"/> 
				<input type="button" value="삭 제" onclick="location.href='dosirak_delete.do?dosirak_name=${dosirakdto.dosirak_name}'" class="btn btn-outline-light"/> 
				<input type="button" value="이 전" onclick="location.href='dosirak_listpaging.do'" class="btn btn-outline-light"/></td>
			</tr>
		</table>
	</form>
	</div>
</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>