<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/bootstrap/css/small-business.css" rel="stylesheet">
<link href="resources/bootstrap/css/header.css" rel="stylesheet">

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />

<!-- jQuery, bootstrap CDN -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script type="text/javascript">
	
	onload=function(){
		var id = opener.document.getElementsByName("member_id")[0].value;//registform에서 내가입력한 id 부모창에서가져옴
		document.getElementsByName("chkid")[0].value=id;
	}
	
	function idConfirm(bool){
		if(bool == "true"){
			opener.document.getElementsByName("member_id")[0].title="y";//title로 걸어놓은 함수때문에 y로바꿈
			opener.document.getElementsByName("member_pw")[0].focus();//중복x -> 패스워드포커스
		}else{
			opener.document.getElementsByName("member_id")[0].value="";
			opener.document.getElementsByName("member_id")[0].focus();//이미 아이디있음 ->아이디포커스
		}
		self.close();
	}
</script>
</head>

<body>
<%
	String idnotused=request.getAttribute("idnotused")+"";
	System.out.println(idnotused);
%>


	<table style="width: 130px;height: 100px; margin-top: 50px;">
		<tr>
			<td style = "font-size : 20pt">ID:&nbsp;&nbsp;</td>
			<td><input type="text" name="chkid" style="background-color: snow;border: none; font-size : 20pt; width : 130px"></td>
		</tr>
		<tr>
			<td style = "border-bottom : solid 1px; border-top : solid 1px; margin-top: 10px" colspan="2"><%=idnotused.equals("true")?"아이디 생성 가능":"중복된 아이디 존재" %></td>
		</tr>
		<tr >
			<td colspan="2"><input type="button" class = "btn btn-outline-light" value="확인" onclick="idConfirm('<%=idnotused%>')" style="margin-top: 10px; margin-left:68px;"></td>
									<!-- ' ' 이걸빼면 함수안에 변수형태로 들어간다. idConfirm(true) 이런식으로 변수로들어감-->
		</tr>
	</table>
</body>
</html>