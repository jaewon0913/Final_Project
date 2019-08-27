<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
</head>
<body>

	<%@ include file="../header.jsp"%>

	<h1>개인정보 수정</h1>
	<br/>
	 <form action="update.do" method="post" class="container text-center" >
	 <div class="container col-sm-8 text-center" style="padding-left: 30%;" >
	<table class="table">
		<tr>
			<td>이름</td>
			<th><input type="text" name="member_name" value="${memberdto.member_name}" readonly="readonly"/></th>
		</tr>
		<tr>
			<td>ID</td>
			<th><input type="text" name="member_id" value="${memberdto.member_id}" readonly="readonly"/></th>
		</tr>
		<tr>
			<td>PW</td>
			<th><input type="password" name="member_pw" value="${memberdto.member_pw}"/></th>
		</tr>
		<tr>
			<td>전화번호</td>
			<th><input type="text" name="member_phone" value="${memberdto.member_phone}"></th>
		</tr>
		<tr>
			<td>이메일</td>
			<th><input type="email" name="member_email" value="${memberdto.member_email}"/></th>
		</tr>
		<tr>
			<td>주소</td>
			<th><input type="text" name="member_address" value="${memberdto.member_address}"/></th>
		</tr>
		<tr>
			<td>지하철 역</td>
			<th><input type="text" name="member_subway" value="${memberdto.member_subway}"/></th>
		</tr>
		<tr >
			<td colspan="2" align="right">
				<input type="submit" value="수정하기" class="btn btn-outline-dark" >
				<input type="button" value="취소하기" onclick="location.href='mypage.do'" class="btn btn-outline-dark" >
				<input type="button" value="탈퇴하기" onclick="location.href='withdrawal.do?member_id=${memberdto.member_id}'" class="btn btn-outline-dark">
			</td>
		</tr>
	</table>
	</div>
	</form>
	
	<%@ include file="../footer.jsp"%>
	
</body>
</html>