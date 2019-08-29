<%@page import="com.khfinal.mvc.member.dto.MemberDto"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<style type="text/css">
.mint{
background-color: #59CAB7 ! important;
}
.best3img {
   width: 25rem; 
   height : 25rem; 
}

.best3img:hover {
opacity: 0.8;
}


.number{
	display: block;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 2;
    width: 60px;
    height: 60px;
    padding-top: 9px;
    background: rgba(89,202,183,0.45);
    text-align: center;
    font-size: 20px;
    color: #fff;
    line-height: 100%;
}
.eventpage:hover{
opacity: 0.8;
}

.best3:hover{
opacity: 0.5;
}


</style>
<!-- 파비콘 -->

<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/bootstrap/image/favicon.ico" type="image/x-icon">

<!-- 파비콘 -->

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>main</title>

<!-- Bootstrap core CSS -->
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/bootstrap/css/small-business.css" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">



<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">	
// 	$(document).ready(function() {
// 		$("#slider").lightSlider({
// 			mode : 'slide',
// 			loop : true,
// 			auto : true,
// 			keyPress : true,
// 			pager : false,
// 			speed : 1500,
// 			pause : 3000
// 		});
// 	});
</script>

</head>
<%
	MemberDto logindto = (MemberDto)session.getAttribute("logindto");
%>
<body>
	<!-- header.jsp -->
	<%@ include file="header.jsp"%>
	
	<input type = "button" value = "테스트버튼" onclick = "location.href='testpage.do'">

<!-- -----------------슬라이드 이미지-------------------------------------------- -->

	<!-- Page Content -->
	<div class="container">

		<!-- Heading Row -->
		<div class="row align-items-center my-5">

			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- 페이지 -->

				<!--페이지-->

				<div class="carousel-inner">
					<!--슬라이드1-->
					<div class="item active">
						<img src="${pageContext.request.contextPath }/resources/bootstrap/image/ex1.jpg"
							style="width: 100%; float: none;" alt="First slide">
						<div class="container">
							<div class="carousel-caption">
							</div>
						</div>
					</div>
					<!--슬라이드1-->

					<!--슬라이드2-->
					<div class="item">
						<img src="${pageContext.request.contextPath }/resources/bootstrap/image/ex2.jpg" style="width: 100%"
							data-src="" alt="Second slide">
						<div class="container">
							<div class="carousel-caption">
							</div>
						</div>
					</div>
					<!--슬라이드2-->

					<!--슬라이드3-->
					<div class="item">
						<img src="${pageContext.request.contextPath }/resources/bootstrap/image/ex3.jpg" style="width: 100%"
							data-src="" alt="Third slide">
						<div class="container">
							<div class="carousel-caption">
							</div>
						</div>
					</div>
					<!--슬라이드3-->
				</div>

				<!--이전, 다음 버튼-->
				<a class="left carousel-control" href="#myCarousel" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
				</a> 
				<a class="right carousel-control" href="#myCarousel" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
			<!-- /.col-md-4 -->
		</div>
		<!-- /.row -->
<!-- -----------------슬라이드 이미지-------------------------------------------- -->
<!-- -----------------홈페이지 설명-------------------------------------------- -->

		<!-- Call to Action Well -->
		<div class="  my-5 py-4 m-0 ">
						<img alt="eventpage" src="resources/bootstrap/image/이벤트.png"  class="eventpage" style="width: 98%;" onclick="location.href='eventboard_list.do'">
		</div>
<!-- -----------------홈페이지 설명-------------------------------------------- -->
<!-- -----------------BEST3-------------------------------------------- -->
		<!-- Content Row -->
		<div class="row" style="margin-left:2rem;">
	
<div>
							<c:choose>
			<c:when test="${empty viewslist}">
				<h3>베스트메뉴 도시락이 없습니다.</h3>
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${viewslist}" var="viewsdto">
				
			<div class="col-lg-4 col-md-4 col-sm-2 col-xs-5">
               <div onclick="location.href='dosirak_selectone.do?dosirak_postnum=${viewsdto.dosirak_postnum}'">
               <div class="number">${viewsdto.bestnum }<p>Best</p></div>
               <img alt="test" src="${pageContext.request.contextPath }/resources/etc/multiupload/${viewsdto.mainimage}" class="best3img">
               <input type="hidden" name="dosirak_postnum" value="${viewsdto.dosirak_postnum}">
               </div>
               </div>
			
				</c:forEach>
			</c:otherwise>
		
		</c:choose>
			</div>				
			</div>
