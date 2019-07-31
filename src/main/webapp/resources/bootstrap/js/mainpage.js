function loginform(){
	$("#loginform").show();
}

function cancleloginform(){
	$("#loginform").hide();
}

function login(){
	var idVal = $("#loginid").val();
	var pwVal = $("#loginpw").val();
	
	if (idVal == null || idVal == ""){
		alert ("아이디를 확인해주세요");
	} else if (pwVal == null || pwVal == ""){
		alert ("비밀번호를 확인해주세요");
	} else {
		$.ajax({
			url : "login.do",
			type : "post",
			data : "id="+idVal+"&pw="+pwVal,
			success : function(msg){
				if(msg.loginchk == true){
					alert(idVal + "님 환영합니다");
					location.href = "mainpage.do";
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