<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Comment 수정하기</title>
</head>
<body>


	<h2>댓글 수정하기</h2>
	<form action="com_board_update.do" method="post">
	
		<input type="hidden" name="free_postnum" value="${cmt.free_postnum }" readonly="readonly">
		<input type="hidden" name="com_num" value="${cmt.com_num }" readonly="readonly">
		<input type="hidden" name="memeber_id" value="${cmt.member_id }" readonly="readonly">
	
	<table class="table table-hover">
			<col width="100">
			<col width="100">
			<col width="100">

		<tr>
			<th>작성자</th>
			<td colspan="2"><input type="text" name="member_name" value="${logindto.member_name }" readonly="readonly"></td>
		<%-- 	<td colspan="2"><input type="text" name="member_name" value="${logindto.member_name }" readonly="readonly"></td> --%>
		</tr>	
		<tr>
			<th>답글수정</th>
			<td colspan="2"><textarea rows="20" cols="80" type="text" name="com_content"> ${cmt.com_content } </textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value ="취소(이전페이지이동)" onclick = "history.back()"/>
				<input type="button" value="취소(창닫기)" onClick="self.close()">
				
				<%-- <input type="button" value="취  소" onclick="location.href='freeboard_detail.do?free_postnum=${cmt.free_postnum }'"> --%>
			
				<input type="submit" value="저장" onClick="window.close()">
				<%-- <input type="submit" value="저장1(수정1일때만사용)" onclick="location.href='freeboard_detail.do?free_postnum=${cmt.free_postnum }'"> --%>
				<%-- <input type="submit" value="저장3(수정3만사용)" onClick="window.close(free_postnum=${cmt.free_postnum })"> --%>
			
				<input type="button" value="새로고침" onClick="window.location.reload()">
				
				
			
				
				
				
			</td>	
		</tr>
		
	</table>
	</form>
	
	

</body>
</html>