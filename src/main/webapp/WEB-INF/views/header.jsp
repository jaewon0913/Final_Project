<%@ page import="com.khfinal.mvc.member.dto.MemberDto"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="chat/ChatPage.jsp" %>


<!DOCTYPE html>
<html lang="utf-8">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>main</title>
<style type="text/css">

body, input, div, span, p, a, nav, li, ul, button {
	font-family:'샘물';
}

a.nav-link{
	color: white;
}

a.nav-link:hover{
	color: white;
	opacity: 0.5;
}
.navbar-dark .navbar-nav .nav-link {
   
}
</style>


<!-- Bootstrap core CSS -->s
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/bootstrap/css/small-business.css" rel="stylesheet">
<link href="resources/bootstrap/css/header.css" rel="stylesheet">

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />

<script src="resources/js/mainpage.js"></script>

<!-- jaewon -->
<!-- jQuery, bootstrap CDN -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script> <!-- msie 문제 해결 -->
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<!-- socket -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/sockjs.min.js"></script>
</head>

<body>
	<header>
		<nav class="header navbar navbar-expand-lg fixed-top " style="margin-bottom: 0px;">
		<div style="float: left; width: 50%;">
			<img alt="너도나도" src="${pageContext.request.contextPath }/resources/bootstrap/image/nado2.png" onclick="location.href='mainpage.do'" style="width: 10rem; height: 10rem;">
			</div>
			<div style="float: right; width: 50%; text-align: right;" class="pull-right">
				<c:choose>
					<c:when test="${empty logindto}">
							<span class="loginbutton btn" onclick="location.href='loginMain.do'">로그인</span>
							<span class="insertbutton btn" onclick="location.href='insertform.do'">회원가입</span>
					</c:when>
					<c:otherwise>
							<span>안녕하세요. ${logindto.member_name }님</span>
							<span class="mypagebutton btn" onclick="location.href='mypage.do'">마이페이지</span>
							<span class="logoutbutton btn" onclick="logout('${logindto.member_id}')">로그아웃</span>
						
						
					</c:otherwise>
				</c:choose>
			</div>
		</nav>

		<!-- Navigation -->
		<nav class="navbar navbar-expand-lg nav-bar-custom main_img ">
			<div class="container">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item ">
						<a class="nav-link" href="dosirak_listpagig.do">도시락 주문 <span class="sr-only">(current)</span>
						</a></li>
						<!-- 둘중 선택 <li class="nav-item active"><a class="nav-link" href="dosiraktest.do">도시락
							주문 <span class="sr-only">(current)</span>
					 	</a></li> -->
						<li class="nav-item "><a class="nav-link" href="custom.do">커스텀 도시락
								주문</a></li>
						<li class="nav-item"><a class="nav-link" href="nutritiongraph.do">주간 영양정보</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">특가 도시락</a></li>
						<li class="nav-item"><a class="nav-link" href="freeboard_list.do">자유 게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="eventboard_list.do">이벤트 게시판</a>
						</li>
						<li class="nav-item "><a class="nav-link" href="delivery_place.do">배달장소 확인</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>