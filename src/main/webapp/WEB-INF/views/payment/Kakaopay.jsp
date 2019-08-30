<%@page import="com.khfinal.mvc.member.dto.MemberDto"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
   language="java"%>
<!DOCTYPE html>
<html>
<head>
    <title>주문자 정보 조회</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>

<style type="text/css">
 	#qrcodeform{ 
 		display: none; 
 	} 
 	#pay{
 		width: 5rem;
 		height: 3rem;
 	}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>

<!--     <input type="button" id="pay" value="결제시스템입니다." >-->   


<div class="container">
<!-- 바코드 이미지 태그  outerHTML-->
	<div id="qrcodeform">
		<img id="qrcode" src='' />
	</div>
	
	<table class="table">
		<tr>
			<td colspan="2">[주문자 정보]</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" value="${memberdto.member_name }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" value="${memberdto.member_id }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text"  value="${memberdto.member_phone }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><input type="text" value="${dto.dosirak_title }" readonly="readonly"></td>
		</tr>
		<tr>
			<td colspan="2">[수령인 정보]</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="get_name" value="${memberdto.member_name }"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="get_phone" value="${memberdto.member_phone }"></td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="dosirak_title" value="${dto.dosirak_title }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>수령 장소</th>
			<td>
				<input type="text" name="get_subway" value="${memberdto.member_subway }" id="addr4" readonly="readonly">
				 <input type="button" value="지도 보기" 	onclick="showPopup();" class="btn btn-outline-light"/>
			</td>
		</tr>
		<tr>
			<th>도시락 가격</th>
			<td><input type="text" name="dosirak_price" value="${dto.dosirak_price} 원" readonly="readonly"></td>
		</tr>
		<tr>
			<th>배송비</th>
			<td><input type="text" value="1000 원" readonly="readonly"></td>
		</tr>
		<tr>
			<th>총 결제금액</th>
			<td><input type="text" name="price" value="${dto.dosirak_price+1000}" readonly="readonly"></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<img id="pay" alt="결제" src="resources/bootstrap/image/kakaopay_btn.png">
				<input type="button" value="취소" onclick="location.href='dosirak_selectone.do?dosirak_postnum=${dto.dosirak_postnum}'" class="btn btn-outline-light" />
			</td>
		</tr>
	</table>
	<script>
var IMP = window.IMP; 
IMP.init('imp15057713');
var ordernumber = "";
var date = "";

	$(document).ready(function(){
		//date가져오고 
		var d = new Date();
		date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
// 		alert(date);
		ordernumber = '${memberdto.member_id}'+date;
		var queryStr = "?member_id=${memberdto.member_id}&ordernumber="+ordernumber +"&choe=UTF-8";
		var googleQRUrl = "https://chart.googleapis.com/chart?chs=177x177&cht=qr&chl=";
// 		alert(encodeURIComponent(queryStr))
        $('#qrcode').attr('src', googleQRUrl +"http://192.168.110.39:8787/mvc/qrcode.do"+encodeURIComponent(queryStr));
//         chuan();
// 		alert(qr);
	});
	function chuan(){
		var qr = document.getElementById("qrcode").outerHTML;
		qr = qr.replace(/"/g,"&quot;");
// 		alert(qr);
		return qr;
	}
	
         
  $("#pay").click(function() {
      IMP.request_pay({
      pg : 'kakaopay', 
      pay_method : 'card',
      merchant_uid : 'merchant_' + new Date().getTime(),
      name : '${dto.dosirak_title}',
      amount : '${dto.dosirak_price+1000}',
      buyer_email : 'abc',
      buyer_name : '${memberdto.member_name}',
      buyer_tel : '${memberdto.member_phone}',
      buyer_addr : '${memberdto.member_address}',
      buyer_postcode : '123-456',
      m_redirect_url : 'https://www.yourdomain.com/payments/complete'
  }, function(rsp) {
      if ( rsp.success ) {
          var msg = '결제가 완료되었습니다.';
          msg += '고유ID : ' + rsp.imp_uid;
          msg += '상점 거래ID : ' + rsp.merchant_uid;
          msg += '결제 금액 : ' + rsp.paid_amount;
          msg += '카드 승인번호 : ' + rsp.apply_num;
          //주문번호
          
          //바코드 이미지 input타입에 넣고
          var qrcode = chuan();
          var get_name = document.getElementsByName("get_name")[0].value;
          var get_phone = document.getElementsByName("get_phone")[0].value;
          var get_subway = document.getElementsByName("get_subway")[0].value;
          var price = document.getElementsByName("price")[0].value;
          //컨트롤러보내고
          document.write('<form action="dosirakorderinsert.do" id="sub_form" method="post">'+
                        '<input type="hidden" name="member_id" value="${memberdto.member_id}">'+
                        '<input type="hidden" name="member_name" value="${memberdto.member_name}">'+
                        '<input type="hidden" name="member_level" value="${memberdto.member_level}">'+
                        '<input type="hidden" name="dosirak_title" value="${dto.dosirak_title}">'+
                        '<input type="hidden" name="dosirak_delivery" value="${dto.dosirak_delivery}">'+
                        '<input type="hidden" name="dosirak_price" value="${dto.dosirak_price}">'+
                        '<input type="hidden" name="get_name" value="'+get_name+'">'+
                        '<input type="hidden" name="get_phone" value="'+get_phone+'">'+
                        '<input type="hidden" name="get_subway" value="'+get_subway+'">'+
                        '<input type="hidden" name="tan" value="${dto.tan}">'+
                        '<input type="hidden" name="dan" value="${dto.dan}">'+
                        '<input type="hidden" name="gi" value="${dto.gi}">'+
                        '<input type="hidden" name="kcal" value="${dto.kcal}">'+
                        '<input type="hidden" name="price" value="'+price+'">'+
                        '<input type="hidden" name="ordernumber" value="'+ordernumber+'">'+
                        '<input type="hidden" name="qrcode" value="'+qrcode+'">'+
                        '</form>');
          document.getElementById("sub_form").submit();
          //컨트롤러에서 정보 다 디비에 저장하고 그걸다시 selectone(아이디,sysdate(현재날자)(주문내역)
      } else {
          var msg = '결제에 실패하였습니다.';
          msg += '에러내용 : ' + rsp.error_msg;
      }
//       alert(msg);
  });
         
         
 });

      
 function showPopup() {
		window.open("popup_map.do", "abc",
				"width=700, height=600, left=100, top=50");
	}

</script>
</div>
	
<%@ include file="../footer.jsp"%>
</body>
</html>