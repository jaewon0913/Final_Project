
function enterkey() {
	if(window.event.keyCode == 13){
		sendMessage();
	}
}
function bot_enterkey(){
	if(window.event.keyCode == 13){
		botSendMessage();
	}
}
	
$(function() {
	$("#chat_btn").click(function() {
		$("#chat_div").css("display", "block");
		$("#send_div").css("display", "block");
				
		$("#bot_div").css("display", "none");
		$("#bot_send_div").css("display", "none");
	});
	$("#chat_close").click(function() {
		$("#chat_div").css("display", "none");
		$("#send_div").css("display", "none");
	});
	
	$("#bot_btn").click(function() {
		$("#bot_div").css("display", "block");
		$("#bot_send_div").css("display", "block");
		bot_basic();
				
		$("#chat_div").css("display", "none");
		$("#send_div").css("display", "none");
	});
	
	$("#bot_chat_close").click(function(){
		$("#bot_div").css("display", "none");
		$("#bot_send_div").css("display", "none");
	})
});

function bot_basic(){
	$("#bot_msg_div").html("");
	var basic =	"<img alt='너도나도' src='resources/bootstrap/image/nado2.png' style='width: 50px; height: 50px; float : left;'>" +
				"<div class = 'arrow_box' style = 'width : 310px; left : -100px; float : right;'>궁금한 것을 입력해주세요.(/???)으로 입력하시면 됩니다.<br/>" +
				" &nbsp 1. 회원가입(/회원)<br>" +
				" &nbsp 2. 홈페이지 이용방법(/홈페이지)<br>" +
				" &nbsp 3. 커스텀 도시락 주문방법(/커스텀)<br>" +
				" &nbsp 4. 실시간 상담(/상담)<br></div>" +
				" <br style = 'clear : both' /><br>";
	
	$("#bot_msg_div").append(basic);
}

$(function() {
	$("#bot_send_btn").click(function(){
		botSendMessage();
	});
});

