<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateForm</title>
</head>
<body>

	<!--header -->
	<%@ include file="../header.jsp"%>

	<h2>이벤트글 수정하기</h2>
	<form action="eventboard_update.do" method="post">
	
	<input type="hidden" name="event_postnum" value="${dto.event_postnum }" readonly="readonly">
	
	<input type="hidden" name="memeber_id" value="${dto.member_id }" readonly="readonly">
	
	<table class="table table-hover">
	<col width="100">
			<col width="100">
			<col width="100">
			<col width="100">
		<tr>
			<th> 날 짜 </th>
			<td colspan="2" readonly="readonly">${dto.event_regdate }</td>
		
		</tr>

		<tr>
			<th>작성자</th>
			<td colspan="2"><input type="text" name="member_name" value="${dto.member_name }" readonly="readonly"></td>
		</tr>	
		<tr>
			<th>제  목</th>
			<td colspan="2"><input type="text" name="event_title" value="${dto.event_title }" ></td>
		</tr>
		<tr>
			<th>내  용</th>
			<td colspan="2"><textarea rows="10" cols="60"  type="text" name="event_content">${dto.event_content }"</textarea></td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="button" value="취  소" onclick="location.href='eventboard_detail.do?event_postnum=${dto.event_postnum }'">
				<input type="submit" value="수  정" >
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