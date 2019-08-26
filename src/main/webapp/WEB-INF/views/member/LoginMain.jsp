<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<!-- <link href="resources/bootstrap/css/login.css" rel="stylesheet"> -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/mainpage.js"></script>

<!-- kakao -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style type="text/css">

</style>

<body>

	
   <%@ include file="../header.jsp"%>
   
   <h1 class="title1">Login</h1>
   
   <c:url value="/login" var="loginUrl" />
   
   <div style="padding-bottom:10%; padding-top:10%;">
      <div class="row border">
      <form:form name="f" action="${loginUrl}" method="POST" class="center-block">
         <table style="align-content: center; border: none;" class="table" >
         <tr>
         <th>&nbsp;</th>
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
            <tr>
               <td colspan="2" align="center">
<!--                   <button type="submit" class="btn">로그인</button> -->
             <input class="btn" type="submit" value="로그인" /> 
                  <input class="btn"  type="button" value="회원가입" onclick="location.href='insertform.do'"/> 
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
        alert(JSON.stringify(authObj));
        //setCookie("kakao_login","done",1);//쿠키생성(로그인)
        alert("로그인 성공");
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v1/user/me',
          success: function(res) {//로그인되자마자 실행되는 구간
           alert("로그인 성공1111");
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
         <tr>
         	<th>&nbsp;</th>
         </tr>
         </table>
       </form:form>
      </div>
   </div>
         
   
   
   <div>
   <!-- ------------------------푸터-------------------------------------------- -->
   <%@ include file="../footer.jsp"%>
<!-- ------------------------푸터-------------------------------------------- -->
   </div>
<script src="${pageContext.request.contextPath }/resources/js/mainpage.js"></script>
</body>
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
</html>