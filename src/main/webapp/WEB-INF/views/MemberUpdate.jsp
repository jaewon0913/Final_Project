<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$("#formtag").submit(function() {
	var pw = document.getElementsByName("member_pw")[0].value;
	var pw1 = document.getElementsByName("member_pw1")[0].value; 
	
		if(pw != pw1){
			alert("password check! 비밀번호가 서로 같지 않습니다! 확인해주세요!");
			//document.getElementsByName("pw")[0].focus();
			return false;
		}else {
			return true;
		}
}); 
</script>
</head>
<body>

	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="header.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->
	
	<h1>개인정보 수정페이지</h1>
	 <form id="formtag" action="update.do" method="post">
	
	<input type="text" name="member_name" value="${logindto.member_name}" readonly="readonly"/></br>

	<input type="text" name="member_id" value="${logindto.member_id}" readonly="readonly"/></br>
	
	<input type="password" name="member_pw" value="${logindto.member_pw}"/></br>
	
	<input type="text" name="member_pw1" value="비밀번호를 한번더 입력해주세요"/><br>
	
	<input type="text" name="member_phone" value="${logindto.member_phone}"></br>
	
	<input type="email" name="member_email" value="${logindto.member_email}"/></br>
	
	<input type="text" name="member_address" value="${logindto.member_address}"/></br>
	
	<input type="text" name="member_subway" value="${logindto.member_subway}"/></br>
	
	<input type="submit" value="수정하기">
	
	<input type="button" value="취소하기" onclick="location.href='mypage.do'">
	
	</form>
	
	<!-- ------------------------푸터-------------------------------------------- -->
	<%@ include file="footer.jsp"%>
	<!-- ------------------------푸터-------------------------------------------- -->
</body>
</html>