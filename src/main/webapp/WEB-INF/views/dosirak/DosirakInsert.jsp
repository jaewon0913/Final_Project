<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../header.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->
		<div>
			<form action="dosirak_insertres.do" method="post">
		<table class="table table-hover">
			
			<tr>
				<th>작성자</th>
				<td><input type="text" name="notice_writer"></td>				
			</tr>
			<tr>
				<th>제 목</th>
				<td><input type="text" name="notice_title"></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea rows="10" cols="60" name="notice_content"></textarea></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input class="btn" type="submit" value="작 성" >
					<input class="btn" type="button" value="취 소">
				</td>
			</tr>
		</table>
	</form>

		
		</div>
	
	
	<!-- ------------------------푸터-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------푸터-------------------------------------------- -->
	

</body>
</html>