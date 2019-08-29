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
	.barket_img{
		width : 15rem;
		height : 10rem;
	}
</style>

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
		<table class="table">
		<form action="kakaopay_custom.do" method = "POST">
		
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
						<th style = "text-align : center; height : 5rem">이름</th>
						<th style = "text-align : center; height : 5rem">정보</th>
					</tr>
					<c:choose>
					<c:when test="${cookiedto.count == 4 }">
						<tr>
							<th>
								<input type = "hidden" value = "${cookiedto.count }" name = "custom_count">
								<input type = "hidden" value = "${cookiedto.dish1 }" name = "sideDish1">
								<img class = "barket_img" src = "${cookiedto.src1}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cookiedto.dish1 }
							</th>
							<th rowspan = "5" style = "text-align : center">
								칼로리 : ${cookiedto.cal }
								<input type = "hidden" value = "${cookiedto.cal}" name = "custom_kal"><hr>
								탄수화물 : ${cookiedto.tan }
								<input type = "hidden" value = "${cookiedto.tan }" name = "custom_tan"><hr>
								단백질 : ${cookiedto.dan }
								<input type = "hidden" value = "${cookiedto.dan }" name = "custom_dan"><hr>
								지방 : ${cookiedto.zi }
								<input type = "hidden" value = "${cookiedto.zi }" name = "custom_zi"><hr><br>
								도시락 가격 : ${cookiedto.price }
								<input type = "hidden" value = "${cookiedto.price }" name = "custom_price">
							</th>
						</tr>
						<tr>
							<th>
								<input type = "hidden" value = "${cookiedto.dish2 }" name = "sideDish2">
								<img class = "barket_img" src = "${cookiedto.src2}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cookiedto.dish2 }
							</th>
						</tr>
						<tr>
							<th>
								<input type = "hidden" value = "${cookiedto.dish3 }" name = "sideDish3">
								<img class = "barket_img" src = "${cookiedto.src3}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cookiedto.dish3 }
							</th>
						</tr>
						<tr>
							<th>
								<input type = "hidden" value = "${cookiedto.dish4 }" name = "sideDish4">
								<img class = "barket_img" src = "${cookiedto.src4}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cookiedto.dish4 }
							</th>
						</tr>
						<tr>
							<th>
								<input type = "hidden" value = "${cookiedto.dish5 }" name = "sideDish5">
								<img class = "barket_img" src = "${cookiedto.src5}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cookiedto.dish5 }
							</th>
						</tr>
					</c:when>
					<c:when test="${cookiedto.count == 5 }">
						<tr>
							<th>
								<input type = "hidden" value = "${cookiedto.count }" name = "custom_count">
								<img class = "barket_img" src = "${cookiedto.src1}">${cookiedto.dish1 }
							</th>
							<th rowspan = "6">
								칼로리 : ${cookiedto.cal }<br>
								탄수화물 : ${cookiedto.tan }<br>
								단백질 : ${cookiedto.dan }<br>
								지방 : ${cookiedto.zi }<br><br>
								도시락 가격 : ${cookiedto.price } &nbsp; 원
							</th>
						</tr>
						<tr>
							<th><img class = "barket_img" src = "${cookiedto.src2}">${cookiedto.dish2 }</th>
						</tr>
						<tr>
							<th><img class = "barket_img" src = "${cookiedto.src3}">${cookiedto.dish3 }</th>
						</tr>
						<tr>
							<th><img class = "barket_img" src = "${cookiedto.src4}">${cookiedto.dish4 }</th>
						</tr>
						<tr>
							<th><img class = "barket_img" src = "${cookiedto.src5}">${cookiedto.dish5 }</th>
						</tr>
						<tr>
							<th><img class = "barket_img" src = "${cookiedto.src6}">${cookiedto.dish6 }</th>
						</tr>
					</c:when>
					<c:when test="${cookiedto.count == 6 }">
						<tr>
							<th><img class = "barket_img" src = "${cookiedto.src1}">${cookiedto.dish1 }</th>
							<th rowspan = "7">
								칼로리 : ${cookiedto.cal }<br>
								탄수화물 : ${cookiedto.tan }<br>
								단백질 : ${cookiedto.dan }<br>
								지방 : ${cookiedto.zi }<br><br>
								도시락 가격 : ${cookiedto.price }
							</th>
						</tr>
						<tr>
							<th><img class = "barket_img" src = "${cookiedto.src2}">${cookiedto.dish2 }</th>
						</tr>
						<tr>
							<th><img class = "barket_img" src = "${cookiedto.src3}">${cookiedto.dish3 }</th>
						</tr>
						<tr>
							<th><img class = "barket_img" src = "${cookiedto.src4}">${cookiedto.dish4 }</th>
						</tr>
						<tr>
							<th><img class = "barket_img" src = "${cookiedto.src5}">${cookiedto.dish5 }</th>
						</tr>
						<tr>
							<th><img class = "barket_img" src = "${cookiedto.src6}">${cookiedto.dish6 }</th>
						</tr>
						<tr>
							<th><img class = "barket_img" src = "${cookiedto.src7}">${cookiedto.dish7 }</th>
						</tr>
					</c:when>
					<c:otherwise>
						<td colspan = "2" align = "center">
						======== 장바구니가 비어 있습니다. ========
						</td>
					</c:otherwise>
					</c:choose>
					<tr>
						<td colspan = "2" align = "center">
							<br>
							<input type = "hidden" id = "input_kal" name = "custom_kal" value = ""/>
							<p class = "font">수령 날짜 : <input type = "date" name = "custom_delivery" id = "input_date"/></p>
							<p class = "font">수령 시간 : 
								<select name = "custom_time">
									<option value = "">시간 선택</option>
									<option value = "AM">아침</option>
									<option value = "PM">저녁</option>
								</select>
							</p>
							<br /> 
							<input type="submit" value="결제하기" class="btn btn-outline-light">
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</form>
		</table>
	<script>
	//date 타입 오늘 날짜 세팅
	document.getElementById("input_date").value = new Date().toISOString().substring(0,10);
	</script>
	
	
	<br/>
	<br/>


	<!-- footer.jsp -->
	<%@ include file="../footer.jsp"%>

</body>
</html>