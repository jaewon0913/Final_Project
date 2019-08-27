<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<style type="text/css">
.mp {
	height: auto;
	background-color: #ebf7f1;
	line-height: 7rem;
	text-align: center;
	cursor: pointer;
}
.mp:hover{
	height: auto;
	background-color: #D3DED8;
	line-height: 7rem;
	text-align: center;
	opacity: 0.8;
	
	
	
}

.text-dark {
	font-size: 36px;
	padding: 8%;
	margin: 0;
}
</style>

</head>

<body>
	
	<%@ include file="../header.jsp"%>
	
	<div style="width: 250px; height: 50px; font-size: 36px; font-weight: bold; padding-left: 3%;" >
		마이 페이지
	</div>
	<br/>
	
	<div class="container ">
	<div id="row text-center" style="margin-bottom: 4em; margin: auto;">
	
		<div class="list-group list-group-horizontal" style="margin-bottom: 4em;">
		
			<div class="col-el-5 col-lg-5 col-md-5 mx-5 mp border">
				
				<p onclick="location.href='detail.do'" class="text-dark" >개인정보 수정</p>
			</div>
			
			<div class="col-el-5 col-lg-5 col-md-5 mx-5 mp border">
				<p onclick="location.href='#'" class="text-dark " >결제내역</p>
			</div>
		</div>
		
		
		
		<div class="list-group list-group-horizontal" style="margin-bottom: 4em;">
		
			<div class="col-el-5 col-lg-5 col-md-5 mx-5 mp border">
				<p onclick="location.href='getCookie.do'" class="text-dark" style=>장바구니</p>
			</div>
			
			<div class="col-el-5 col-lg-5 col-md-5 mx-5 mp border">
				<p  onclick="location.href='qrcodeSelect.do'" class="text-dark" >QR코드 조회</p>
			</div>
		</div>
		
		
		<div class="list-group list-group-horizontal" style="margin-bottom: 4em;">
		
			<div class="col-el-5 col-lg-5 col-md-5 mx-5 mp border">
				<p onclick="location.href='delivery_place.do'" class="text-dark" >배달장소 확인</p>
			</div>
			
			<div class="col-el-5 col-lg-5 col-md-5 mx-5 mp border">
			<p onclick="location.href=''" class="text-dark" >회원 탈퇴</p>
			</div>
		</div>
	</div>
	</div>	
	
	
	<%@ include file="../footer.jsp"%>

</body>
</html>