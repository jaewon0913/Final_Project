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
<style type="text/css">
.nu{
	margin-bottom: 5rem;
	margin-top: 5rem;
	text-align: center;
}
</style>
</head>
<body>
	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../header.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->
	<div class="container nu center">
		<h1>비밀번호 재설정</h1>

		<form id="formtag" action="pwupdate.do" method="post">
			<table class="table center" style="text-align: center;">
				<tr>
				
					<td>
					<input type="hidden" name="member_id" value="${member_id}">
					<input type="password" name="member_pw" value=""
						required="required" /></td>
				</tr>
				<tr>
					<td><input type="password" name="member_pw1" value=""
						required="required" /></td>
				</tr>
				<tr>
					<td colspan="1"><input type="submit" value="수정하기"
						class="btn btn-outline-light"> <input type="button"
						value="취소하기" class="btn btn-outline-light"
						onclick="location.href='mypage.do'"></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- ------------------------푸터-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------푸터-------------------------------------------- -->
	
</body>
</html>