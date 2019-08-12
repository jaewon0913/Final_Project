<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0" maximum-scale=1.0, user-scalable=no;/>

<title>커스텀 도시락 주문</title>
<style>
.customImg {
	width: 170px;
	height: 220px;
	margin: 10px;
	padding: 10px;
	border: none;
	float: left;
	display: inline-block;
	border-radius: 50%;
}

.customContent {
	width: 170px;
	height: 220px;
	border-radius: 50%;
}

.customDrop {
	width: 210px;
	height: 260px;
	margin: 10px;
	padding: 10px;
	border: solid 5px #59cab7;
	float: left;
	display: inline-block;
	border-radius: 50%;
}
.copydish{
	width: 170px;
	height: 220px;
	border-radius: 50%;
}

.mint {
	background-color: #59cab7;
	opacity: 0.8;
}

.line {
	border-left: 2;
	border-left-color: white;
}

#pay:hover {
	opacity: 0.5;
}

.iconbtn {
	width: 5rem;
}

.iconbtn:hover {
	width: 5rem;
	opacity: 0.5;
}

.fix {
	position: fixed;
	border: none;
	background-color: white;
	border: 1 solid black;
	width: 20%;
	font-size: 1rem;
}

.mintbtn {
	background-color: #59cab7;
	color: white;
	width: 8rem;
	border: none;
	outline: 0;
	height: 3rem;
	font-size: 1.5rem;
}

.mintbtn:hover {
	background-color: #59cab7;
	color: white;
	width: 8rem;
	border: none;
	outline: 0;
	opacity: 0.5;
	height: 3rem;
	font-size: 1.5rem;
}

.payback {
	position: fixed;
	right: 0px;
	margin-bottom: 30rem;
	height: 30rem;
	width: 20rem;
	background-color: white;
}

.font {
	font-size: 1.5rem;
}
.f{
font-size:2rem;
}



.1{
	border: 5 solid black;
	width: 50rem;
	border-radius: 30px;
}
.sik1{
	border: 5 solid black;
	border-radius: 50%;
}
</style>
<!-- kakaopay -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
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
<!-- -----------kakaopay-------------- -->
<!-- Bootstrap core CSS -->
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/bootstrap/css/small-business.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>



<script src="${pageContext.request.contextPath }/resources/js/custom.js"></script>

  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script type="text/javascript">
  $(function(){
	  $('#sendDiv').show()
	  $('#sendDiv2').hide()
	
	  $(document).on('click', '#one', function(){
		  $('#sendDiv').show()
		  $('#sendDiv2').hide()
	  }).on('click', '#month', function(){
		  $('#sendDiv2').show()
		  $('#sendDiv').hide() 
	  })
	  
	  
  })
  
  
 /*  function oneshow() {
	  if ( $("#sendDiv").css("display") == "none" ){
		  $("#sendDiv").show(); 
		  
	  }
	  else $("#sendDiv").hide(); 
	  };
	  
	  function month() {
		  if ( $("#sendDiv2").css("display") == "none" ) $("#sendDiv2").show(); 

		  else $("#sendDiv2").hide(); 
		  };


   */
  </script>


</head>



