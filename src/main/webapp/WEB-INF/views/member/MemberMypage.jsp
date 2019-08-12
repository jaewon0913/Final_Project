<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>

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
		
			<div class="col-el-5 col-lg-5 col-md-5 list-group-item mx-5" style="height:150px; background-color: #F5FFFA; line-height: 7rem; text-align: center; ">
				
				<p onclick="location.href='detail.do?id=${login.member_id}'" class="text-dark" style="font-size: 36px; margin: 8%;">개인정보 수정</p>
			</div>
			
			<div class="col-el-5 col-lg-5 col-md-5 list-group-item mx-5" style="height:150px; background-color: #F5FFFA; line-height: 7rem; text-align: center;">
				<p onclick="location.href='#'" class="text-dark " style="font-size: 36px; padding: 8%;">결제내역</p>
			</div>
		</div>
		
		
		
		<div class="list-group list-group-horizontal" style="margin-bottom: 4em;">
		
			<div class="colcol-el-5 col-lg-5 col-md-5 list-group-item mx-5" style="height:150px; background-color: #F5FFFA; line-height: 7rem; text-align: center;">
				<p onclick="location.href='dosirak_list.do'" class="text-dark" style="font-size: 36px; padding: 8%;">장바구니</p>
			</div>
			
			<div class="col-el-5 col-lg-5 col-md-5 list-group-item mx-5" style="height:150px; background-color: #F5FFFA; line-height: 7rem; text-align: center;">
				<p  onclick="location.href='qrcodeSelect.do'" class="text-dark" style="font-size: 36px; padding: 8%;">QR코드 조회</p>
			</div>
		</div>
	</div>
	</div>	
	
	
	<%@ include file="../footer.jsp"%>

</body>
</html>