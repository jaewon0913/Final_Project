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
<script src="resources/js/login.js"></script>

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
   
</body>
</html>