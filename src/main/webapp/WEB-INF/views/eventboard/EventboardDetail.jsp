<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>

<!-- include libraries(jQuery, bootstrap )-->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<!-- include summernote css/js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">


</head>
<body>
<!-- header -->
		<%@ include file="../header.jsp"%>
<div class="container">


	<h2>이벤트 상세보기</h2>
	<br>
	<table class="table ">
	
	

		<tr>
			<th>번호</th>
			<td>${dto.event_postnum }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${dto.event_regdate }</td>
		</tr>
		
		<tr>
			<th>작성자</th>
			<td>${dto.member_name }</td>
		</tr>
<%-- 		<tr>
			<th>이벤트 리스트글</th>
			<td>${dto.event_title }</td>
		</tr> --%>
		<tr>
			<th>내   용</th>
			<td>${dto.event_content }</td>
			
		</tr>
			

		<tr>
			<td colspan="3" align="right">
					<input type="button" value=" 목록으로 " onclick="location.href='eventboard_list.do'" class="btn btn-outline-light">
					<c:choose>
					<c:when test="${logindto.member_id ne null }">
					<input type="button" value=" 글수정 " onclick="location.href='eventboard_updateform.do?event_postnum=${dto.event_postnum }'" class="btn btn-outline-light">
					<input type="button" value=" 삭  제 " onclick="removeCheck()" class="btn btn-outline-light">
					</c:when>
					</c:choose>
			</td>
		</tr>	
	</table>
	
	
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	
	
	<!-- 취소 alert -->
	<script type="text/javascript">
	function removeCheck(){
		if(confirm("정말 삭제하시겠습니까 ??") == true){    //확인
			location.href="eventboard_delete.do?event_postnum=${dto.event_postnum }";
			return true;

		}else{  //취소
			return false;
		}
	}
	
	</script>
	<br>
	<br>
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
	<%@ include file="../footer.jsp"%>

</body>
</html>