<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
 	.customImg{
		width: 150px;
		height: 200px;
		margin: 10px;
		padding: 10px;
		border: solid 15px #8B4513;
		float: left;
	}
	
 	.customContent{
		width :100px; 
		height : 150px;
	}
	
	.customDrop{
		width: 150px;
		height: 200px;
		margin: 10px;
		padding: 10px;
		border: solid 15px #8B4513;
		float: left;
	}
</style>

</head>

<!-- Bootstrap core CSS -->
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/bootstrap/css/small-business.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<script src="${pageContext.request.contextPath }/resources/js/custom.js"></script>

<body>

	<!-- header.jsp -->
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
	<!-- 커스텀 페이지 -->
 	<h1>커스텀 페이지</h1>
	<hr/>

	<h1>드래그 앤 드롭을 이용한 객체의 이동</h1>
	<div>
		<h5>식판을 선택해 주세요</h5>
		<input type = "image" src = "${pageContext.request.contextPath }/resources/etc/image/sikpan1.png" style = "width : 100px; height : 100px;" onclick = "sikpanChange(3)"/>
		<input type = "image" src = "${pageContext.request.contextPath }/resources/etc/image/sikpan2.jpeg" style = "width : 100px; height : 100px;" onclick = "sikpanChange(4)"/>
		<input type = "image" src = "${pageContext.request.contextPath }/resources/etc/image/sikpan3.jpeg" style = "width : 100px; height : 100px;" onclick = "sikpanChange(5)"/>
	</div>

	<hr style = "clear : both" />
	
	<!-- 반찬 드래그 하는 곳 -->
	<h5>반찬을 드래그 해주세요(더블클릭 시 식판에서 삭제됩니다.)</h5>
	<c:choose>
		<c:when test="${count eq 3}">
			<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
			<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
			<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
		</c:when>
		<c:when test="${count eq 4 }">
			<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
			<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
			<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
			<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
		</c:when>
		<c:when test="${count eq 5 }">
			<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
			<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
			<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
			<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
			<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>		
		</c:when>
		<c:otherwise>
			<h1>식판을 먼저 눌러주세요</h1>
		</c:otherwise>
	</c:choose>
	<hr style = "clear : both" />
	<!-- 반찬  -->
	<div>
		<p>반찬선택</p>
		<div class="customImg">
			<img name = "dish1" id = "sideDish1" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img1.jpg" draggable = "true" ondragstart = "dragstart_handler(event);">
	    </div>
	    <div class="customImg" >
			<img name = "dish2" id = "sideDish2" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img2.jpg" draggable = "true" ondragstart = "dragstart_handler(event);">
	    </div>
	    <div class="customImg" >
			<img name = "dish3" id = "sideDish3" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img3.jpg" draggable = "true" ondragstart = "dragstart_handler(event);">
	    </div>
	    <div class="customImg" >
			<img name = "dish4" id = "sideDish4" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img4.jpg" draggable = "true" ondragstart = "dragstart_handler(event);">
	    </div>
	</div>
	
	<div align = "center">
		<input type = "button" onclick = "order(${count })" value = "주문" />
	</div>
</body>
</html>