<!-- -----------------인스타 크롤링-------------------------------------------- -->

<div class="row">
<!-- -----------------공지사항 게시판-------------------------------------------- -->
			<div class="Notice">
				<a href="notice_list.do" class="btn">공지사항 게시판</a>
				<ul>
					<li>공지사항1</li>
					<li>공지사항2</li>
					<li>공지사항3</li>
				</ul>
			</div>

<!-- -----------------공지사항 게시판-------------------------------------------- -->
<!-- -----------------이벤트 게시판-------------------------------------------- -->
			<div class="Notice">
				<a href="testa.do" class="btn">자유 게시판</a>
				<ul>
					<li>자유</li>
					<li>자유</li>
					<li>자유</li>
				</ul>
			</div>
			
<!-- -----------------이벤트 게시판-------------------------------------------- -->

</div>
<!-- ------------------------동영상-------------------------------------------- -->

			<div class="embed-responsive embed-responsive-4by3" style="margin-bottom: 5%;">
				<video controls autoplay loop class="embed-responsive-item">
					<source src="resources/video/example.mp4" type="video/mp4">
				</video>
			</div>

<!-- ------------------------동영상-------------------------------------------- -->
			<!-- /.col-md-4 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->


	<%@ include file="footer.jsp"%>	
</body>

<!-- <script type="text/javascript">
	var EndEvent = new Date('March 14, 14:29:00');
	End_hours = EndEvent.getHours();
	End_minutes = EndEvent.getMinutes();
	End_seconds = EndEvent.getSeconds();

	//강연시 시간을 변경할것
	var StartEvent = new Date('March 14, 09:56:55');
	Start_hours = StartEvent.getHours();
	Start_minutes = StartEvent.getMinutes();
	Start_seconds = StartEvent.getSeconds();

	if (window.location.href != 'http://localhost:8787/mvc/eventboard_list.do') {
		var EVT = setInterval("Event_Time()", 1000);
	}

	function Event_Time() {
		var now = new Date();
		hours = now.getHours();
		minutes = now.getMinutes();
		seconds = now.getSeconds();

		if (End_hours > Start_hours) {
			if (End_hours < hours) {
				clearInterval(EVT);
			}

			else if (End_hours == hours) {
				if (End_minutes < minutes) {
					clearInterval(EVT);
				} else if (End_minutes == minutes) {
					if (End_seconds < seconds) {
						clearInterval(EVT);
					} else if (End_seconds >= seconds) {
						calculate();
					}
				} else if (End_minutes > minutes) {
					calculate();
				}
			}

			else if (End_hours > hours && hours > Start_hours) {
				calculate();
			}

			else if (Start_hours == hours) {
				if (Start_minutes < minutes) {
					calculate();
				} else if (Start_minutes == minutes) {
					if (Start_seconds <= seconds) {
						calculate();
					} else if (Start_seconds > seconds) {

					}
				} else if (Start_minutes > minutes) {

				}
			}

			else if (Start_hours > hours) {

			}
		}

		else if (End_hours == Start_hours) {
			if (End_hours < hours) {
				clearInterval(EVT);
			} else if (End_hours == hours && Start_hours == hours) {
				if (End_minutes < minutes) {
					clearInterval(EVT);
				} else if (End_minutes > minutes && Start_minutes < minutes) {
					calculate();
				} else if (End_minutes == minutes && Start_minutes == minutes) {
					if (End_seconds > seconds && Start_seconds < seconds) {
						calculate();
					} else if (End_seconds < seconds) {
						clearInterval(EVT);
					} else if (Start_seconds > seconds) {

					}
				} else if (End_minutes == minutes) {
					if (End_seconds >= seconds) {
						calculate();
					}
				} else if (Start_minutes == minutes) {
					if (Start_seconds <= seconds) {
						calculate();
					}
				} else if (Start_minutes > minutes) {

				}

			} else if (Start_hours > hours) {

			}
		}
	}

	function calculate() {
		setTimeout(function() {
			notify();
		}, 5000);
		clearInterval(EVT);
	}

	function notify() {
		if (Notification.permission !== 'granted') {
			alert('notification is disabled');
		} else {
			var notification = new Notification('Event', {
				icon : 'resources/bootstrap/image/Event.jpg',
				body : '이벤트의 내용을 적어 주세요\n클릭시 이벤트 페이지로 이동',
			});

			notification.onclick = function() {
				location.href = 'eventboard_list.do';
				notification.close();
			};
		}
	}
</script> -->

</html>