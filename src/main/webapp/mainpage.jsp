<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="utf-8">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>main</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/small-business.css" rel="stylesheet">



</head>

<body>

	<!-- header.jsp -->
	<%@ include file="WEB-INF/views/header.jsp"%>





	<!-- Page Content -->
	<div class="container">

		<!-- Heading Row -->
		<div class="row align-items-center my-5">
			<div class="col-lg-7">
				<img class="img-fluid rounded mb-4 mb-lg-0"
					src="${pageContext.request.contextPath }/resources/bootstrap/image/lunchbox1.jpg" alt="">
			</div>
			<!-- /.col-lg-8 -->
			<div class="col-lg-5">
				<h1 class="font-weight-light"><-동영상 넣는곳</h1>
				<p>동영상 설명</p>
				<a class="btn btn-primary" href="#">Call to Action!</a>
			</div>
			<!-- /.col-md-4 -->
		</div>
		<!-- /.row -->

		<!-- Call to Action Well -->
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<p class="text-white m-0">홈페이지 설명 div</p>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">인스타 크롤링1</h2>
						<p class="card-text">위하여, 풀밭에 없는 풍부하게 스며들어 가는 수 이것이다. 능히 청춘은
							그들에게 유소년에게서 두기 같이, 봄바람이다. 꽃이 트고, 얼음 길을 소금이라 이상의 낙원을 대중을 이 있는가? 하는
							심장은 우리의 너의 우리 쓸쓸하랴? 용기가 이것을 품으며, 설산에서 앞이 인류의 봄바람이다. 싸인 이것을 피가
							반짝이는 아니다.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary btn-sm">More Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">인스타 크롤링</h2>
						<p class="card-text">위하여, 풀밭에 없는 풍부하게 스며들어 가는 수 이것이다. 능히 청춘은
							그들에게 유소년에게서 두기 같이, 봄바람이다. 꽃이 트고, 얼음 길을 소금이라 이상의 낙원을 대중을 이 있는가? 하는
							심장은 우리의 너의 우리 쓸쓸하랴? 용기가 이것을 품으며, 설산에서 앞이 인류의 봄바람이다. 싸인 이것을 피가
							반짝이는 아니다.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary btn-sm">More Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">인스타 크롤링</h2>
						<p class="card-text">위하여, 풀밭에 없는 풍부하게 스며들어 가는 수 이것이다. 능히 청춘은
							그들에게 유소년에게서 두기 같이, 봄바람이다. 꽃이 트고, 얼음 길을 소금이라 이상의 낙원을 대중을 이 있는가? 하는
							심장은 우리의 너의 우리 쓸쓸하랴? 용기가 이것을 품으며, 설산에서 앞이 인류의 봄바람이다. 싸인 이것을 피가
							반짝이는 아니다.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary btn-sm">More Info</a>
					</div>
				</div>
			</div>

			<div class="Notice">
				<a>공지사항 게시판</a>
				<ul>
					<li>공지사항</li>
				</ul>
			</div>

			<div class="Notice">
				<a>이벤트 게시판</a>
				<ul>
					<li>이벤트</li>
				</ul>
			</div>
			<!-- /.col-md-4 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	<!-- header.jsp -->

	<%@ include file="WEB-INF/views/footer.jsp"%>


	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath }/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/js/mainpage.js"></script>
	<div id="loginform">
		<table align="center">
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" id="loginid"
					placeholder="아이디를 입력해주세요" /></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="pw" id="loginpw"
					placeholder="비밀번호를 입력해주세요" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="로그인"
					onclick="login()" /> <input type="button" value="회원가입" /> <input
					type="button" value="취소" onclick="cancleloginform()" /></td>
			</tr>
		</table>
	</div>
</body>

</html>
