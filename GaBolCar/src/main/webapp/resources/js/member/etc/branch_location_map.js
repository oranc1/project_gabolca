let brc_name ='부산진구 본점';
let map_y ='35.1584043';
let map_x ='129.0620349';

// 기본 지도(위치이동 가능)
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOptions = {
	center: new kakao.maps.LatLng(map_y, map_x), // 지도의 중심좌표
	level: 3, // 지도의 확대 레벨
	disableDoubleClickZoom: true // 더블클릭 확대기능 X
};

var map = new kakao.maps.Map(mapContainer, mapOptions); // 지도를 생성합니다

// 마커를 표시할 위치와 title 객체 배열입니다 
//var positions = [
//    {
//        title: brc_name, 
//        latlng: new kakao.maps.LatLng(map_y, map_x)
//    }
//    ,{
//        title: '범일점', 
//        latlng: new kakao.maps.LatLng(35.1594043, 129.0620349)
//    }
//];


// 05 26 경인수정
// 이미지 경로 수정
var imageSrc = "resources/img/member/etc/branch_location/map_marker_icon.png";

// 마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(24, 35); 

// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

// 생성된 마커를 저장할 배열
var markers = [];

// 마커 삭제
function setMarkers() {
	for (var i = 0; i < markers.length; i++) {
    	markers[i].setMap(null);
    }	
}
function panTo() {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(map_y, map_x);
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);            
}

$(function(){
	// 마커 생성
	function addMarker() {
		var marker = new kakao.maps.Marker({
			map: map, // 마커를 표시할 지도
		    position: new kakao.maps.LatLng(map_y, map_x), // 마커를 표시할 위치
		    title : brc_name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		    image : markerImage // 마커 이미지 
		});
			
	    // 생성된 마커를 배열에 추가합니다
	    markers.push(marker);
	}

	// 마커를 생성합니다
	addMarker();
	
	$("div[class=branch_location_title]").css("cursor","pointer").on("click",function() {
		brc_name = $(this).text();
		map_y = $(this).siblings().eq(0).val();
		map_x = $(this).siblings().eq(1).val();
		
		setMarkers();
		addMarker();
		panTo();
	})
});