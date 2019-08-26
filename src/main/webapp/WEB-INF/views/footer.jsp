<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<style type="text/css">
.footer {
	padding-bottom: 5rem !important;
	padding-top: 5rem !important;
	height: 25rem;
}

.col-md-6{
z-index: 1;
}
div>a,div>h1,div>p{
z-index: 5;
}
</style>
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/bootstrap/css/small-business.css" rel="stylesheet">
</head>
<body>
	<footer class="footer">
		<div>
			<div class="col-md-6">
				<p class="m-0  text-white">(주)너도나도 서울특별시 강남구 강남구 테헤란로14길 6 조장 :
					신희수</p>
					<img alt="너도나도" src="${pageContext.request.contextPath }/resources/bootstrap/image/logo.png" onclick="location.href='mainpage.do'" style="width: 30rem; height: 10rem;">
			
			</div>
			<div class="col-md-6">
				<a class="m-0  text-white">고객센터</a>
				<h1 class="text-white">1544-9970</h1>
				<p class="text-white">평일 : 10:00 ~ 17:00 점심시간 : 13:00-14:00</p>
				<p class="text-white">	토/일/공휴일은 1:1문의하기를 이용해주세요.</p>
				<p class="text-white"> 업무가 시작되면 바로 처리해 드립니다.</p>
			</div>


			<div class="col-md-14">
				<p class="m-0 text-center text-white">Copyright &copy; Your
					Website 2019</p>
			</div>

		</div>
		<!-- /.container -->
	</footer>
</body>
</html>