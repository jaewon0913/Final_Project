<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</style>
</head>
<body>
	
	<%@ include file="header.jsp"%>
	
	<h1>마이 페이지</h1>
	
	<div><button onclick="location.href='detail.do?id=${login.member_id}'">개인정보 수정</button></div>
	
	<div><button>결제 내역</button></div>
	
	<div><button>장바구니</button></div>
	
	<div><button>QR코드 조회</button></div>
	
	<%@ include file="footer.jsp"%>

</body>
</html>