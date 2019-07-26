<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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

<link href="${pageContext.request.contextPath}/resources/css/mainpage.css" rel="stylesheet" >
<script type="text/javascript" src = "${pageContext.request.contextPath}/resources/js/mainpage.js"></script>

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

	<!-- /.container -->
	<!-- header.jsp -->

	<%@ include file="WEB-INF/views/footer.jsp"%>
	</div>
</body>
</html>