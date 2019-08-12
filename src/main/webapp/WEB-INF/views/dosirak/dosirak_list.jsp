<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도시락 list</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
   function PageMove(page) {
      location.href = "dosirak_listpagig.do?page=" + page + "&txt_search=" + $('input#txt_search').val();
   }
</script>
<script type="text/javascript">
	function allChk(val){
		var chks = document.getElementsByName('chk');
			for(var i=0 ; i<chks.length ; i++){
				chks[i].checked = val;
	}
}
</script>

<body>
	<div class="cotainer">
		<table class="pull-right">
			<tr>
				<td colspan="4">
					<div class="form-group form-inline">
						<input type="text" id="txt_search" value="${txt_search }">
						<button type="button"
							onclick="javascript:PageMove(${paging.pageNo})">검색하기</button>
					</div>
				</td>
			</tr>
		</table>
	</div>

	<h1 align="center">주문량 Best 3</h1>
		<table border="1">
			<tr>
				<td align="center">헬로</td>
			</tr>
		</table>
	
	<h1 align="center">메	뉴</h1>

	<div class="container">
		<table>
			<div style="border: 1px solid salmon;">
				<div class="row">
					<c:choose>
						<c:when test="${empty list}">
							<h3>판매중인 도시락이 없습니다.</h3>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="dto">
								<div
									class="gallery_product col-lg-4 col-md-4 col-sm-2 col-xs-5 filter hdpe">
									<a
										href="dosirak_selectone.do?dosirak_postnum=${dto.dosirak_postnum}" onclick=""> 
										<img alt="이미지" src="https://dosirakmall.wisacdn.com/_data/product/201901/11/214bf675538ebab78e937949a977544e.jpg" style="width: 250px; height: 250px;" />
										<input type="hidden" name="dosirak_postnum" value="${dto.dosirak_postnum}">
										<div>
											<h2>${dto.dosirak_name}/${dto.dosirak_price}원</h2>
										</div>
									</a>
								</div>
							</c:forEach>

							<tr>
								<td colspan="2"><input type="button" value="메인화면" onclick="location.href='mainpage.jsp'"> 
								<input type="button" value="작성하기"></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</table>
	</div>

	<!-- Pagination -->
	<div class="container text-center " style="font-size: 3rem;">
		<a href="javascript:PageMove(${paging.firstPageNo})">&laquo;</a> <a
			href="javascript:PageMove(${paging.prevPageNo})">&lt;</a>
		<c:forEach var="i" begin="${paging.startPageNo}"
			end="${paging.endPageNo}" step="1">
			<c:choose>
				<c:when test="${i eq paging.pageNo}">
					<a href="javascript:PageMove(${i})">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:PageMove(${i})">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<a href="javascript:PageMove(${paging.nextPageNo})">&gt;</a> <a
			href="javascript:PageMove(${paging.finalPageNo})">&raquo;</a>
	</div>
</body>
</html>
