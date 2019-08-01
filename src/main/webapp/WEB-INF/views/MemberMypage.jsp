<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>
	
	<%@ include file="header.jsp"%>
	
	<div style="width: 250px; height: 50px; font-size: 36px; font-weight: bold;" >
		마이 페이지
	</div>
	
	<div class="container ">
	<div id="row text-center" style="margin-bottom: 4em; margin: auto;">
		<div class="list-group list-group-horizontal" style="margin-bottom: 4em;">
			<div class="col-el-4 col-lg-4 col-md-4 list-group-item mx-5" style="height:150px; background-color: pink; line-height: 7rem; text-align: center;">
				<a href="detail.do?id=${login.member_id}" class="text-dark" style="font-size: 36px;">개인정보 수정</a>
			</div>
			<div class="col-el-4 col-lg-4 col-md-4 list-group-item mx-5" style="height:150px; background-color: pink; line-height: 7rem; text-align: center;">
				<a href="" class="text-dark" style="font-size: 36px;">결제내역</a>
			</div>
		</div>
		
		<div class="list-group list-group-horizontal" style="margin-bottom: 4em;">
			<div class="colcol-el-4 col-lg-4 col-md-4 list-group-item mx-5" style="height:150px; background-color: pink; line-height: 7rem; text-align: center;">
				<a href="dosirak_list.do" class="text-dark" style="font-size: 36px;">장바구니</a>
			</div>
			<div class="col-el-4 col-lg-4 col-md-4 list-group-item mx-5" style="height:150px; background-color: pink; line-height: 7rem; text-align: center;">
				<a href="#" class="text-dark" style="font-size: 36px;">QR코드 조회</a>
			</div>
		</div>
	</div>
	</div>	
	
	
	<%@ include file="footer.jsp"%>

</body>
</html>