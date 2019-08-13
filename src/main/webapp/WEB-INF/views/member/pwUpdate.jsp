<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#formtag").submit(function() {
			var pw = document.getElementsByName("member_pw")[0].value;
			var pw1 = document.getElementsByName("member_pw1")[0].value;
			
			if (pw != pw1) {
				alert("password check! 비밀번호가 서로 같지 않습니다! 확인해주세요!");
				//document.getElementsByName("pw")[0].focus();
				return false;
			} else {
				return true;
			}
		})
	});
</script>
</head>
<body>
	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../header.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->

	<h1>비밀번호 재설정</h1>

	<form id="formtag" action="pwupdate.do" method="post">

		<input type="hidden" name="member_id" value="${member_id}"> <input
			type="password" name="member_pw" value="" required="required" /></br> <input
			type="password" name="member_pw1" value="" required="required" /><br>

		<input type="submit" value="수정하기"> <input type="button"
			value="취소하기" onclick="location.href='mypage.do'">

	</form>

	<!-- ------------------------푸터-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------푸터-------------------------------------------- -->

</body>
</html>