<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="header.jsp"%>

	<h1>개인정보 수정페이지</h1>
	 <form action="update.do" method="post">
	
	<input type="text" name="name" value="${login.member_name}" readonly="readonly"/></br>

	<input type="text" name="id" value="${login.member_id}" readonly="readonly"/></br>
	
	<input type="password" name="pw" value="${login.member_pw}"/></br>
	
	<%-- <input type="password" name="pwchk" value="${login.member_pw}"/></br> --%>
	
	<input type="text" name="phone" value="${login.member_phone}"></br>
	
	<input type="email" name="email" value="${login.member_email}"/></br>
	
	<input type="text" name="address" value="${login.member_address}"/></br>
	
	<input type="text" name="subway" value="${login.member_subway}"/></br>
	
	<input type="submit" value="수정하기">
	<input type="button" value="취소하기" onclick="location.href='MemberMyPage.jsp'">
	
	</form>

	<%@ include file="footer.jsp"%>
	
</body>
</html>