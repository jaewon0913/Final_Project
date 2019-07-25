<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>

<script src="${pageContext.request.contextPath }/resources/js/custom.js"></script>

<style>
	.custombox{
		width: 230px;
		height: 330px;
		margin: 10px;
		padding: 10px;
		border: solid 15px #8B4513;
		float: left;
	}
	
 	.boxImg{
		width :180px; 
		height : 280px;
	}
	
	.dropBox{
		width: 230px;
		height: 330px;
		margin: 10px;
		padding: 10px;
		border: solid 15px #8B4513;
		float: left;
	}
</style>

</head>

<!-- Bootstrap core CSS -->
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/bootstrap/css/small-business.css" rel="stylesheet">

<body>

	<!-- header.jsp -->
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
	<!-- 커스텀 페이지 -->
	<h1>커스텀 페이지</h1>
	<hr/>
	<h3>식판을 선택해 주세요(구현중)</h3>
	<hr/>
	
	 <div class="dragImg"><img class="img" src="http://www.thumbshots.com/Portals/0/Images/Feature%20TS%201.jpg">
             </div>

     <div id="dropHere"></div>
	
	<%-- <div>
		<div class="custombox">
			<img class="boxImg" src="${pageContext.request.contextPath }/resources/etc/image/img1.jpg">
	    </div>
	    <div class="custombox">
			<img class="boxImg" src="${pageContext.request.contextPath }/resources/etc/image/img2.jpg">
	    </div>
 	    <div class="custombox">
			<img class="boxImg" src="${pageContext.request.contextPath }/resources/etc/image/img3.jpg">
	    </div>
	    	<div class="custombox">
			<img class="boxImg" src="${pageContext.request.contextPath }/resources/etc/image/img4.jpg">
	    </div>
	</div>
	
	<hr style = "clear : both" />
	
	<div>
	    <div class="dropBox">	
	    </div>
	    <div class="dropBox">
	    </div>
	    <div class="dropBox">
	    </div>
	    <div class="dropBox">
	    </div>
	</div> --%>
</body>
</html>