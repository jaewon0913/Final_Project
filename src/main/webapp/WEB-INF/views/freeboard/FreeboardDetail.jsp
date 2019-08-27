<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% MemberDto logindto = (MemberDto) session.getAttribute("logindto");%>
<!DOCTYPE html>
<html>
<head>
<!-- <META HTTP-EQUIV="refresh" CONTENT="10"> 10초마다 새로고침-->
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
	<h2>자유게시판 상세보기</h2>
	<table class="table">
	
	

		<tr>
			<th>번호</th>
			<td>${dto.free_postnum }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${dto.free_regdate }</td>
		</tr>
		
		<tr>
			<th>작성자</th>
			<td>${dto.member_name }</td>
		</tr>
		<tr>
			<th>제   목</th>
			<td>${dto.free_title }</td>
		</tr>
		<tr>
			<th>내   용</th>
			<td colspan="6">
			<textarea rows="8" cols="80" readonly="readonly">${dto.free_content }</textarea>
		
		</tr>
			

		<tr>
			<td colspan="3" align="right">
					<input type="button" value=" 목록으로 " onclick="location.href='freeboard_list.do'" class="btn btn-outline-light">
					<c:choose>
					<c:when test="${logindto.member_id eq dto.member_id }">
					<input type="button" value=" 글수정 " onclick="location.href='freeboard_updateform.do?free_postnum=${dto.free_postnum }'" class="btn btn-outline-light">
					<%-- <input type="button" value=" 삭  제 " onclick="location.href='freeboard_delete.do?free_postnum=${dto.free_postnum }'"> --%>
					<input type="button" value=" 삭  제 " onclick="removeCheck()" class="btn btn-outline-light">
					</c:when>
					</c:choose>
			</td>
		</tr>	
	</table>
	
	
	<!-- 취소 alert -->
	<script type="text/javascript">
	function removeCheck(){
		if(confirm("정말 삭제하시겠습니까 ?? 삭제시 해당 모든 답글도 삭제 됩니다.") == true){    //확인
			location.href="freeboard_delete.do?free_postnum=${dto.free_postnum }";
			return true;

		}else{  //취소
			return false;
		}
	}

	</script>
	<br>
	<br>
	<br>
	
	<!---- 댓 글 ---------------------------------------------------------------------------------------------->
	
	<h3>&lt; 댓글보기 &gt;</h3>

			
				<table class="table">
					
					<tr>
						<th>작성자</th>
						<th>댓글</th>
						<th>작성일</th>
						<th></th>
					</tr>
					<c:forEach items="${cmt }" var="cmt">
						<tr>
							<%-- <td>${dto.member_name }</td --%>					
							<td>${logindto.member_name }</td>
							<td>${cmt.com_content }</td>
							<td>${cmt.com_regdate }</td>
							<td>
							<c:choose>
								<c:when test="${logindto.member_id eq cmt.member_id }">
								
								<input  type="button" value="수정1(일반)" onclick="location.href='com_board_updateform.do?com_num=${cmt.com_num}'">
								<%-- <input  type="button" value="수정3(큰새창)" onclick="window.open('com_board_updateform.do?com_num=${cmt.com_num}')"> --%>								
								<input  type="button" value="수정2(새창)"onclick="window.open('com_board_updateform.do?com_num=${cmt.com_num}', 'search', 'top=150px, left=400px, width=650, height=400')">
								
				
								<input  type="button" value="삭 제 " onclick="location.href='com_board_delete.do?com_num=${cmt.com_num}&free_postnum=${cmt.free_postnum}'">
								<!-- <input  type="button" value="삭 제 " > -->
							
								
								<!-- 새로고침 -->
								<input type="button" value="수정댓글확인" onClick="window.location.reload()">
									<!--오류:"수정1"로 할 경우 바로 저장된 화면이 적용 되지만 새창을 뛰울때에는 새로고침을 눌러야 적용이 됩니다." -->
								
								
								
								</c:when>
							</c:choose>
							</td>	
						</tr>
					</c:forEach>
					
				</table>
				
			
			

	<br>
	<br>
	<br>
	
	
	
	<h2> Comment 쓰기</h2>
	<br>
	
	
	<!-- COM_NUM, FREE_POSTNUM, MEMBER_ID, MEMBER_NAME, COM_CONTENT, COM_CONTAB, COM_COMNO, COM_COMSQ, COM_REGDATE -->
	<form action="com_board_insert.do" method="post">
	
	<input type="hidden" name="member_id" value="${logindto.member_id }" >
	<input type="hidden" name="free_postnum" value="${dto.free_postnum }" >

		<table class="table table-hover">
			
			<col width="100">
			<col width="100">
			<col width="100">
			
			<tr>
				<th>작성자</th>
				<td><input type="text" name="member_name" value="${logindto.member_name }" readonly="readonly"></td>
				<!-- <td><input type="text" name="member_name" value="ddd" readonly="readonly"></td> -->
			</tr>
			<tr>
				<th>댓글쓰기</th>
				<td><textarea row="300" cols="100" name="com_content" placeholder="댓글을 작성해 주세요"  ></textarea></td>
			</tr>
			<c:choose>
				<c:when test="${logindto.member_id ne null }">
					<tr align="right">
						<td colspan="2"><input type="submit" value="저  장" class="btn btn-outline-light"></td>
					</tr>
				</c:when>
			</c:choose>
		</table>
	</form>
	<br>
	<br>	
	

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>	
	
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