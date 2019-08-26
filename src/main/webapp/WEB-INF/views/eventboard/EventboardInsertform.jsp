<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap )-->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<!-- include summernote css/js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">

</head>
<%
String member_id = "test";
int member_level = 0;
%>

<body>
		
	<h1>이벤트 글쓰기</h1>

	<form action="eventboard_insert.do" method="post">
	
	<%-- <input type="hidden" name="member_id" value="${member_id }" readonly="readonly"><!--  세션에서 가져와야함 -->
	<input type="hidden" name="member_level" value="${member_level }" readonly="readonly"> --%>
	<input type="hidden" name="member_id" value="${logindto.member_id }" ><!--  세션에서 가져와야함 -->
	<input type="hidden" name="member_level" value="<%=member_level %>" >
<%-- 	member_id = <%= member_id %>
	<br>
	member_level = <%=member_level %> --%>
		<table class="table table-hover">
			
			<tr>
				<th>작성자</th>
				<td><input type="text" name="member_name" value="${logindto.member_name }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>제  목</th>
				<td><textarea name="event_title" class="summernote" ></textarea></td>
			</tr>
			<tr>
				<th>글 내용</th>
				<td colspan="2"><textarea name = "event_content" class="summernote"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="목록으로" onclick="location.href='eventboard_list.do'" class="btn btn-outline-light">
					<input type="submit" value="저  장" class="btn btn-outline-light">
				</td> 
			</tr>
		</table>
	</form>
	
	<br>
	<br>
	
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>	

<script type="text/javascript">
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