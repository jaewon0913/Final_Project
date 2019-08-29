<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글작성</title>
</head>
<%
int member_level = 0;
%>

<body>
		
	<!--header -->
	<%@ include file="../header.jsp"%>
		
	
		
	<form action="freeboard_insert.do" method="post">
	
	<%-- <input type="hidden" name="member_id" value="${member_id }" readonly="readonly"><!--  세션에서 가져와야함 -->
	<input type="hidden" name="member_level" value="${member_level }" readonly="readonly"> --%>
	<input type="hidden" name="member_id" value="${logindto.member_id }" ><!--  세션에서 가져와야함 -->
	<input type="hidden" name="member_level" value="<%=member_level %>" >
<%-- 	member_id = <%= member_id %>
	<br>
	member_level = <%=member_level %> --%>
		<table class="table table-hover">
			
			<col width="100">
			<col width="100">
			<col width="100">
			
			<tr>
				<th>작성자</th>
				<td><input type="text" name="member_name" value="${logindto.member_name }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>제  목</th>
				<td><input type="text"	name="free_title" placeholder="졔목을 작성해 주세요"></td>
			</tr>
			<tr>
				<th>글 내용</th>
				<td><textarea rows="60" cols="100"  name="free_content" placeholder="글을 작성해 주세요"  ></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="목록으로" onclick="location.href='freeboard_list.do'" class="btn btn-outline-light">
					<input type="submit" value="저  장" class="btn btn-outline-light">
				</td> 
			</tr>
		</table>
	</form>
	
	<br>
	<br>
	
	<!--footer-->
	<%@ include file="../footer.jsp"%>

</body>
</html>