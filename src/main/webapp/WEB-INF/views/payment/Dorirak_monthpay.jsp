<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도시락 정기결제</title>
</head>
<body>
<%@ include file="../header.jsp"%>

<div class="container" >
<div class="dosirakimg" >
<img alt="test도시락" src="resources/bootstrap/image/do1.jpg" class="doim">
</div>

<p>월 <input type="checkbox" value="2" name="mo" /></p>
<p>화 <input type="checkbox" value="3" name="tu" /></p>
<p>수 <input type="checkbox" value="4" name="we" /></p>
<p>목 <input type="checkbox" value="5" name="th" /></p>
<p>금 <input type="checkbox" value="6" name="fr" /></p>
<p>토 <input type="checkbox" value="7" name="sa" /></p>
<p>일 <input type="checkbox" value="1" name="su" /></p>



</div>


<%@ include file="../footer.jsp"%>
</body>
</html>