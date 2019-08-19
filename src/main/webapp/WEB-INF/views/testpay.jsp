<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>연습?</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
#pay:hover {
	opacity: 0.5;
}
</style>
</head>
<body>

	<img id="pay" alt="결제" src="resources/bootstrap/image/kakaopay_btn.png"
		style="width: 100px;">


	<script>
		var IMP = window.IMP;
		IMP.init('imp15057713');
		$("#pay").click(function() {
			IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '물품 명',
				amount : 1,
				buyer_email : '이메일',
				buyer_name : '이름',
				buyer_tel : '전화번호',
				buyer_addr : '주소',
				buyer_postcode : '123-456',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
	</script>
	
	
	<!-- -----------카운트다운------------ -->
<p id="demo"></p>

<script>
// Set the date we're counting down to
var countDownDate = new Date("Sep 1, 2019 15:37:25").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

  // Get today's date and time
  var now = new Date().getTime();

  // Find the distance between now and the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Display the result in the element with id="demo"
  document.getElementById("demo").innerHTML = days + "일 " + hours + "시간 "
  + minutes + "분 " + seconds + "초 ";

  // If the count down is finished, write some text 
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "EXPIRED";
  }
}, 1000);
</script>
	
	
</body>
</html>