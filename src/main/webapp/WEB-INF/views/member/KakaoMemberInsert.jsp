<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 주소API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 캡차 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>

<script src="${pageContext.request.contextPath }/resources/js/login.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#btn").click(function() {
// 		alert("captcha");
		var captcha = document.getElementsByName("btn")[0].title;
// 		alert(captcha);
	    $.ajax({
	        url: '/mvc/VerifyRecaptcha.do',
	        type: 'post',
	        data: {
	            recaptcha: $("#g-recaptcha-response").val()
	        },
	        success: function(data) {
	            switch (data) {
	                case 0:
	                    alert("자동 가입 방지 봇 통과");
	                    document.getElementsByName("btn")[0].title="y";
	                    break;
	
	                case 1:
	                    alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
	                    break;
	
	                default:
	                    alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
	                    break;
	            }
	        }
	    });
	});
});
//우편번호검색
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}

</script>
</head>
<body>
<!-- ------------------------------헤더----------------------------------- -->
<%@ include file="../header.jsp"%>
<!-- ------------------------------헤더----------------------------------- -->
	<h3 style="text-align: center;">kakao 회원가입</h3>
	
	<form id="formtag" action="kakaoinsert_res.do" method="post" class="container center-block container " style="padding-left: 10%;"
	 >
	 <div class="container col-sm-10">
	 	<input type="hidden" name="member_id" value="${id }" >
		<input type="hidden" name="member_pw" value="${id }" >
		<table class="table">
			
			
			<tr>
				<th>이   름</th>
				<td><input type="text" name="member_name" value="${name }"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="member_email" title="n" required="required">
					<input type="button" value="이메일 인증요청" onclick="emailSend()">
				</td>
			</tr>
			<tr>
				<th>이메일 인증번호 입력</th>
				<td>
					<input type="text" name="emailtext" required="required">
					<input type="button" value="인증번호 확인" onclick="emailChk()">
					<p id="emailresult"></p>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="member_phone"  required="required" placeholder="ex)01012345678">
				</td>
			</tr>
			<tr>
				<th>주   소</th>
<!-- 				<td><input type="text" name="member_address" required="required"></td> -->
				<td>
					<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
    				<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					 <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
				</td>
			</tr>
			<tr>
				<th>도시락 받을 역</th>
				<td><input type="text" name="member_subway" required="required"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				    <div class="g-recaptcha" data-sitekey="6Lcjlq8UAAAAAIl-9rG38Ko_2AHNrSzvUe4FA0V-"></div>
<!--     				<button id="btn" title="n">테스트 버튼</button> -->
    				<input type="button" value="로봇이 아닙니다." id="btn" name="btn" title="n">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="회원가입">
					<input type="button" value="취소" onclick="location.href='mainpage.do'">
				</td>
			</tr>
		</table>
		</div>
	</form>
   
<script type="text/javascript">
$("#formtag").submit(function() {
	var emailchk = document.getElementsByName("member_email")[0].title;
	var captcha = document.getElementsByName("btn")[0].title;
// 	alert("captcha title : "+captcha);
// 	alert(pw+" "+pw1);
// 	alert("tname"+tnamechk);
// 	alert("radio:"+radioVal);
	
		if(emailchk == "n"){
			alert("email check! 이메일 인증을 확인해주세요.");
			document.getElementsByName("member_email")[0].focus();
			return false;
		}else if(captcha == "n"){
			alert("자동 가입 방지 봇을 확인 한뒤 진행해 주세요.");
			return false;
		}else if(emailchk =="y" && captcha == "y"){
			return true;
		}

});   
</script>
</body>
</html>