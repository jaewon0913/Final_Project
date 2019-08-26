<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateForm</title>

 
<!-- include libraries(jQuery, bootstrap )-->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<!-- include summernote css/js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">


</head>
<body>
	<!-- header -->
		<%@ include file="../header.jsp"%>



	<h1>이벤트글 수정하기</h1>

	
	<form action="eventboard_update.do" method="post">
	
	<input type="hidden" name="event_postnum" value="${dto.event_postnum }" readonly="readonly">
	
	<input type="hidden" name="memeber_id" value="${dto.member_id }" readonly="readonly">
	
	<table class="table">
		<tr>
			<th> 날 짜 </th>
			<td colspan="2" readonly="readonly">${dto.event_regdate }</td>
		
		</tr>

		<tr>
			<th>작성자</th>
			<td colspan="2"><input type="text" name="member_name" value="${dto.member_name }" readonly="readonly"></td>
		</tr>	
		<tr>
			<th>이벤트리스트</th>
			<%-- <td colspan="2"><input type="text" name="event_title" value="${dto.event_title }" ></td> --%>
			<td colspan="2"><textarea rows="10" cols="60"  type="text" name="event_title" class="summernote">${dto.event_title }</textarea>
		</tr>
		<tr>
			<th>상세내용</th>
			<td colspan="2"><textarea rows="10" cols="60"  type="text" name="event_content" class="summernote">${dto.event_content }</textarea></td>
		</tr>
		<tr>
			<td colspan="3" align="right">
				<input type="button" value="취  소" onclick="location.href='eventboard_detail.do?event_postnum=${dto.event_postnum }'" class="btn btn-outline-light">
				<input type="submit" value="저 장" class="btn btn-outline-light" >
			</td>	
		</tr>
		
	</table>
	</form>
	
	<br>
	<br>

	
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	
<script>
$(document).ready(function() {
	  $('.summernote').summernote({
	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>

	<!--footer-->
	<%@ include file="../footer.jsp"%>


</body>
</html>