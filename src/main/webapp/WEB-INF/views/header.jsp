<%@ page import="com.khfinal.mvc.member.dto.MemberDto"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="chat/ChatPage.jsp" %>


<!DOCTYPE html>
<html lang="utf-8">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>main</title>
<style type="text/css">

body, input, div, span, p, a, nav, li, ul, button {
	font-family:'샘물';
}

a.nav-link{
	color: white;
}

a.nav-link:hover{
	color: white;
	opacity: 0.5;
}
#txt_search{
	
}



</style>


<!-- Bootstrap core CSS -->
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/bootstrap/css/small-business.css" rel="stylesheet">
<link href="resources/bootstrap/css/header.css" rel="stylesheet">

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />

<script src="resources/js/mainpage.js"></script>

<!-- jaewon -->
<!-- jQuery, bootstrap CDN -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script> <!-- msie 문제 해결 -->
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<!-- socket -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/sockjs.min.js"></script>
</head>

<body>
	<header>
		<nav class="header navbar navbar-expand-lg fixed-top " style="margin-bottom: 0px;">
		<div class="col-md-3">
			<img alt="너도나도" src="${pageContext.request.contextPath }/resources/bootstrap/image/logo.png" onclick="location.href='mainpage.do'" style="width: 30rem; height: 10rem;">
			</div>
			<!-- search bar -->
		<div class="col-md-4 center " style="text-align: center;">
			<table class="pull-right search">
				<tr>
					<td>
						<div class="form-group form-inline search">
							<input type="text" id="txt_search" value="${txt_search }"
								style="border-radius: 5px;width: 30rem;">
								<span>
								<img alt="search" src="${pageContext.request.contextPath }/resources/bootstrap/image/searchbar.png" 
								onclick="javascript:PageMove(${paging.pageNo})" style="width: 3rem; height: 3rem;" class="searchbar">
								</span>
						
						</div>
					</td>
				</tr>
			</table>
		</div>
		<!-- search bar -->
			<div  class="pull-right col-md-4"  style="text-align: right;">
				<c:choose>
					<c:when test="${empty logindto}">
							<span class="loginbutton btn btn-outline-light" onclick="location.href='loginMain.do'">로그인</span>
							<span class="insertbutton btn btn-outline-light" onclick="location.href='TermsAndConditions.do'">회원가입</span>
					</c:when>
					<c:otherwise>
							<span>안녕하세요. ${logindto.member_name }님</span>
							<span class="mypagebutton btn btn-outline-light" onclick="location.href='mypage.do'">마이페이지</span>
							<span class="logoutbutton btn btn-outline-light" onclick="logout('${logindto.member_id}')">로그아웃</span>
						
						
					</c:otherwise>
				</c:choose>
			</div>
		</nav>

		<!-- Navigation -->
		<nav class="navbar navbar-expand-lg nav-bar-custom main_img ">
			<div class="container">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item ">
						<a class="nav-link" href="dosirak_listpaging.do">도시락 주문 <span class="sr-only">(current)</span>
						</a></li>
						<!-- 둘중 선택 <li class="nav-item active"><a class="nav-link" href="dosiraktest.do">도시락
							주문 <span class="sr-only">(current)</span>
					 	</a></li> -->
						<li class="nav-item "><a class="nav-link" href="custom.do">커스텀 도시락
								주문</a></li>
						<li class="nav-item"><a class="nav-link" href="nutritiongraph.do">주간 영양정보</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">특가 도시락</a></li>
						<li class="nav-item"><a class="nav-link" href="freeboard_list.do">자유 게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="eventboard_list.do">이벤트 게시판</a>
						</li>
						<li class="nav-item "><a class="nav-link" href="notice_list.do">공지사항 게시판</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		
	<script type="text/javascript">
			var EndEvent = new Date('March 14, 15:15:30');
			End_hours = EndEvent.getHours();
			End_minutes = EndEvent.getMinutes();
			End_seconds = EndEvent.getSeconds();

			var StartEvent = new Date('March 14, 14:39:50');
			Start_hours = StartEvent.getHours();
			Start_minutes = StartEvent.getMinutes();
			Start_seconds = StartEvent.getSeconds();

			
			var EVT = setInterval("Event_Time()", 1000);

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
						} else if (End_minutes > minutes
								&& Start_minutes < minutes) {
							calculate();
						} else if (End_minutes == minutes
								&& Start_minutes == minutes) {
							if (End_seconds > seconds
									&& Start_seconds < seconds) {
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
				}, 500);
				clearInterval(EVT);
			}

		/* 	function notify() {
				if (Notification.permission !== 'granted') {
					alert('notification is disabled');
				} else {
					var notification = new Notification('Event', {
						icon : 'resources/bootstrap/image/Event.jpg',
						body : '이벤트의 내용을 적어 주세요',
					});

					notification.onclick = function() {
						//location.href = 'mainpage.do';
						notification.close();
					}
				}
			} */
			
			function PageMove(page) {
	               location.href = "dosirak_listpaging.do?page=" + page + "&txt_search=" + $('input#txt_search').val();
	            }
		</script>
	</header>
</body>
</html>