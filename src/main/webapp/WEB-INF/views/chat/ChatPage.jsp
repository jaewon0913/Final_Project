<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- socket -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/sockjs.min.js"></script>

<!-- css -->
<link href="resources/css/chatpage.css" rel="stylesheet" />

<!-- script -->
<script src = "resources/js/chatpage.js"></script>


</head>
<body>
	<!-- etc button -->
	<div class="pull-right">
		<!-- chat -->
		<img alt="chat" src="${pageContext.request.contextPath }/resources/bootstrap/image/chat1.png" class="navbar-fixed-top chat" id="chat_btn">
		<div id="chat_div">
			<!-- User Session Info Hidden -->
			<input type="hidden" value='${logindto.member_id}' id="sessionuserid">
			<div style="float: right; padding-right: 2rem;">
				<button type="button" id="chat_close" style = "position : fixed; z-index : 90; width : 2rem; font-size : 1rem;" class="btn btn-outline-light">x</button>
			</div>
			<div id="msg_div" style = "clear : both;" ></div>
		</div>
		<div id = "send_div">
			<input type="text" id="message" onkeyup = "enterkey();"/> 
			<input type="button" id="send_btn" value="전송" class="btn btn-outline-light"/>
		</div>
		
		<img alt="bot" src = "${pageContext.request.contextPath }/resources/bootstrap/image/chat2.png" class = "navbar-fixed-top bot" id = "bot_btn" >
		<div id = "bot_div">
			<div style="float: right; padding-right: 2rem;" >
				<button type="button" id="bot_chat_close" style = "position : fixed; z-index : 90; width : 2rem; font-size : 1rem;" class="btn btn-outline-light">x</button>
			</div>
			<div id="bot_msg_div" style = "clear : both;" >
			</div>
		</div>
		<div id = "bot_send_div">
			<input type="text" id="bot_message" onkeyup = "bot_enterkey();"/> 
			<input type="button" id="bot_send_btn" value="전송" class="btn btn-outline-light"/>
		</div>
	</div>

	<script type="text/javascript">
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

		$(function() {
			$("#send_btn").click(function() {
				console.log("send message...");
				sendMessage();
			});
		});

		function sendMessage() {
			//	WebSocket 으로 메시지를 보낸다
			socket.send($("#message").val());
			$("#message").val("");
		}

		//	evt 파라미터는 WebSocket이 보내준 데이터이다.
		function onMessage(evt) { //	변수 안에 function 자체를 넣음
			var data = evt.data;
			var sessionId = null;
			var message = null;

			//	문자열을 splite
			var strArray = data.split('|');

			for (var i = 0; i < strArray.length; i++) {
				console.log('str[' + i + ']: ' + strArray[i]);
			}

			//	Current Session Id
			var currentUser_Session = $('#sessionuserid').val();
			console.log('current session id : ' + currentUser_Session);

			sessionid = strArray[0]; //	현재 메시지를 보낸 사람의 세션 등록
			sessionWho = strArray[1]; //	귓속말 대상 비교
			message = strArray[2]; //	현재 메시지 저장

			console.log("총메시지 : " + data);
			console.log("보낸 사람 : " + sessionid);
			console.log("받는 사람 : " + sessionWho);
			console.log("메시지 : " + message);

			//	상대방과 내가 보낸 메시지를 구분하여 영역을 나눈다.
			if (currentUser_Session == "" && sessionid == sessionWho) {
				var printHTML = "<div>";
				printHTML += "<div class = 'alert alert-info'>";
				printHTML += "<strong>[" + sessionid + "] -> " + message
						+ "</strong>";
				printHTML += "</div>";
				printHTML += "</div>";

				$("#msg_div").prepend(printHTML);
			} else if (sessionid == currentUser_Session) {
				//	내가 보낸걸 내 화면에
				var printHTML = "<div>";
				printHTML += "<div class = 'alert alert-info'>";
				printHTML += "<strong>[" + sessionid + "] -> " + message
						+ "</strong>";
				printHTML += "</div>";
				printHTML += "</div>";

				$("#msg_div").prepend(printHTML);
			} else {
				//	남이 보낸걸 내 화면에
				//	보낸사람이 admin이면 출력
				if (sessionWho == "admin") {
					var printHTML = "<div>";
					printHTML += "<div class = 'alert alert-warning'>";
					printHTML += "<strong>[" + sessionWho + "] -> " + message
							+ "</strong>";
					printHTML += "</div>";
					printHTML += "</div>";

					$("#msg_div").prepend(printHTML);
				} else if (currentUser_Session == "admin") {
					//	admin만 다른 사람이 보낸 메시지 받기
					var printHTML = "<div>";
					printHTML += "<div class = 'alert alert-warning'>";
					printHTML += "<strong>[" + sessionid + "] [" + sessionWho
							+ "] -> " + message + "</strong>";
					printHTML += "</div>";
					printHTML += "</div>";

					$("#msg_div").prepend(printHTML);
				}
			}
			console.log('chatting data : ' + data);
		}

		function onClose(evt) {
			$("#data").append("연결 끊김");
		}
	</script>
</body>
</html>