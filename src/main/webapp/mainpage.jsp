<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/mainpage.css" rel="stylesheet" >
<script type="text/javascript" src = "${pageContext.request.contextPath}/resources/js/mainpage.js"></script>

</head>
<body>
	<h1 align = "center">메인페이지</h1>
	<hr/>
	
	<c:choose>
		<c:when test="${empty login.member_id }">
			<div align = "right">
				<button class = "loginbutton" onclick = "loginform()">로그인</button>
				<button class = "insertbutton" onclick ="location.href='insertform.do'">회원가입</button>
			</div>
		</c:when>
		<c:otherwise>
			<div align = "right">
				<span>${login.member_id } 님</span>
				<button class = "mypagebutton" onclick ="location.href='detail.do'">마이페이지</button>
				<button class = "logoutbutton" onclick ="location.href='logout.do'">로그아웃</button>
			</div>
		</c:otherwise>
	</c:choose>
	
	<div class = "tabmenu" align = "center">
		<button class = "tablinks" onclick = "">도시락커스텀</button>
		<button class = "tablinks" onclick = "">도시락메뉴</button>
		<button class = "tablinks" onclick = "">공지사항</button>
		<button class = "tablinks" onclick = "">이벤트게시판</button>
	</div>
	
	
	<div id = "loginform">
		<table align = "center">
			<tr>
				<th>ID</th>
				<td><input type = "text" name = "id" id = "loginid" placeholder = "아이디를 입력해주세요" /></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type = "password" name = "pw" id = "loginpw" placeholder = "비밀번호를 입력해주세요" /></td>
			</tr>
			<tr>
				<td colspan = "2" align = "center">
					<input type = "button" value = "로그인" onclick = "login()"/>
					<input type = "button" value = "회원가입" />
					<input type = "button" value = "취소" onclick = "cancleloginform()" />
				</td>
			</tr>
		</table>
	</div>
</body>
</html>