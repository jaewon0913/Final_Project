<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height: 100%;">
<head>
<meta charset="UTF-8">
<title>Delivery Place</title>
<style type="text/css">
/* body {
	margin-top: 0px;
	margin-left: 0px;
	margin-bottom: 0px;
	height: 99%;
	font-size: 1.0rem;
} */

#map {
	width: 100%;
	height: 100%;
	position: relative;
	overflow: hidden;
	border: 3px solid;
	margin-bottom: 2rem;
}

/* #buttons {
	position: absolute;
	top: 3px;
	left: 3px;
	z-index: 1;
} */

#content {
	width: 110%;
}

.mmap{
height: 80rem;
margin-bottom: 5rem;

}

</style>
</head>
<body>
	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../header.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->
	<div class="mmap">
	<div id="buttons">
		<input type="button" value="지도 초기화" onclick="mapReset()" id="abutton" class="btn btn-outline-light" /> 
		<input type="button" value="메인 페이지로" onclick="location.href='mainpage.do'" id="bbutton" class="btn btn-outline-light" />
	</div>
	
	

	<div id="map"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51191c741f7e20835fa12c73414cc9e6&libraries=services"></script>
	<script>
		//페이지 접속시실행
		window.onload = function() {
			if (window.Notification) {
				Notification.requestPermission();
			}
			notify01();
		}

		function notify01() {
			if (Notification.permission !== 'granted') {
				alert('notification is disabled');
			} else {
				var notification = new Notification('배달장소 확인', {
					icon : 'resources/bootstrap/image/map1.jpg',
					body : '배달 장소는 6곳입니다.\n마커 클릭 시 지도가 확대됩니다.',
				});
				
				notification.onclick = function() {
					notification.close();
				};

			}

		}

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.411405, 126.897654), // 지도의 중심좌표 37.566826, 126.9786567
			level : 10
		// 지도의 확대 레벨

		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		map.setZoomable(false); // 지도의 마우스 휠, 모바일 터치를 이용한 확대, 축소 기능을 막는다.
		map.setMaxLevel(10); //지도의 최고 레벨 값을 설정한다.
		map.setMinLevel(1); //지도의 최소 레벨 값을 설정한다.

		var positions = [ {
			content : '<div id="content">강남역 2호선 1번출구</div>',
			latlng : new kakao.maps.LatLng(37.498072, 127.028765),
			clickable : true
		}, {
			content : '<div id="content">부평역 1호선 1번출구</div>',
			latlng : new kakao.maps.LatLng(37.489103, 126.725255),
			clickable : true
		}, {
			content : '<div id="content">망포역 분당선 1번출구</div>',
			latlng : new kakao.maps.LatLng(37.245654, 127.058529),
			clickable : true
		}, {
			content : '<div id="content">부천시청역 7호선 1번출구</div>',
			latlng : new kakao.maps.LatLng(37.504280, 126.764500),
			clickable : true
		}, {
			content : '<div id="content">계산역 인천 1호선 1번출구</div>',
			latlng : new kakao.maps.LatLng(37.543110, 126.728840),
			clickable : true
		}, {
			content : '<div id="content">삼각지역 4호선 1번출구</div>',
			latlng : new kakao.maps.LatLng(37.534604, 126.973411),
			clickable : true
		} ];

		// 마커 이미지의 이미지 주소입니다
		//var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		var imageSrc = "resources/bootstrap/image/gmap.png";
		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new kakao.maps.Size(24, 35);

		// 마커 이미지를 생성합니다    
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

		for (var i = 0; i < positions.length; i++) {
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				//title : positions[i].title,// 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 
				image : markerImage
			// 마커 이미지 
			});

			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content
			// 인포윈도우에 표시할 내용
			});

			(function(marker, infowindow) {
				// 마커에 click 이벤트를 등록하고 마우스 클릭 시 중심좌표 변경 및 확대를합니다.
				kakao.maps.event.addListener(marker, 'click', function() {
					zoomIn();
					setCenter(marker.getPosition());
				});

				// 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					infowindow.open(map, marker);
				});

				// 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});

			})(marker, infowindow);
		}

		function mapReset() {
			zoomOut();
			setCenter01();
		}

		function zoomIn() {
			// 현재 지도의 레벨을 얻어옵니다
			var level = map.getLevel();

			// 지도를 1레벨 내립니다 (지도가 확대됩니다)
			map.setLevel(level - 9);
		}

		function zoomOut() {
			// 현재 지도의 레벨을 얻어옵니다
			var level = map.getLevel();

			// 지도를 9레벨 올립니다 (지도가 축소됩니다)
			map.setLevel(level + 9);
		}

		function setCenter(marker) {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = marker;

			// 지도 중심을 이동 시킵니다
			map.setCenter(moveLatLon);
		}

		function setCenter01() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(37.411405, 126.897654);

			// 지도 중심을 이동 시킵니다
			map.setCenter(moveLatLon);
		}
	</script>
	</div>
	
	<!-- ------------------------헤더-------------------------------------------- -->
	<%@ include file="../footer.jsp"%>
	<!-- ------------------------헤더-------------------------------------------- -->
</body>
</html>