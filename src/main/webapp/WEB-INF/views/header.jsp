<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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

<link href="resources/bootstrap/css/header.css" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">



<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>


<script type="text/javascript" src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/mainpage.js"></script>


</head>

<body>
	<header>
	
		<nav class="header navbar navbar-expand-lg navbar-dark fixed-top">
			<img alt="너도나도" src="${pageContext.request.contextPath }/resources/bootstrap/image/nado2.png" onclick="location.href='mainpage.do'"
				style="width: 50px; height: 50px;">
			<div style="margin-left: 70%">
				
					<sec:authorize access="isAnonymous()">
						<div class="log" style="float: right;">
							<button class="loginbutton btn" onclick="location.href='loginMain.do'">로그인</button>
							<button class="insertbutton btn"
								onclick="location.href='insertform.do'">회원가입</button>
						</div>
					</sec:authorize>
					
					<sec:authorize access="isAuthenticated()">
						<div class="log">
							<span class="text">${login.member_id } 님</span>
							<button class="mypagebutton btn"
								onclick="location.href='mypage.do'">마이페이지</button>
							<button class="logoutbutton btn"
								onclick="location.href='logout.do'">로그아웃</button>
						</div>
					</sec:authorize>
			</div>
		</nav>


		<!-- Navigation -->
		<nav class="navbar navbar-expand-lg navbar-dark main_img">
			<div class="container">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link" href="#">도시락
								주문 <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="custom.do">커스텀 도시락
								주문</a></li>
						<li class="nav-item"><a class="nav-link" href="#">주간 영양정보</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">특가 도시락</a></li>
						<li class="nav-item"><a class="nav-link" href="freeboard_list.do">자유 게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="#">이벤트 게시판</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">배달장소 확인</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		
		<div class="pull-right">
		
			<img alt="chat" src="resources/bootstrap/image/chat1.png" onclick="location.href='chat.do'" class="navbar-fixed-top  chat">
		</div>
	</header>
</body>
</html>