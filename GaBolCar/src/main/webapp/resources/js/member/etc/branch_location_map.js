// 기본 지도(위치이동 가능)
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOptions = {
	center: new kakao.maps.LatLng(35.1584043, 129.0620349), // 지도의 중심좌표
	level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOptions); // 지도를 생성합니다

// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '부산진구 본점', 
        latlng: new kakao.maps.LatLng(35.1584043, 129.0620349)
    },
    {
        title: '범일점', 
        latlng: new kakao.maps.LatLng(35.1594043, 129.0620349)
    }
];


// 05 26 경인수정
// 이미지 경로 수정
var imageSrc = "/project_gabolcar/resources/img/member/etc/branch_location/map_marker_icon.png";

for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
} 

// 이미지 지도(고정)
//var staticMapContainer  = document.getElementById('map'), // 이미지 지도를 표시할 div 
//    staticMapOption = {
//		        marker : {
//		        	text : '부산진구 본점', // 마커와 함께 표시할 텍스트
//		        	position: new kakao.maps.LatLng(35.1584043, 129.0620349) // 좌표가 없으면 지도 중심에 마커가 표시된다
//		        },
//		        center: new kakao.maps.LatLng(35.1795543, 129.0756416), // 이미지 지도의 중심 좌표
//		        level: 7, // 이미지 지도의 확대 레벨
//		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
//		    };
//		    
//		// 이미지 지도를 생성한다
//var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);