<body>

	<!-- header.jsp -->
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
	<!-- 커스텀 페이지 -->
	<div class="container">
	 	<h1>도시락 커스텀</h1>
 	</div>
	<hr/>

	<div class="payback">
		<ul class="nav nav-tabs">
			<li class="mint line font" style="width: 50%"><input class="btn " type="button" id="one" value="1회 구매" style="width: 10rem"/></li>
			<li class="mint line" style="width: 50%"><input class="btn " type="button" id="month"  value="정기 구매" style="width: 10rem"/></li>
		</ul>


		<div class="container" id="sendDiv">
		<br/>
		<p class="font">1회구매</p>
		<br/>
		<p class="font">가격 : @@@@@@원</p>
		<br/>
		<p class="font">총 칼로리 : @@@@@@kal</p>
		<br/>
		<input type="button" value="장바구니" onclick="location.href='#'" class="mintbtn " />
		<img id="pay" alt="결제" src="resources/bootstrap/image/kakaopay_btn.png" style="width: 8rem;">
		</div>
		
		
		<div class="container" id="sendDiv2">
		<br/>
		<p class="font">정기구매</p>
		<br/>
		<p class="font">가격 : @@@@@@원</p>
		<br/>
		<p class="font">총 칼로리 : @@@@@@kal</p>
		<br/>
		<input type="button" value="장바구니" onclick="location.href='#'" class="mintbtn " />
		<img id="pay" alt="결제" src="resources/bootstrap/image/kakaopay_btn.png" style="width: 8rem;">
		</div>



	</div>

	<div align="center">
			<h5>1. 식판을 선택해 주세요</h5>
			<input type="image"
				src="${pageContext.request.contextPath }/resources/etc/image/box5.png"
				style="width: 150px; height: 150px;" onclick="sikpanChange(4)" /> <input
				type="image"
				src="${pageContext.request.contextPath }/resources/etc/image/box6.png"
				style="width: 150px; height: 150px;" onclick="sikpanChange(5)" /> <input
				type="image"
				src="${pageContext.request.contextPath }/resources/etc/image/box7.png"
				style="width: 150px; height: 150px;" onclick="sikpanChange(6)" />
		</div>

		<hr style="clear: both" />
		
		
		
		<!-- 반찬 드래그 하는 곳 -->
		<div align="center">
			<h5>2. 반찬을 드래그 해주세요(더블클릭 시 식판에서 삭제됩니다.)</h5>
			<div style="display: inline-block">
				<c:choose>
					<c:when test="${count eq 4 or count eq 5 or count eq 6}">
						<c:forEach var='i' begin='0' end='${count }'>
							<div class='customDrop test ' ondrop="drop_handler(event);"
								ondragover="dragover_handler(event)"></div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h1>식판을 먼저 눌러주세요</h1>
					</c:otherwise>
				</c:choose>
			</div>
			
			<!--
		<c:choose>
		
			<c:when test="${count eq 3}">
			<div style = "display : inline-block">
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
			</div>
			</c:when>
			<c:when test="${count eq 4 }">
			<div style = "display : inline-block">
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
			</div>
			</c:when>
			<c:when test="${count eq 5 }">
			<div style = "display : inline-block">
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>
				<div class='customDrop test' ondrop = "drop_handler(event);" ondragover = "dragover_handler(event)"></div>	
			</div>	
			</c:when>
