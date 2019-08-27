<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	MemberDto logindto = (MemberDto) session.getAttribute("logindto");
%>
</head>
<body>
	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../header.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->

	<c:choose>
		<c:when test="${empty noticelist }">
		</c:when>
		<c:otherwise>
			<h1>공지사항 게시판</h1>
			<br />
			<div class="container col-sm-12 text-center">
				<table class="table table-hover ">
					<tr>
						<th>번 호</th>
						<th>작성자</th>
						<th>제 목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:choose>
						<c:when test="${fn:length(noticelist) <= 3}">
							<c:forEach items="${noticelist }" var="NoticeDto">
								<tr>
									<td id="seq">${NoticeDto.notice_postnum}</td>
									<td>${NoticeDto.member_id }</td>
									<td><a href="notice_detail.do?notice_postnum=${NoticeDto.notice_postnum}">${NoticeDto.notice_title}</a></td>
									<td>${NoticeDto.notice_regdate}</td>
									<td>${NoticeDto.notice_views}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach items="${noticelist }" var="NoticeDto" varStatus = "status" begin = "0" end = "3">
								<tr>
									<td id="seq">${NoticeDto.notice_postnum}</td>
									<td>${NoticeDto.member_id }</td>
									<td><a href="notice_detail.do?notice_postnum=${NoticeDto.notice_postnum}">${NoticeDto.notice_title}</a></td>
									<td>${NoticeDto.notice_regdate}</td>
									<td>${NoticeDto.notice_views}</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan = "5">
									<input type = "button" value = "더보기" onclick = "location.href='notice_list.do'">
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${empty freelist }">
		</c:when>
		<c:otherwise>
			<h1>자유 게시판</h1>
			<br />
			<div class="container col-sm-12 text-center">
				<table class="table table-hover ">
					<tr>
						<th>번 호</th>
						<th>작성자</th>
						<th>제 목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:choose>
						<c:when test="${fn:length(freelist) <= 3}">
							<c:forEach items="${freelist }" var="dto">
								<tr>
									<td>${dto.free_postnum }</td>
									<td>${dto.member_name }</td>
									<td><a href="freeboard_detail.do?free_postnum=${dto.free_postnum }">${dto.free_title }</a></td>
									<td>${dto.free_regdate }</td>
									<td>${dto.free_views }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach items="${freelist }" var="dto" varStatus = "status" begin = "0" end = "3">
								<tr>
									<td>${dto.free_postnum }</td>
									<td>${dto.member_name }</td>
									<td><a href="freeboard_detail.do?free_postnum=${dto.free_postnum }">${dto.free_title }</a></td>
									<td>${dto.free_regdate }</td>
									<td>${dto.free_views }</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan = "5">
									<input type = "button" value = "더보기" onclick = "location.href='freeboard_list.do'">
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${empty dosiraklist }">
		</c:when>
		<c:otherwise>
			<h1>도시락 게시판</h1>
			<br />
			<div style="border: 1px solid salmon; width: 100%;">
				<div class="row">
				<table>
					<c:choose>
						<c:when test="${fn:length(dosiraklist) <= 3}">
							<c:forEach items="${dosiraklist}" var="dto">
								<div class="gallery_product col-lg-3 col-md-3 col-sm-2 col-xs-5 filter hdpe menu ">
									<div onclick="location.href='dosirak_selectone.do?dosirak_postnum=${dto.dosirak_postnum}'">
										<img alt="이미지" src="https://dosirakmall.wisacdn.com/_data/product/201901/11/214bf675538ebab78e937949a977544e.jpg" style="width: 20rem; height: 20rem;" />
										<input type="hidden" name="dosirak_postnum" value="${dto.dosirak_postnum}">
										<div style="text-align: center;">
											<p>${dto.dosirak_name}/${dto.dosirak_price}원</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach items="${dosiraklist}" var="dto" varStatus = "status" begin = "0" end ="4">
								<div class="gallery_product col-lg-3 col-md-3 col-sm-2 col-xs-5 filter hdpe menu ">
									<div onclick="location.href='dosirak_selectone.do?dosirak_postnum=${dto.dosirak_postnum}'">
										<img alt="이미지" src="https://dosirakmall.wisacdn.com/_data/product/201901/11/214bf675538ebab78e937949a977544e.jpg" style="width: 20rem; height: 20rem;" />
										<input type="hidden" name="dosirak_postnum" value="${dto.dosirak_postnum}">
										<div style="text-align: center;">
											<p>${dto.dosirak_name}/${dto.dosirak_price}원</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				</div>
				<input type = "button" value = "더보기" onclick = "location.href='dosirak_list.do'">
			</div>
		</c:otherwise>
	</c:choose>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>
	<!-- footer -->
</body>
</html>