function enterkey() {
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
	alert(idVal);
	alert(pwVal);
	
	if (idVal == null || idVal == ""){
		alert ("아이디를 확인해주세요");
	} else if (pwVal == null || pwVal == ""){
		alert ("비밀번호를 확인해주세요");
	} else {
		$.ajax({
			url : "login.do",
			type : "post",
			data : "id="+idVal+"&password="+pwVal,
			success : function(msg){
				if(msg.loginchk == true){
					alert(idVal + "님 환영합니다");
				} else {
					alert("ID 와 PW를 확인해주세요!");
					location.href = "history.back()";
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
