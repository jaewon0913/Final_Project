<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
<%@ include file="../header.jsp"%>
	
	<!-- 4. uploadForm에서 동작 -->
	<!--	 Spring이 제공해주는 form 프레임워크 
			enctype : 인코딩 타입(파일 업로드를 위한 속성) / modelAttribute : UploadFile.java 매핑 -->
	<!-- multipart/form-data : 브라우저에서 서버로 HTML Form의 내용을 전송 시 사용 -->
<div class="container">
<h1>커스텀 도시락 반찬 등록 페이지</h1>
	<form:form id = "fileForm" method="post" enctype="multipart/form-data" modelAttribute="uploadFile" action="upload.do">
		<table class="table">
			<tr>
				<th>반찬 이름:</th>
				<td>
					<input type = "text" name = "dish_name">
				</td>
			</tr>
			<tr>
				<th>탄수화물:</th>
				<td>
					<input type = "text" name = "dish_tan">
				</td>
			</tr>
			<tr>
				<th>단백질:</th>
				<td>
					<input type = "text" name = "dish_dan">
				</td>
			</tr>
			<tr>
				<th>지방:</th>
				<td>
					<input type = "text" name = "dish_zi">
				</td>
			</tr>
			<tr>
				<th>일회섭취량:</th>
				<td>
					<input type = "text" name = "dish_amount">
				</td>
			</tr>
			<tr>
				<th>칼로리:</th>
				<td>
					<input type = "text" name = "dish_cal">
				</td>
			</tr>
			<tr>
				<th>종류:</th>
				<td>
					<input type = "text" name = "dish_kind">
				</td>
			</tr>
		</table>
		<h3>업로드 할 파일 선택(단일)</h3>
		파일 : <!-- <input multiple="multiple" type="file" name="file" id="file"/><br/> -->
		<input type="file" name="file" id = "dish_file" /><br/>
		
		<!-- 5-1. Error 발생시(파일 선택 없이 전송 누를 경우) 7-4 이후 출력 -->
		<p style="color: red; font-weight: bold;">
			<!-- 5-2. path = "file" <==> FileValidator.class 에서 error.rejectValue("file"<- 요 이름, ...) -->
			<form:errors path="file" />
		</p>
		
		<!-- 5. 전송 누를 시 form (upload)동작 -->
		<input type="submit" value="전송" class="btn btn-outline-light pull-right">
	</form:form>
	<!-- 
		spring form :  tag
		form:form, form:input, ...
		form:erros -> Erros, BindingResult를 사용할 때 command 객체의 특정 field에서 발생하는 에러메시지 출력 기능
	 -->
	 
	 <!-- 
	 	form tag의 enctype 속성
	 	1.	application/www-form-urlencoded : (default) 문자들이 encoding 됨
	 	2.	multipart/form-data : file upload 가능.(post)
	 	3.	text/plain : 인코딩 안되고 그냥 넘긴다
	  -->

</div>

<%@ include file="../footer.jsp"%>
</body>
</html>