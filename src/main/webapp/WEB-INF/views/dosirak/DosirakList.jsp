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
.best3img {
	width: 25rem; 
	height : 25rem; 
	transition: width 0.5s, height 0.5s;
}

.best3img:hover {
	width: 28rem; 
	height : 28rem; 
}

.best3{
	height: 30rem;
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
	width: 100%;
	height: 20rem;
}
.event:hover{
	width: 100%;
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
.number{
	display: block;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 2;
    width: 60px;
    height: 60px;
    padding-top: 9px;
    background: rgba(89,202,183,0.45);
    text-align: center;
    font-size: 20px;
    color: #fff;
    line-height: 100%;
}
.dosirakimg{
	width: 25rem;
	height: 25rem;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function pageMove_dosirak(page) {
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
<img alt="evevt" src="resources/bootstrap/image/보물찾기_이벤트.png" onclick="location.href='eventboard_list.do'" class="event">
</div>
<!-- ------------------best3------------------ -->
	<div class="container best3 center border-bottom	">
		
		<c:choose>
			<c:when test="${empty viewslist}">
				<h3>베스트메뉴 도시락이 없습니다.</h3>
			</c:when>
			<c:otherwise>
				<c:forEach items="${viewslist}" var="viewsdto">
					<div class="col-lg-4 col-md-4 col-sm-2 col-xs-5">
					<div onclick="location.href='dosirak_selectone.do?dosirak_postnum=${viewsdto.dosirak_postnum}'">
					<div class="number">${viewsdto.bestnum }<p>Best</p></div>
					<img alt="test" src="${pageContext.request.contextPath }/resources/etc/multiupload/${viewsdto.mainimage}" class="best3img">
					<input type="hidden" name="dosirak_postnum" value="${viewsdto.dosirak_postnum}">
					</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</div>

<!-- ------------------best3------------------ -->
	

	<div class="container">
	<div class="conrainer">
		<h1 align="center">메	뉴</h1>
	</div>
		
			<div style="border: 1 solid gray; width: 100%;">
				<div class="row">
				<table>
					<c:choose>
						<c:when test="${empty list}">
							<h3>판매중인 도시락이 없습니다.</h3>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="dto">
								<div
									class="gallery_product col-lg-3 col-md-3 col-sm-2 col-xs-5 filter hdpe menu ">
									<div onclick="location.href='dosirak_selectone.do?dosirak_postnum=${dto.dosirak_postnum}'"> 
										<img alt="이미지" src="${pageContext.request.contextPath }/resources/etc/multiupload/${dto.mainimage}" class="dosirakimg" />
										<input type="hidden" name="dosirak_postnum" value="${dto.dosirak_postnum}">
										<div style="text-align: center;">
											<h1>${dto.dosirak_name}</h1>
											<p>${dto.dosirak_content }</p>
											<h3>${dto.dosirak_price}원</h3>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
								
					</table>
					
				</div>
				<div>
				<br/>
				<br/>
				</div>
				<c:choose>
					<c:when test="${logindto.member_id eq 'admin'}">
				<div style="float: right; margin: 3%;">
					<input type="button" value="메인화면" onclick="location.href='startpage.jsp'" class="btn btn-outline-light"> 
					<input type="button" value="작성하기" class="btn btn-outline-light" onclick="location.href='dosirak_insertform.do'">
				</div>
				</c:when>
				<c:otherwise>
					<div style="float: right; margin: 3%;">
					<input type="button" value="메인화면" onclick="location.href='startpage.jsp'" class="btn btn-outline-light"> 
					
					</div>
				
				</c:otherwise>
				</c:choose>
				
				
			</div>
		
	</div>

	<!-- Pagination -->
	<div class="container text-center " style="font-size: 3rem; margin-bottom: 5rem;">
		<a href="javascript:pageMove_dosirak(${paging.firstPageNo})"  class="page">&laquo;</a> <a
			href="javascript:pageMove_dosirak(${paging.prevPageNo})" class="page">&lt;</a>
		<c:forEach var="i" begin="${paging.startPageNo}"
			end="${paging.endPageNo}" step="1">
			<c:choose>
				<c:when test="${i eq paging.pageNo}">
					<a href="javascript:pageMove_dosirak(${i})" class="page">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:pageMove_dosirak(${i})" class="page">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<a href="javascript:pageMove_dosirak(${paging.nextPageNo})" class="page">&gt;</a> <a
			href="javascript:pageMove_dosirak(${paging.finalPageNo})" class="page">&raquo;</a>
	</div>
	<!-- ------------------------푸터-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------푸터-------------------------------------------- -->
</body>
</html>
