<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
	#dropHere {
	    width:400px;
	    height: 400px;
	    border: dotted 1px black;
	}
			.abc {
			width: 180px;
			height: 280px;
			margin: 10px;
			padding: 10px;
			border: solid 15px #8B4513;
			float: left;
		}
</style>

</head>

<!-- Bootstrap core CSS -->
<!-- <link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet"> -->
<!-- Custom styles for this template -->
<!-- <link href="resources/bootstrap/css/small-business.css" rel="stylesheet">
 -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<script src="${pageContext.request.contextPath }/resources/js/custom.js"></script>

<body>

	<!-- header.jsp -->
	<%-- <%@ include file="/WEB-INF/views/header.jsp"%> --%>
	
	<!-- 커스텀 페이지 -->
	<h1>커스텀 페이지</h1>
	<hr/>
	<h3>식판을 선택해 주세요(구현중)</h3>
	<hr/>

	<h1>드래그 앤 드롭을 이용한 객체의 이동</h1>

	<p>모나리자 그림을 드래그해서 옆의 사각형으로 옮겨보세요!</p>

	<div class = "abc" ondrop="drop(event)" ondragover="dragEnter(event)">
		<img id="monalisa" width="180" height="280" src="${pageContext.request.contextPath }/resources/etc/image/img1.jpg" draggable="true" ondragstart="drag(event)">
	</div>
	<div class = "abc" ondrop="drop(event)" ondragover="dragEnter(event)"></div>

	<script>
		function dragEnter(ev) {
			ev.preventDefault();
		}

		function drag(ev) {
			ev.dataTransfer.setData("text", ev.target.id);
		}

		function drop(ev) {
			ev.preventDefault();
			var data = ev.dataTransfer.getData("text");
			ev.target.appendChild(document.getElementById(data));
		}
	</script>
	
		<hr style = "clear : both" />
	
	
	<div>
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
	</div>
</body>
</html>