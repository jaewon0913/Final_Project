<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form:form method="post" enctype="multipart/form-data" modelAttribute="uploadFile" action="upload">
		<h3>업로드 할 파일 선택</h3>
		파일 : <input type="file" name="file" /><br/>
		<p style="color: red; font-weight: bold;">
			<form:errors path="file" />
		</p><br/>
		설명 : <br/>
		<textarea rows="10" cols="40" name="desc" ></textarea><br/>
		<input type="submit" value="전송">
	</form:form>

 </body>
</html>
   <!-- 
       spring form:  tag
       form:form, form:input, ...
       form:errors  Erros, BindingResult를 사용할때 command객체의 특정 field에서 발생하는 에러메시지 출력 가능하게 도와줍니다.
    
    
        form  tag의 enctype 속성
        1.application /www-form-urlencoded : (default)문자들이 encoding 됨
        2.multipart /form-data : file upload 가능. (post)
        3.text /plain : encoding 안됨
     
      -->