<%-- 			<c:otherwise>
				<h1>식판을 먼저 눌러주세요</h1>
			</c:otherwise> --%>
		</c:choose>
		 -->
		</div>
		<hr style="clear: both" />
		<div class="container" style="text-align: center;">
			<img alt="밥" src="resources/bootstrap/image/rice.png" class="iconbtn" />
			&emsp;
			<img alt="고기" src="resources/bootstrap/image/gogi.png" class="iconbtn" />
			&emsp;
			<img alt="생선" src="resources/bootstrap/image/fish.png" class="iconbtn" />
			&emsp;
			<img alt="샐러드" src="resources/bootstrap/image/sal.png" class="iconbtn" />
			&emsp;
			<img alt="반찬" src="resources/bootstrap/image/side.png" class="iconbtn" />
			&emsp;
			<img alt="김치" src="resources/bootstrap/image/kim.png" class="iconbtn" />
		</div>

		<!-- 반찬  -->
		<div class="container">
			<p class="f">반찬선택</p>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish1" id="sideDish1" class="customContent "
						src="${pageContext.request.contextPath }/resources/etc/image/img01.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish2" id="sideDish2" class="customContent"
						src="${pageContext.request.contextPath }/resources/etc/image/img02.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish3" id="sideDish3" class="customContent"
						src="${pageContext.request.contextPath }/resources/etc/image/img03.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish4" id="sideDish4" class="customContent"
						src="${pageContext.request.contextPath }/resources/etc/image/img04.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish5" id="sideDish5" class="customContent"
						src="${pageContext.request.contextPath }/resources/etc/image/img05.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish6" id="sideDish6" class="customContent"
						src="${pageContext.request.contextPath }/resources/etc/image/img06.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish7" id="sideDish7" class="customContent"
						src="${pageContext.request.contextPath }/resources/etc/image/img07.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish8" id="sideDish8" class="customContent"
						src="${pageContext.request.contextPath }/resources/etc/image/img08.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish9" id="sideDish9" class="customContent"
						src="${pageContext.request.contextPath }/resources/etc/image/img09.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish10" id="sideDish10" class="customContent"
						src="${pageContext.request.contextPath }/resources/etc/image/img10.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish11" id="sideDish11" class="customContent"
						src="${pageContext.request.contextPath }/resources/etc/image/img11.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish12" id="sideDish12" class="customContent"
						src="${pageContext.request.contextPath }/resources/etc/image/img12.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish13" id="sideDish13" class="customContent"
						src="${pageContext.request.contextPath }/resources/etc/image/img13.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish14" id="sideDish14" class="customContent"
						src="${pageContext.request.contextPath }/resources/etc/image/img14.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish15" id="sideDish15" class="customContent"
						src="${pageContext.request.contextPath }/resources/etc/image/img15.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block">
				<div class="customImg">
					<img name="dish16" id="sideDish16" class="customContent"
						src="${pageContext.request.contextPath }/resources/etc/image/img16.jpeg"
						draggable="true" ondragstart="dragstart_handler(event);">
				</div>
			</div>
			<div style="display: inline-block"></div>
			<br style="clear: both" />
			<div align="right">
				<input type="button" onclick="order(${count })" value="주문" class="mintbtn order" />
			</div>
		</div>
	

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
            if ( rsp.success ) {
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
<div class="container">
<br/>
<br/>
<br/>
<br/>
		
</div>

<!-- -----------------------------식판5----------------------------------- -->
		<div class="container" style="border: 5px solid black; border-radius: 30px; width: 70rem; height: 45rem;">
			<div class=" col-sm-3 " style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 5%;"></div>
			<div class=" col-sm-3" style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 5%;"></div>
			<div class=" col-sm-3" style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 5%;"></div>
			<div class="col-sm-2"></div>
			<div class=" col-sm-5" style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 5%;"></div>
			<div class=" col-sm-5" style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 5%;"></div>
		</div>
<!-- ------------------------------식판5----------------------------------- -->		
<!-- ------------------------------식판6----------------------------------- -->	
	<div class="container" style="border: 5px solid black; border-radius: 30px; width: 70rem; height: 45rem;">
			<div class=" col-sm-3 " style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 5%;"></div>
			<div class=" col-sm-3" style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 5%;"></div>
			<div class=" col-sm-3" style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 5%;"></div>
			<div class=" col-sm-3 " style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 5%;"></div>
			<div class=" col-sm-3" style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 5%;"></div>
			<div class=" col-sm-3" style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 5%;"></div>
						
	</div>

<!-- ------------------------------식판6---------------------------------- -->		
<!-- ------------------------------식판7----------------------------------- -->	
		<div class="container" style="border: 5px solid black; border-radius: 30px; width: 78rem; height: 45rem;">
			<div class=" col-sm-3" style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 2%;"></div>
			<div class=" col-sm-3" style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 2%;"></div>
			<div class=" col-sm-3" style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 2%;"></div>
			<div class=" col-sm-3" style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 2%;"></div>
			<div class=" col-sm-3" style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 6%;"></div>
			<div class=" col-sm-3" style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 6%;"></div>
			<div class=" col-sm-3" style="border: 5px solid black; border-radius: 50%; width: 15rem; height: 15rem; margin: 6%;"></div>
						
		</div>

<!-- ------------------------------식판7----------------------------------- -->		
		<div class="container">
<br/>
<br/>
<br/>
<br/>
		
</div>
<!-- ------------------------푸터-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------푸터-------------------------------------------- -->
</body>
</html>