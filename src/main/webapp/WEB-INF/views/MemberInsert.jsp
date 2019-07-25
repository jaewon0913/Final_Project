<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
// 		alert("dd");
	});
		 
	 
	function idChk(){
		var doc = document.getElementsByName("member_id")[0];//내가입력한아이디
		alert(doc);
		if(doc.value.trim()=="" || doc.value==null){
			alert("아이디를 입력해주세요");
		}else{
			open("idChk.do?member_id="+doc.value,"","width=200,height=200");
			//open하면서 이미 새창형태는 만들어진거고 그안에 내용은 컨트롤러에서 만든다.
		}
	}
	
	function emailSend(){//메일보내기
		var doc = document.getElementsByName("member_email")[0];
		if(doc.value != null){
			$.ajax({
				url:"mailSend.do",
				type:"post",
				data:"member_email="+doc.value,
				success:function(msg){
					
				},error:function(){
					alert("통신실패");
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
					alert(msg);
					alert(msg.emailchk_res);
					if(msg.emailchk_res == true){
						document.getElementsByName("member_email")[0].title="y";
						document.getElementById("emailresult").innerHTML="인증번호가 일치합니다.";
					}else if(msg.emailchk_res == false){
						document.getElementsByName("member_email")[0].title="n";
						document.getElementById("emailresult").innerHTML="인증번호가 일치하지 않습니다.";
					}
					
				},error:function(){
					alert("통신실패");
				}
			});
		}
	}
</script>
</head>
<body>



	
	
	
	<form id="formtag" action="insert_res.do" method="post" >
		<table border="1">
		
		<h3>회원가입</h3>
		
		<col width="150px">
		<col width="300px">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="member_id" title="n" required="required">
					<input type="button" value="중복체크" onclick="idChk()">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="member_pw" required="required"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="member_pw1" required="required"></td>
			</tr>
			<tr>
				<th>이   름</th>
				<td><input type="text" name="member_name" required="required"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="member_email" title="n" required="required">
					<input type="button" value="이메일 인증요청" onclick="emailSend()">
				</td>
			</tr>
			<tr>
				<th>이메일 인증번호 입력</th>
				<td>
					<input type="text" name="emailtext" required="required">
					<input type="button" value="인증번호 확인" onclick="emailChk()">
					<p id="emailresult"></p>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="member_phone"  required="required" placeholder="ex)01012345678">
				</td>
			</tr>
			<tr>
				<th>주   소</th>
				<td><input type="text" name="member_address" required="required"></td>
			</tr>
			<tr>
				<th>도시락 받을 역</th>
				<td><input type="text" name="member_subway" required="required"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원가입">
					<input type="button" value="취소" onclick="location.href='mainpage.do'">
				</td>
			</tr>
		</table>
	</form>

	
	
<script type="text/javascript">
$("#formtag").submit(function() {
	var chk = document.getElementsByName("member_id")[0].title;
	var emailchk = document.getElementsByName("member_email")[0].title;
	var pw = document.getElementsByName("member_pw")[0].value;
	var pw1 = document.getElementsByName("member_pw1")[0].value; 
// 	alert(pw+" "+pw1);
// 	alert("tname"+tnamechk);
// 	alert("radio:"+radioVal);
	
		if(chk =="n"){
			alert("아이디 중복체크를 확인해주세요");
			document.getElementsByName("member_id")[0].focus();
			return false;
		}else if(emailchk == "n"){
			alert("이메일 인증을 확인해주세요.");
			document.getElementsByName("member_email")[0].focus();
			return false;
		}else if(pw != pw1){
			alert("비밀번호가 서로 같지 않습니다! 확인해주세요!");
			//document.getElementsByName("pw")[0].focus();
			return false;
		}else if(chk =="y" && pw == pw1){
			return true;
		}

});
</script>
   
</body>
</html>