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
<style type="text/css">
.iii {
	width: 25rem; 
	height : 25rem; 
	transition: width 0.5s, height 0.5s;
}

.iii:hover {
	width: 28rem; 
	height : 28rem; 
	
}

.best3{
	height: 42rem;
}

.menu{
	margin-top: 2%;
	margin-left: 6%;
}
.menu:hover {
	margin-top: 2%;
	margin-left: 6%;
	opacity: 0.8;
	
}
.event{
	width: 70%;
	height: 20rem;
}
.event:hover{
	width: 70%;
	height: 20rem;
	opacity: 0.8;
}
.search{
margin-top: 1rem;
}
.bar{
margin-top: 8rem;
}
.logo2{
	width: 20rem;
	height: 8rem;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function PageMove_dosirak(page) {
    location.href = "dosirak_listpaging.do?page=" + page + "&txt_search=" + $('input#txt_search').val();
 }
   
	function allChk(val){
		var chks = document.getElementsByName('chk');
			for(var i=0 ; i<chks.length ; i++){
				chks[i].checked = val;
	}
}
</script>
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

<body>
	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../header.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->
	<div class="container text-center center" >
<img alt="evevt" src="resources/bootstrap/image/event3.png" onclick="location.href='eventboard_list.do'" class="event">
</div>
<!-- ------------------best3------------------ -->
	<div class="container best3 center ">
		<h1>Best 3</h1>
		<br/><br/><br/>
		
		<div class="col-lg-4 col-md-4 col-sm-2 col-xs-5">
			<img alt="test" src="resources/bootstrap/image/do1.jpg" class="iii">
		</div>
		
		<div class="col-lg-4 col-md-4 col-sm-2 col-xs-5">
			<img alt="test" src="resources/bootstrap/image/do1.jpg" class="iii">
		</div>
		
		<div class="col-lg-4 col-md-4 col-sm-2 col-xs-5">
			<img alt="test" src="resources/bootstrap/image/do1.jpg" class="iii">
		</div>
		
		
	</div>

<!-- ------------------best3------------------ -->
	

	<div class="container">
	<h1 align="center">메	뉴</h1>
		
			<div style="border: 1px solid salmon; width: 100%;">
				<div class="row">
				<table>
					<c:choose>
						<c:when test="${empty list}">
							<h3>판매중인 도시락이 없습니다.</h3>
							<input type="button" value="작성하기" class="btn btn-outline-light" onclick="location.href='#'">
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="dto">
								<div
									class="gallery_product col-lg-3 col-md-3 col-sm-2 col-xs-5 filter hdpe menu ">
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
				<div style="float: right; margin: 3%;">
					<input type="button" value="메인화면" onclick="location.href='mainpage.jsp'" class="btn btn-outline-light"> 
					<input type="button" value="작성하기" class="btn btn-outline-light" onclick="location.href='#'">
				</div>
			</div>
		
	</div>

	<!-- Pagination -->
	<div class="container text-center " style="font-size: 3rem;">
		<a href="javascript:PageMove_dosirak(${paging.firstPageNo})"  class="page">&laquo;</a> <a
			href="javascript:PageMove_dosirak(${paging.prevPageNo})" class="page">&lt;</a>
		<c:forEach var="i" begin="${paging.startPageNo}"
			end="${paging.endPageNo}" step="1">
			<c:choose>
				<c:when test="${i eq paging.pageNo}">
					<a href="javascript:PageMove_dosirak(${i})" class="page">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:PageMove_dosirak(${i})" class="page">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<a href="javascript:PageMove_dosirak(${paging.nextPageNo})" class="page">&gt;</a> <a
			href="javascript:PageMove_dosirak(${paging.finalPageNo})" class="page">&raquo;</a>
	</div>
	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->
</body>
</html>
