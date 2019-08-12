<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function emailSend(){//메일보내기
	var doc = document.getElementsByName("member_email")[1];

	if(doc.value != ""){
		$.ajax({
			url:"pw_mailSend.do",
			type:"post",
			data:"member_email="+doc.value,
			success:function(msg){
// 					alert(msg.emailnotused);
				alert("메일 전송 완료");
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
				alert(msg);
				alert(msg.emailchk_res);
				if(msg.emailchk_res == true){
					document.getElementsByName("member_email")[1].title="y";
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
</script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/login.js"></script> --%>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h1>아이디 비밀번호 찾기</h1>

	<!-- 아이디 찾기 -->

	<h3>아이디 찾기</h3>
	<div id="id_find" class="box">
		<form action="idfind.do" method="post">
			<input type="hidden" name="member_id">
			<table>
				<tr>
					<td>이 름</td>
				</tr>
				<tr>
					<td><input type="text" name="member_name" required="required">
					</td>
				</tr>
				<tr>
					<td>이 메 일</td>
				</tr>
				<tr>
					<td><input type="email" name="member_email" required="required"></td>
				</tr>
			</table>
			<input type="submit" id="idfind_alert" value="아이디 찾기">
		</form>
	</div>



	<div id="pw_find" class="box">
		<form id="formtag" action="pwupdateform.do" method="post">
			<input type="hidden" name="member_id">
			<table border="1">
				<tr>
					<td>아 이 디</td>
				</tr>
				<tr>
					<td><input type="text" name="member_id" required="required">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="member_email" title="n" required="required"> 
						<input type="button" value="이메일 인증요청" onclick="emailSend()"></td>
				</tr>
				<tr>
					<td>이메일 인증번호 입력</td>
					<td><input type="text" name="emailtext" required="required">
						<input type="button" value="인증번호 확인" onclick="emailChk()">
						<p id="emailresult"></p></td>
				</tr>
			</table>
			<input type="submit" id="pwfind_alert" value="비밀번호 찾기">
		</form>
	</div>

	<%@ include file="footer.jsp"%>
</body>
<script type="text/javascript">
$("#formtag").submit(function() {
	var emailchk = document.getElementsByName("member_email")[1].title;
		if(emailchk == "n"){
			alert("email check! 이메일 인증을 확인해주세요.");
			document.getElementsByName("member_email")[1].focus();
			return false;
		}else if(emailchk =="y"){
			return true;
		}

});
</script>
</html>