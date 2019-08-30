function searchenterkey() {
	if(window.event.keyCode == 13){
		search();
	}
}

function loginform(){
	$("#loginform").show();
}

function cancleloginform(){
	$("#loginform").hide();
}

function login(){
	var idVal = $("#id").val();
	var pwVal = $("#password").val();
	var loginresult = $("#loginresult");
	
	if (idVal == null || idVal == ""){
		alert ("아이디를 확인해주세요");
	} else if (pwVal == null || pwVal == ""){
		alert ("비밀번호를 확인해주세요");
	} else {
		$.ajax({
			url : "login.do",
			type : "post",
			data : "id="+idVal+"&password="+pwVal,
			async: false,
			success : function(msg){
				if(msg.loginchk == true){
					alert(idVal + "님 환영합니다");
				}else if(msg.loginchk==false && msg.idchk == false) {
					alert("가입된 아이디가 없습니다.");
					$("#loginresult").attr("color","red");
					loginresult.innerHTML="가입된 아이디가 없습니다.";
//					location.href = "history.back()";
				}else if(msg.loginchk==false && msg.idchk == true){
					alert("비밀번호를 확인해주세요!");
					$("#loginresult").attr("color","red");
					loginresult.innerHTML="비밀번호를 확인해주세요.";
//					location.href = "history.back()";
				}
			},
			error : function(){
				location.href = "common/errorpage/error.do";
			}
		});
	}
}

function search(){
	var search_text = $("#txt_search").val();
		
	location.href = "search.do?text=" + search_text;
}
