<%@page import="com.khfinal.mvc.member.dto.MemberDto"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
   language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="utf-8">
<script type="text/javascript" src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function logout(user_id){
	contextPath = "${pageContext.request.contextPath}";
	alert(user_id+"님 로그아웃 되었습니다.");
	location.href=contextPath+"/logout";
}






</script>

<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>main</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/small-business.css" rel="stylesheet">


<script src="${pageContext.request.contextPath }/resources/js/mainpage.js"></script>
</head>


<body>
	<button onclick="location.href='test.do'">테스트</button>


   <header>
      <nav class="header navbar navbar-expand-lg navbar-dark fixed-top">
         <img alt="너도나도" src="${pageContext.request.contextPath }/resources/bootstrap/image/logo.png" onclick="location.href='mainpage.do'"
            style="width: 50px; height: 50px;">
         <div style="margin-left: 70%">
            
               	<c:choose>
               		<c:when test="${empty logindto}">
	               	  <div class="log" style="float: right;">
	                     <button class="loginbutton btn" onclick="location.href='loginMain.do'">로그인</button>
	                     <button class="insertbutton btn"
	                        onclick="location.href='insertform.do'">회원가입</button>
	                  </div>
               		</c:when>
               		<c:otherwise>
               			<div class="log">
		                     <div>안녕하세요. ${logindto.member_name }님</div>
		                     <button class="mypagebutton btn" onclick="location.href='mypage.do'">마이페이지</button>
		                     <button class="logoutbutton btn" onclick="logout('${logindto.member_id}')">로그아웃</button>
                     
                  		</div>
               		</c:otherwise>
               	</c:choose>
               	
          
                  
               
              
         </div>
      </nav>


      <!-- Navigation -->
      <nav class="navbar navbar-expand-lg navbar-dark main_img">
         <div class="container">
            <button class="navbar-toggler" type="button" data-toggle="collapse"
               data-target="#navbarResponsive" aria-controls="navbarResponsive"
               aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
               <ul class="navbar-nav ml-auto">
                  <li class="nav-item active"><a class="nav-link" href="#">도시락
                        주문 <span class="sr-only">(current)</span>
                  </a></li>
                  <li class="nav-item"><a class="nav-link" href="custom.do">커스텀 도시락
                        주문</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">주간 영양정보</a>
                  </li>
                  <li class="nav-item"><a class="nav-link" href="#">특가 도시락</a></li>
                  <li class="nav-item"><a class="nav-link" href="freeboard_list.do">자유 게시판</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">이벤트 게시판</a>
                  </li>
                  <li class="nav-item"><a class="nav-link" href="#">배달장소 확인</a>
                  </li>
               </ul>
            </div>
         </div>
      </nav>
   </header>
</body>
</html>