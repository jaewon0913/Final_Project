<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>main</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/small-business.css" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">



<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<script type="text/javascript">	
	$(document).ready(function() {
		$("#slider").lightSlider({
			mode : 'slide',
			loop : true,
			auto : true,
			keyPress : true,
			pager : false,
			speed : 1500,
			pause : 3000
		});
	});
</script>

</head>

<body>

	<!-- header.jsp -->
	<%@ include file="WEB-INF/views/header.jsp"%>


<!-- -----------------슬라이드 이미지-------------------------------------------- -->

	<!-- Page Content -->
	<div class="container">

		<!-- Heading Row -->
		<div class="row align-items-center my-5">

			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- 페이지 -->

				<!--페이지-->

				<div class="carousel-inner">
					<!--슬라이드1-->
					<div class="item active">
						<img src="resources/bootstrap/image/ex1.jpg"
							style="width: 100%; float: none;" alt="First slide">
						<div class="container">
							<div class="carousel-caption">
							</div>
						</div>
					</div>
					<!--슬라이드1-->

					<!--슬라이드2-->
					<div class="item">
						<img src="resources/bootstrap/image/ex2.jpg" style="width: 100%"
							data-src="" alt="Second slide">
						<div class="container">
							<div class="carousel-caption">
							</div>
						</div>
					</div>
					<!--슬라이드2-->

					<!--슬라이드3-->
					<div class="item">
						<img src="resources/bootstrap/image/ex3.jpg" style="width: 100%"
							data-src="" alt="Third slide">
						<div class="container">
							<div class="carousel-caption">
							</div>
						</div>
					</div>
					<!--슬라이드3-->
				</div>

				<!--이전, 다음 버튼-->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"><span
					class="glyphicon glyphicon-chevron-left"></span></a> <a
					class="right carousel-control" href="#myCarousel" data-slide="next"><span
					class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
			<!-- /.col-md-4 -->
		</div>
		<!-- /.row -->
<!-- -----------------슬라이드 이미지-------------------------------------------- -->
<!-- -----------------홈페이지 설명-------------------------------------------- -->

		<!-- Call to Action Well -->
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<p class="text-white m-0">홈페이지 설명 div</p>
			</div>
		</div>
<!-- -----------------홈페이지 설명-------------------------------------------- -->
<!-- -----------------인스타 크롤링-------------------------------------------- -->
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

<!-- -----------------인스타 크롤링-------------------------------------------- -->


<!-- -----------------공지사항 게시판-------------------------------------------- -->
			<div class="Notice">
				<a href="notice_list.do">공지사항 게시판</a>
				<ul>
					<li>공지사항</li>
				</ul>
			</div>

<!-- -----------------공지사항 게시판-------------------------------------------- -->
<!-- -----------------이벤트 게시판-------------------------------------------- -->
			<div class="Notice">
				<a>이벤트 게시판</a>
				<ul>
					<li>이벤트</li>
				</ul>
			</div>
			
<!-- -----------------이벤트 게시판-------------------------------------------- -->
<!-- ------------------------동영상-------------------------------------------- -->

			<div class="embed-responsive embed-responsive-4by3" style="margin-bottom: 5%;">
				<video controls autoplay loop class="embed-responsive-item">
					<source src="resources/video/example.mp4" type="video/mp4">
				</video>
			</div>

<!-- ------------------------동영상-------------------------------------------- -->
			<!-- /.col-md-4 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->


	<%@ include file="WEB-INF/views/footer.jsp"%>


	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath }/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/js/mainpage.js"></script>
	
</body>

</html>
