<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style type="text/css">
.banner:hover{
opacity: 0.5;
}
.logo2{
width: 20em;
height: 10em;
margin-left: 10%;
}
</style>
</head>


<!-- <link href="resources/bootstrap/css/login.css" rel="stylesheet"> -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/mainpage.js"></script>

<!-- kakao -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style type="text/css">

</style>

<body >

   <%@ include file="../header.jsp"%>
   
   <div class="container">
   
   <c:url value="/login" var="loginUrl" />
   <div class="container center banner" style="text-align: center;">
   <img alt="banner" src="resources/bootstrap/image/회원가입 할인.png" onclick="location.href='TermsAndConditions.do'" style=" width: 100%;">
   </div>
   <div style="padding-bottom:5rem;">
  
      <div class="row">
      <form:form name="f" action="${loginUrl}" method="POST" class="center-block">
         <table style="align-content: center; margin-bottom: 5rem; margin-top: 5rem;" class="table" >
        <tr>
        	<th colspan="2" align="center"><img alt="logo2" src="resources/bootstrap/image/logo_2.png" class="logo2"></th>
        </tr>
        
         <tr>
         	<td colspan="2" align="center">LOGIN</td>
         </tr>
            <tr>
               <th> ID &nbsp; : &nbsp;</th>
               <td><input class="form" type="text" name="id" id="id"
                  placeholder="아이디를 입력해주세요" /></td>
<!--                <td><input class="form" type="text" name="id" id="loginid" -->
<!--                placeholder="아이디를 입력해주세요" /></td> -->
            </tr>
            <tr>
               <th> PW &nbsp; : &nbsp;</th>
               <td><input class="form" type="password" name="password" id="password"
                  placeholder="비밀번호를 입력해주세요" /></td>
            </tr>
            <c:if test="${param.error != null}">
                  <p style="color:red;">아이디와 비밀번호가 잘못되었습니다.</p>
            </c:if>
            <tr>
               <td colspan="2" align="center">
<!--                   <button type="submit" class="btn">로그인</button> -->
             <input class="btn" type="submit" value="로그인" onclick="login()" /> 
                  <input class="btn"  type="button" value="회원가입" onclick="location.href='TermsAndConditions.do'"/> 
                  <input class="btn" type="button" value="취소" onclick="location.href='mainpage.do'" />
                   <input class="btn" type="button" value="아이디 비밀번호 찾기" onclick="location.href='accountfind.do'"/>
               </td>
            </tr>
            <tr>
            <td colspan="2" align="center">
   <a id="kakao-login-btn"></a>
   <script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('417b6197d543e8ff274fa9c9db0ca421');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        //setCookie("kakao_login","done",1);//쿠키생성(로그인)
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v1/user/me',
          success: function(res) {//로그인되자마자 실행되는 구간
            console.log(JSON.stringify(res.kaccount_email));
            console.log(JSON.stringify(res.id));
            console.log(JSON.stringify(res.properties.profile_image));
            console.log(JSON.stringify(res.properties.nickname));
            var kakaoid = JSON.stringify(res.id);
            var kname = JSON.stringify(res.properties.nickname);
            var kaname = kname.replace("\"","");
            var kakaoname = kaname.replace("\"","");
            test=kakaoname;
            //아이디 중복체크 ajax
            //있으면 가상폼태그로 시큐리티로그인
            //없으면 insert보내고
            document.write('<form action="kakaologin.do" id="sub_form" method="post">'+
                        '<input type="hidden" name="id" value="'+kakaoid+'">'+
                        '<input type="hidden" name="name" value="'+kakaoname+'">'+
                        '</form>');
            document.getElementById("sub_form").submit();
            //location.href="admin.do?command=kakaoregistform&id="+kakaoid+"&name="+kakaoname;
          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
</script>
            </td>
         </tr>
         </table>
       </form:form>
      </div>
   </div>
         
   
   
   <div>
   </div>
      </div>


<script src="${pageContext.request.contextPath }/resources/js/mainpage.js"></script>

<script type="text/javascript">
// $("#formtag").submit(function(){
// 	var id = document.getElementById("id").value;
// 	var password = document.getElementById("password").value;
// 	alert(id);
// 	alert(password);
// 	document.write('<form action="login.do" id="sub_form" method="post">'+
//             '<input type="hidden" name="id" value="'+id+'">'+
//             '<input type="hidden" name="password" value="'+password+'">'+
//             '</form>');
// 	document.getElementById("sub_form").submit();
// });

</script>
   <!-- ------------------------푸터-------------------------------------------- -->
   <%@ include file="../footer.jsp"%>
<!-- ------------------------푸터-------------------------------------------- -->
</body>
</html>