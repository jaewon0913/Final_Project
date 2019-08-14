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
<link href="${pageContext.request.contextPath }/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/small-business.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/header.css" rel="stylesheet">

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />

<script src="${pageContext.request.contextPath }/resources/js/mainpage.js"></script>

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
						<li class="nav-item "><a class="nav-link" href="#">주간 영양정보</a>
						</li>
						<li class="nav-item " ><a class="nav-link" href="#">특가 도시락</a></li>
						<li class="nav-item "><a class="nav-link" href="freeboard_list.do">자유 게시판</a></li>
						<li class="nav-item "><a class="nav-link" href="#">이벤트 게시판</a>
						</li>
						<li class="nav-item "><a class="nav-link" href="delivery_place.do">배달장소 확인</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		
		<%-- <jsp:include page="chat/ChatPage.jsp"></jsp:include> --%>
		<%-- <!-- chat -->
		<div class="pull-right">
			<img alt="chat" src="resources/bootstrap/image/chat1.png" class="navbar-fixed-top  chat" id = "chat_btn" style = "top : -205px">
			<div id = "chat_div" style = "display : none; width : 500px; height : 500px; position : absoulte" >
				<h1>Chatting Page : ${logindto.member_id}</h1>
				<button type = "button" id = "chat_close" style = "float: right">닫기</button>
				<br>
				<div>
					<div>
						<input type="text" id="message"/>
    						<input type="button" id="sendBtn" value="전송"/>
   			 		</div>
   		 			<br>
    					<div class="well" id="chatdata">
    						<!-- User Session Info Hidden -->
    						<input type="hidden" value='${logindto.member_id}' id="sessionuserid">
   	 				</div>
				</div>
			</div>
		</div> --%>
	<!-- <script type="text/javascript">
	$(function() {
		$("#chat_btn").click(function() {
			$("#chat_div").css("display", "block");
		});
		$("#chat_close").click(function(){
			$("#chat_div").css("display", "none");
		});
	});
	
	/**
		SockJS 객체를 생성한다. 이 후 참조 변수를 이용하여 해당 콜백(onmessage, onclose)들을 등록 한다. 
		jQuery를 이용해서 버튼이 클릭되면 메시지 전송함수를 실행
	*/
	//	WebSocket 을 지정한 URL 연결
	var socket = new SockJS("/mvc/echo");
	
	function logout(user_id) {
		contextPath = "${pageContext.request.contextPath}";
		alert(user_id + "님 로그아웃 되었습니다.");
		location.href = contextPath + "/logout";
	}
	
	//	WebSocket 서버에서 메시지를 보내면 자동으로 실행된다.
	socket.onmessage = onMessage;
	
	//	WebSocket 과 연결을 끊고 싶을때 실행하는 메소드
	socket.onclose = onClose;
	
	$(function (){
		$("#sendBtn").click(function(){
			console.log("send message...");
			sendMessage();
		});
	});
	
	function sendMessage(){
		//	WebSocket 으로 메시지를 보낸다
		socket.send($("#message").val());
	}
	
	//	evt 파라미터는 WebSocket이 보내준 데이터이다.
	function onMessage(evt){	//	변수 안에 function 자체를 넣음
		var data = evt.data;
		var sessionId = null;
		var message = null;
		
		//	문자열을 splite
		var strArray = data.split('|');
		
		for (var i = 0 ; i < strArray.length ; i++){
			console.log('str['+i+']: ' + strArray[i]);
		}
		
		//	Current Session Id
		var currentUser_Session = $('#sessionuserid').val();
		console.log('current session id : ' + currentUser_Session);
		
		sessionid = strArray[0]; 	//	현재 메시지를 보낸 사람의 세션 등록
		sessionWho = strArray[1]; 	//	귓속말 대상 비교
		message = strArray[2];		//	현재 메시지 저장
		
		console.log("총메시지 : " + data);
		console.log("보낸 사람 : " + sessionid);
		console.log("받는 사람 : " + sessionWho);
		console.log("메시지 : " + message);
		
		//	상대방과 내가 보낸 메시지를 구분하여 영역을 나눈다.
		if(currentUser_Session == "" && sessionid == sessionWho){
			var printHTML = "<div class = 'well'>";
				printHTML += "<div class = 'alert alert-info'>";
				printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
				printHTML += "</div>";
				printHTML += "</div>";
			
			$("#chatdata").append(printHTML);
		} else if(sessionid == currentUser_Session){
			//	내가 보낸걸 내 화면에
			alert(currentUser_Session);
			var printHTML = "<div class = 'well'>";
				printHTML += "<div class = 'alert alert-info'>";
				printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
				printHTML += "</div>";
				printHTML += "</div>";
				
				$("#chatdata").append(printHTML);
		} else {
			//	남이 보낸걸 내 화면에
			//	보낸사람이 admin이면 출력
			if(sessionWho == "admin"){
				var printHTML = "<div class = 'well'>";
				printHTML += "<div class = 'alert alert-warning'>";
				printHTML += "<strong>["+sessionWho+"] -> "+message+"</strong>";
				printHTML += "</div>";
				printHTML += "</div>";
				
				$("#chatdata").append(printHTML);
			} else if(currentUser_Session == "admin"){
				//	admin만 다른 사람이 보낸 메시지 받기
				var printHTML = "<div class = 'well'>";
				printHTML += "<div class = 'alert alert-warning'>";
				printHTML += "<strong>["+sessionid+"] ["+sessionWho+"] -> "+message+"</strong>";
				printHTML += "</div>";
				printHTML += "</div>";
				
				$("#chatdata").append(printHTML);
			}
		}
		console.log('chatting data : ' + data);
	}
	
	function onClose(evt){
		$("#data").append("연결 끊김");
	}
</script> -->
	</header>
</body>
</html>