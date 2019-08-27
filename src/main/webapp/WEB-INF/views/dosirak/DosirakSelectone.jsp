<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도시락 상세 보기</title>

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
.mintbtn {
	background-color: #59cab7;
	color: white;
	width: 8rem;
	border: none;
	outline: 0;
	height: 3rem;
	font-size: 1.5rem;
}

.mintbtn:hover {
	background-color: #59cab7;
	color: white;
	width: 8rem;
	border: none;
	outline: 0;
	opacity: 0.5;
	height: 3rem;
	font-size: 1.5rem;
}

.payback {
	position: fixed;
	right: 0px;
	margin-bottom: 30rem;
	height: 35rem;
	width: 22rem;
	background-color: white;
}
#pay:hover {
	opacity: 0.5;
}
.payback, .btn{
	z-index: 9999;
}

</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#sendDiv').show()
		$('#sendDiv2').hide()

		$(document).on('click', '#one', function() {
			$('#sendDiv').show()
			$('#sendDiv2').hide()
			$('#one').attr('style','color : white;')
			$('#one').attr('style','border : 3px solid white;')
			$('#month').attr('style','color :black;')
			$('#month').attr('style','border : none;')
		}).on('click', '#month', function() {
			$('#sendDiv2').show()
			$('#sendDiv').hide()
			$('#month').attr('style','color : white;')
			$('#month').attr('style','border : 3px solid white;')
			$('#one').attr('style','color :black;')
			$('#one').attr('style','border : none;')
		})

		$(document).on('click', '#plus-date', function(){
			var newDate = '<input type="date" name="new_date">'
			$(this).parent().append(newDate)
		})
	})
</script>

</head>
<body>
	<%@ include file="../header.jsp"%>

	<h1>도시락 상세 보기</h1>
<div class="container" >
<div class="dosirakimg" >
<img alt="메인이미지" src="${pageContext.request.contextPath }/resources/etc/multiupload/${dosirakdto.mainimage}" class="doim">
</div>
	<div class="dosirak_info">
	<div class="payback" style = "top : 20rem; overflow: auto;">
		<ul class="nav nav-tabs">
			<li class="mint line font" style="width: 50%; background-color: #59cab7;text-align: center;">
				<input class="btn" type="button" id="one" value="1회 구매" style="width: 10rem" />
			</li>
			<li class="mint line" style="width: 50%; background-color: #59cab7;text-align: center;">
				<input class="btn " type="button" id="month" value="정기 구매" style="width: 10rem" />
			</li>
		</ul>
		
		<form action="kakaopay.do" method = "POST" style=" overflow: auto;">
		<div class="container" id="sendDiv" >
			<hr/>
			<p class="font">탄수화물 : <span id = "tan_span">${dosirakdto.tan}</span>g</p>
			<input type = "hidden" id = "input_tan" name = "custom_tan" value =""/>
			<p class="font">단백질 : <span id = "dan_span">${dosirakdto.dan}</span>g</p>
			<input type = "hidden" id = "input_dan" name = "custom_dan" value =""/>
			<p class="font">지방 : <span id = "zi_span">${dosirakdto.gi}</span>g</p>
			<input type = "hidden" id = "input_zi" name = "custom_zi" value = ""/>
			
			<input type = "hidden" value = "4" name = "custom_count">
			<p class="font">가격 : <span id = "price_span"></span>4000원</p>
			<input type = "hidden" value = "4000" name = "custom_price" id = "price_input">
					
			<p class="font">총 칼로리 : <span id = "cal_span">${dosirakdto.kcal}</span>kal</p>
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
			<input type="button" value="장바구니" class="btn btn-outline-light" onclick="createCookie(${count })"/> 
			<input type="submit" value="결제하기" class="btn btn-outline-light" >
		</div>
		</form>

		<form action="kakaopay.do" method = "POST">
		<div class="container" id="sendDiv2">
			<hr/>
			<p class="font">탄수화물 : <span id = "tan_span">${dosirakdto.tan}</span>g</p>
			<input type = "hidden" id = "input_tan" name = "custom_tan" value =""/>
			<p class="font">단백질 : <span id = "dan_span">${dosirakdto.dan}</span>g</p>
			<input type = "hidden" id = "input_dan" name = "custom_dan" value =""/>
			<p class="font">지방 : <span id = "zi_span">${dosirakdto.gi}</span>g</p>
			<input type = "hidden" id = "input_zi" name = "custom_zi" value = ""/>
			
			<input type = "hidden" value = "4" name = "custom_count">
			<p class="font">가격 : <span id = "price_span"></span>4000원</p>
			<input type = "hidden" value = "4000" name = "custom_price" id = "price_input">
					
			<p class="font">총 칼로리 : <span id = "cal_span_multi">${dosirakdto.kcal}</span>kal</p>
			<input type = "hidden" id = "input_kal_multi" name = "custom_kal" value = ""/>
						<input type = "hidden" id = "input_kal" name = "custom_kal" value = ""/>
			<p class = "font">수령 날짜 :<button type="button" class="btn btn-outline-light" id="plus-date">+</button><input type = "date" name = "custom_delivery" id = "input_date_multi"/></p>
			<p class = "font">수령 시간 : 
				<select name = "custom_time">
					<option value = "">시간 선택</option>
					<option value = "AM">아침</option>
					<option value = "PM">저녁</option>
				</select>
			</p>
			<br />
			<input type="button" value="장바구니" onclick="location.href='createCookie(${count })'" class="btn btn-outline-light" /> 
			<input type="submit" value="결제하기" class="btn btn-outline-light" > 
		</div>
		</form>
	</div>
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
				<th>가격</th>
				<td>
					<p>${dosirakdto.dosirak_price}</p>
				</td>
			</tr>

			<tr>
				<th>날짜</th>
				<td>
					<fmt:formatDate value="${dosirakdto.dosirak_regdate}" pattern="yyyy-MM-hh"/>
				</td>
			</tr>
			<tr>
				<td colspan="16" align="left">
				<input type="button" value="수 정" onclick="location.href='dosirak_updateform.do?dosirak_postnum=${dosirakdto.dosirak_postnum}'"  class="btn btn-outline-light"/> 
				<input type="button" value="삭 제" onclick="location.href='dosirak_delete.do?dosirak_name=${dosirakdto.dosirak_name}'" class="btn btn-outline-light"/> 
				<input type="button" value="이 전" onclick="location.href='dosirak_list.do'" class="btn btn-outline-light"/></td>
			</tr>
		</table>
	</div>
</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>