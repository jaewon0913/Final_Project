<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QRcode 조회</title>
</head>
<body>
<%@ include file="../header.jsp"%>

	
<div class="container " style="text-align: center; margin-bottom: 10rem;">
<h1 style="text-align: left;">QRcode 조회</h1>
	<div class="container">
		<c:choose>
			<c:when test="${empty list }">
				<div>
					<p>조회할 QR코드가 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
						<table style="float: left; width: 50%; vertical-align: center; " class="border">

							<tr>
								<td>
									${dto.dosirak_title }
									<br/>
									${dto.order_regdate }
								</td>
								<th>${dto.qrcode } </th>
							</tr>
						</table>
					</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</div>
	<div style="text-align: right;">
			<input type="button" value="홈 화면" onclick="location.href='mainpage.do'" class="btn btn-outline-light">
		</div>
	</div>
<%@ include file="../footer.jsp"%>
</body>
</html>