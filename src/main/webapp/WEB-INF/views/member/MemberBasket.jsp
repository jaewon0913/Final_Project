<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" maximum-scale=1.0, user-scalable=no; />

<title>Insert title here</title>

<!-- Bootstrap core CSS -->
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/bootstrap/css/small-business.css" rel="stylesheet">


<style type="text/css">

.em{
	padding-left: 15rem;
	padding-right: 15rem;
}
</style>

</head>
<body>
	<!-- header.jsp -->
	<%@ include file="../header.jsp"%>
	
	<div class="em">
	<!-- Body -->
	<table class="table ">
	
		<c:choose>
			<c:when test="${empty cookiedto}">
				<tr>
					<td colspan = "2" align = "center">
					======== 장바구니가 비어 있습니다. ========
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th>이름</th>
					<th>정보</th>
				</tr>
				<c:choose>
				<c:when test="${cookiedto.count == 4 }">
					<tr>
						<th>${cookiedto.dish1 }</th>
						<th rowspan = "5" class="border center">
							칼로리 : ${cookiedto.cal }<br>
							탄수화물 : ${cookiedto.tan }<br>
							단백질 : ${cookiedto.dan }<br>
							지방 : ${cookiedto.zi }<br>
							도시락 가격 : ${cookiedto.price }
						</th>
					</tr>
					<tr>
						<th>${cookiedto.dish2 }</th>
					</tr>
					<tr>
						<th>${cookiedto.dish3 }</th>
					</tr>
					<tr>
						<th>${cookiedto.dish4 }</th>
					</tr>
					<tr>
						<th>${cookiedto.dish5 }</th>
					</tr>
				</c:when>
				<c:when test="${cookiedto.count == 5 }">
				</c:when>
				</c:choose>
			</c:otherwise>
		</c:choose>
		
	</table>


</div>



	<!-- footer.jsp -->
	<%@ include file="../footer.jsp"%>

</body>
</html>