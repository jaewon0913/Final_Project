<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
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


	<h1>개인정보 수정</h1>
	<br />
	<form id="formtag" action="update.do" method="post"
		class="container text-center">
		<div class="container col-sm-8 text-center" style="padding-left: 30%">
			<table class="table">
				<tr>
					<td>이름</td>
					<th>${logindto.member_name}</th>
				</tr>
				<tr>
					<td>ID</td>
					<th>${logindto.member_id}</th>
				</tr>
				<tr>
					<td>PW</td>
					<th><input type="text" name="member_pw"
						value="${logindto.member_pw}" /></th>
				</tr>
				<tr>
					<td>PW1</td>
					<th><input type="text" name="member_pw1"
						value="비밀번호를 한번더 입력해주세요" /></th>
				</tr>
				<tr>
					<td>전화번호</td>
					<th><input type="text" name="member_phone"
						value="${logindto.member_phone}"></th>
				</tr>
				<tr>
					<td>이메일</td>
					<th><input type="email" name="member_email"
						value="${logindto.member_email}" /></th>
				</tr>
				<tr>
					<td>주소</td>
					<th><input type="text" name="member_address"
						value="${logindto.member_address}" /></th>
				</tr>
				<tr>
					<td>지하철 역</td>
					<th><input type="text" name="member_subway"
						value="${logindto.member_subway}" /></th>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit"
						value="수정하기" class="btn btn-outline-dark"> <input
						type="button" value="취소하기" onclick="location.href='mypage.do'"
						class="btn btn-outline-dark"></td>
				</tr>
			</table>
		</div>
	</form>

	<!-- ------------------------푸터-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------푸터-------------------------------------------- -->


</body>
</html>