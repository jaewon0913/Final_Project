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
		display: inline-block;
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
		display: inline-block;
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
	<div align = "center">
	 	<h1>도시락 커스텀</h1>
 	</div>
	<hr/>

	<div align = "center">
		<h5>1. 식판을 선택해 주세요</h5>
		<input type = "image" src = "${pageContext.request.contextPath }/resources/etc/image/box5.png" style = "width : 150px; height : 150px;" onclick = "sikpanChange(4)"/>
		<input type = "image" src = "${pageContext.request.contextPath }/resources/etc/image/box6.png" style = "width : 150px; height : 150px;" onclick = "sikpanChange(5)"/>
		<input type = "image" src = "${pageContext.request.contextPath }/resources/etc/image/box7.png" style = "width : 150px; height : 150px;" onclick = "sikpanChange(6)"/>
	</div>

	<hr style = "clear : both" />
	
	<!-- 반찬 드래그 하는 곳 -->
	<div align = "center">
	<h5>2. 반찬을 드래그 해주세요(더블클릭 시 식판에서 삭제됩니다.)</h5>
		<div style = "display : inline-block">
		<c:choose>
		<c:when test="${count eq 4 or count eq 5 or count eq 6}">
			<c:forEach var='i' begin='0' end='${count }'>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<h1>식판을 먼저 눌러주세요</h1>
		</c:otherwise>
		</c:choose>
		</div>
		<!--
		<c:choose>
		
			<c:when test="${count eq 3}">
			<div style = "display : inline-block">
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
			</div>
			</c:when>
			<c:when test="${count eq 4 }">
			<div style = "display : inline-block">
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
			</div>
			</c:when>
			<c:when test="${count eq 5 }">
			<div style = "display : inline-block">
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>	
			</div>	
			</c:when>
<%-- 			<c:otherwise>
				<h1>식판을 먼저 눌러주세요</h1>
			</c:otherwise> --%>
		</c:choose>
		 -->
	</div>
	<hr style = "clear : both" />
	<!-- 반찬  -->
	<div align = "center">
		<p>반찬선택</p>
		<div style = "display : inline-block">
			<div class="customImg">
				<img name = "dish1" id = "sideDish1" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img01.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		    <div class="customImg" >
				<img name = "dish2" id = "sideDish2" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img02.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		    <div class="customImg" >
				<img name = "dish3" id = "sideDish3" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img03.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		    <div class="customImg" >
				<img name = "dish4" id = "sideDish4" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img04.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		    <div class="customImg" >
				<img name = "dish5" id = "sideDish5" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img05.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		    <div class="customImg" >
				<img name = "dish6" id = "sideDish6" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img06.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		    <div class="customImg" >
				<img name = "dish7" id = "sideDish7" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img07.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		    <div class="customImg" >
				<img name = "dish8" id = "sideDish8" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img08.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		    <div class="customImg" >
				<img name = "dish9" id = "sideDish9" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img09.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		    <div class="customImg" >
				<img name = "dish10" id = "sideDish10" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img10.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		    <div class="customImg" >
				<img name = "dish11" id = "sideDish11" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img11.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		    <div class="customImg" >
				<img name = "dish12" id = "sideDish12" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img12.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		    <div class="customImg" >
				<img name = "dish13" id = "sideDish13" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img13.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		    <div class="customImg" >
				<img name = "dish14" id = "sideDish14" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img14.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		    <div class="customImg" >
				<img name = "dish15" id = "sideDish15" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img15.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		    <div class="customImg" >
				<img name = "dish16" id = "sideDish16" class="customContent" src="${pageContext.request.contextPath }/resources/etc/image/img16.jpeg" draggable = "true" ondragstart = "dragstart_handler(event);">
		    </div>
		</div>
		<div style = "display : inline-block">
		</div>
	<br style = "clear : both" />
	<div align = "center">
		<input type = "button" onclick = "order(${count })" value = "주문" />
	</div>
</body>
</html>