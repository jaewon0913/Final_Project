<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 이벤트게시판 list </title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

<style type="text/css">
.title{
	width: 10rem;
}
</style>

</head>
 
<script type="text/javascript">
	function PageMove_event(page, data) {
		location.href = "eventboard_list.do?page=" + page + "&txt_search=" + $('input#txt_search').val();
		
	
	}

</script>

 


<body>

	<!-- header -->
	<%@ include file="../header.jsp"%>

<div class="container">
	<h1>이벤트 게시판</h1>
	<br>
	
		<table>
		<tr>
			<td><input type="hidden" id="txt_search" value="${txt_search }"/> 
				<input type="hidden" value="검색" onclick="javascript:PageMove(${paging.pageNo})"/>
			</td>
		</tr>
	</table>
	
	<br>

	<c:choose>
		<c:when test="${empty eventboard_list }">
			<h3>고객 정보가 없습니다. ㅜ.ㅜ...</h3>
			<tr>
					<td colspan="3">===== 작성된 글이 없습니다 ====</td>
					
			</tr>
				<c:choose>
					<c:when test="${logindto.member_id eq 'admin'}">
						<tr>
							<td colspan="3" align="right"><input type="button"
								value="글쓰기" onclick="location.href='eventboard_insertform.do'"
								class="btn btn-outline-light"></td>
						</tr>
					</c:when>
				</c:choose>
			</c:when>
		<c:otherwise>
			
				<table class="table table-hover">
	

					<tr>
						
						<td>이벤트글(제목)</td>
						<!--나중에  조회수, 작성일은 는 관리자만 보이게 설정하기 8019-->
						<th>조회수</th>
						
						<c:choose>
						<c:when test="${logindto.member_id ne null }">
						<!-- <th>제목</th> -->
						<th>작성일</th>
						</c:when>
						</c:choose>
						
					</tr>
					<c:forEach items="${eventboard_list }" var="dto">
						<tr>
							<%-- <td><input type="checkbox" name="event_chk" value="${dto.member_name} }"></td> --%>
							<!-- 체크삭제 관리자만보이기 -->	
						<%-- 	<c:choose>
							<c:when test="${logindto.member_id ne null }">
							<td><input type="checkbox" name="event_chk" value="${dto.event_postnum}"></td>
							</c:when>
							</c:choose> --%>
							<%-- <td>${dto.event_postnum }</td>
							<td>${dto.member_name }</td> --%>
							
							<td><a href="eventboard_detail.do?event_postnum=${dto.event_postnum }">${dto.event_title}</td>
							
							
							<td>${dto.event_views }</td>
							
							<!-- 관리자만 보이게 할계획 0819 -->
							<td>${dto.event_regdate }</td>
							<%-- <c:choose>
							<c:when test="${logindto.member_id ne null }">
							<td><a href="eventboard_detail.do?event_postnum=${dto.event_postnum }">${dto.event_title }</a></td>
							<td>${dto.event_regdate }</td>
							<td><input type="button" value="수 정" onclick="location.href='eventboard_updateform.do?event_postnum=${dto.event_postnum }'" class="btn btn-outline-light">
							<input type="submit" value="삭 제"  onclick="location.href='eventboard_delete.do?event_postnum=${dto.event_postnum }'" class="btn btn-outline-light"></td>
							</c:when>
							</c:choose> --%>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6" align="right">
							<c:choose>
							<c:when test="${logindto.member_id ne null }">
							<input type="button" value="글쓰기" onclick="location.href='eventboard_insertform.do'" class="btn btn-outline-light">
							</c:when>
							</c:choose>

						</td>
					</tr>
				</table>
			
		</c:otherwise>
	</c:choose>




		<!-- Pagination -->
	<div class="container text-center " style="font-size: 3rem;">
		<a href="javascript:PageMove_event(${paging.firstPageNo})"  class="page">&laquo;</a> <a
			href="javascript:PageMove_event(${paging.prevPageNo})" class="page">&lt;</a>
		<c:forEach var="i" begin="${paging.startPageNo}"
			end="${paging.endPageNo}" step="1">
			<c:choose>
				<c:when test="${i eq paging.pageNo}">
					<a href="javascript:PageMove_event(${i})" class="page">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:PageMove_event(${i})" class="page">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<a href="javascript:PageMove_event(${paging.nextPageNo})" class="page">&gt;</a> <a
			href="javascript:PageMove_event(${paging.finalPageNo})" class="page">&raquo;</a>
	</div>
		<!-- /Pagination -->


		<script type="text/javascript">

	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			airMode : true,
			focus : true,
			lang : 'ko-KR'
		});
	});
</script>
</div>
	<!-- footer -->
  <%@ include file="../footer.jsp"%>
  
  
</body>
</html>