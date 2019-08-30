function idChk(){
	var doc = document.getElementsByName("member_id")[0];//내가입력한아이디
//	alert(doc);
	if(doc.value.trim()=="" || doc.value==null){
		alert("아이디를 입력해주세요");
	}else{
		open("idChk.do?member_id="+doc.value,"","width=200,height=200");
		//open하면서 이미 새창형태는 만들어진거고 그안에 내용은 컨트롤러에서 만든다.
	}
}
	
function emailSend(){//메일보내기
	var doc = document.getElementsByName("member_email")[0];

	if(doc.value != ""){
		$.ajax({
			url:"mailSend.do",
			type:"post",
			data:"member_email="+doc.value,
			success:function(msg){
// 					alert(msg.emailnotused);
				if(msg.emailnotused == true){
					alert("Authentication number Send Success!!.");
				} else if(msg.emailnotused == false){
					alert("overlap email.");				
					doc.value="";
				}
			},error:function(){
				alert("통신실패 Error");
			}
		});
	}
}
	
function emailChk(){//메일전송된 인증번호랑 사용자가 입력한 인증번호 비교

	var emailtext = document.getElementsByName("emailtext")[0];

	if(emailtext.value != null){
		$.ajax({
			url:"mailChk.do",
			type:"post",
			data:"emailtext="+emailtext.value,
			success:function(msg){
//				alert(msg);
//				alert(msg.emailchk_res);
				if(msg.emailchk_res == true){
					document.getElementsByName("member_email")[0].title="y";
					document.getElementById("emailresult").innerHTML="인증번호가 일치합니다.";
				}else if(msg.emailchk_res == false){
					document.getElementById("emailresult").innerHTML="인증번호가 일치하지 않습니다.";
				}
				
			},error:function(){
				alert("통신실패 Error");
			}
		});
	}
}

$("#formtag").submit(function() {
	var chk = document.getElementsByName("member_id")[0].title;
	var emailchk = document.getElementsByName("member_email")[0].title;
	var pw = document.getElementsByName("member_pw")[0].value;
	var pw1 = document.getElementsByName("member_pw1")[0].value; 
// 	alert(pw+" "+pw1);
// 	alert("tname"+tnamechk);
// 	alert("radio:"+radioVal);
	
		if(chk =="n"){
			alert("ID!overlap check! 아이디 중복체크를 확인해주세요");
			document.getElementsByName("member_id")[0].focus();
			return false;
		}else if(emailchk == "n"){
			alert("email check! 이메일 인증을 확인해주세요.");
			document.getElementsByName("member_email")[0].focus();
			return false;
		}else if(pw != pw1){
			alert("password check! 비밀번호가 서로 같지 않습니다! 확인해주세요!");
			//document.getElementsByName("pw")[0].focus();
			return false;
		}else if(chk =="y" && pw == pw1){
			return true;
		}

});