function botSendMessage(){
	var message = $("#bot_message").val();
	if(message == "/회원"){
		$("#bot_msg_div").append(
					"<img alt = '손님' src = 'resources/bootstrap/image/bot2.png' style = 'width : 50px; height: 50px; float : right;'>" +
					"<div class = 'arrow_box_right' style = 'width : 310px; right : -100px; float : left;'>" +
					"회원가입은 홈페이지 상단 우측에 회원가입 버튼을 클릭 하신 후 정보를 입력 후 간단한 인증 후에 가입이 완료 됩니다." +
					"</div>" +
					"<br style = 'clear : both' /><br>" +
					"<img alt='너도나도' src='resources/bootstrap/image/nado2.png' style='width: 50px; height: 50px; float : left;'>" +
					"<div class = 'arrow_box' style = 'width : 310px; left : -100px; float : right;'>궁금한 것을 입력해주세요.(/???)으로 입력하시면 됩니다.<br/>" +
					" &nbsp 1. 회원가입(/회원)<br>" +
					" &nbsp 2. 홈페이지 이용방법(/홈페이지)<br>" +
					" &nbsp 3. 커스텀 도시락 주문방법(/커스텀)<br>" +
					" &nbsp 4. 실시간 상담(/상담)<br></div>" +
					" <br style = 'clear : both' /><br>");
	} else if(message == "/홈페이지"){
		$("#bot_msg_div").append(
				"<img alt = '손님' src = 'resources/bootstrap/image/bot2.png' style = 'width : 50px; height: 50px; float : right;'>" +
				"<div class = 'arrow_box_right' style = 'width : 310px; right : -100px; float : left;'>" +
				"홈페이지 크게 도시락 주문 / 영양 게시판 / 게시판 / 배달장소 확인 으로 이루어져 있습니다.<br>" +
				"1. 도시락 주문은 원하는 도시락을 클릭 또는 커스텀하여 주문을 할 수 있습니다.<br>" +
				"2. 영양 게시판은 각 도시락에 대한 영양 정보나 자신이 주문했던 도시락의 영양 정보를 보여줍니다.<br>" +
				"3. 게시판은 자유게시판, 이벤트게시판, 공지사항으로 자유게시판만 자유롭게 글 작성, 수정 등이 가능합니다." +
				"4. 배달장소 확인은 각자 자신이 받을 지역의 역을 보여줍니다." +
				"</div>" +
				"<br style = 'clear : both' /><br>" +
				"<img alt='너도나도' src='resources/bootstrap/image/nado2.png' style='width: 50px; height: 50px; float : left;'>" +
				"<div class = 'arrow_box' style = 'width : 310px; left : -100px; float : right;'>궁금한 것을 입력해주세요.(/???)으로 입력하시면 됩니다.<br/>" +
				" &nbsp 1. 회원가입(/회원)<br>" +
				" &nbsp 2. 홈페이지 이용방법(/홈페이지)<br>" +
				" &nbsp 3. 커스텀 도시락 주문방법(/커스텀)<br>" +
				" &nbsp 4. 실시간 상담(/상담)<br></div>" +
				" <br style = 'clear : both' /><br>");
	} else if(message == "/커스텀"){
		
	} else if(message == "/상담") {
		$("#bot_msg_div").append(
				"<img alt = '손님' src = 'resources/bootstrap/image/bot2.png' style = 'width : 50px; height: 50px; float : right;'>" +
				"<div class = 'arrow_box_right' style = 'width : 310px; right : -100px; float : left;'>" +
				"상담은 홈페이지 화면 좌측 말풍선 아이콘을 클릭시 창이 나오면서 상담이 가능합니다.<br>" +
				"상담은 상담사가 접속하고 있을 때만 가능합니다.<br>" +
				"상담 가능 시간 : 09:00 ~ 11:30 / 13:00 ~ 17:00 입니다." +
				"</div>" +
				"<br style = 'clear : both' /><br>" +
				"<img alt='너도나도' src='resources/bootstrap/image/nado2.png' style='width: 50px; height: 50px; float : left;'>" +
				"<div class = 'arrow_box' style = 'width : 310px; left : -100px; float : right;'>궁금한 것을 입력해주세요.(/???)으로 입력하시면 됩니다.<br/>" +
				" &nbsp 1. 회원가입(/회원)<br>" +
				" &nbsp 2. 홈페이지 이용방법(/홈페이지)<br>" +
				" &nbsp 3. 커스텀 도시락 주문방법(/커스텀)<br>" +
				" &nbsp 4. 실시간 상담(/상담)<br></div>" +
				" <br style = 'clear : both' /><br>");		
	} else {
		$("#bot_msg_div").append(
				"<img alt = '손님' src = 'resources/bootstrap/image/bot2.png' style = 'width : 50px; height: 50px; float : right;'>" +
				"<div class = 'arrow_box_right' style = 'width : 310px; right : -100px; float : left;'>" +
				"해당 명령어가 없습니다. 다시 입력해주세요." +
				"</div>" +
				"<br style = 'clear : both' /><br>" +
				"<img alt='너도나도' src='resources/bootstrap/image/nado2.png' style='width: 50px; height: 50px; float : left;'>" +
				"<div class = 'arrow_box' style = 'width : 310px; left : -100px; float : right;'>궁금한 것을 입력해주세요.(/???)으로 입력하시면 됩니다.<br/>" +
				" &nbsp 1. 회원가입(/회원)<br>" +
				" &nbsp 2. 홈페이지 이용방법(/홈페이지)<br>" +
				" &nbsp 3. 커스텀 도시락 주문방법(/커스텀)<br>" +
				" &nbsp 4. 실시간 상담(/상담)<br></div>" +
				" <br style = 'clear : both' /><br>");
	}
	
	$("#bot_message").val("");

	$("#bot_div").scrollTop($("#bot_div")[0].scrollHeight);
}





