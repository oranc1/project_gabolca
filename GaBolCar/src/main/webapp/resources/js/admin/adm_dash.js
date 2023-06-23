	// 열차트(지점별 매출액)
	google.charts.load('current', {'packages':['bar'],'language': 'ko'});
	google.charts.setOnLoadCallback(drawChart);
	
	// 열차트(지점별 인기차량) // 지점별 인기차량 열차트 표현불가
	google.charts.load('current', {'packages':['bar'],'language': 'ko'});
	google.charts.setOnLoadCallback(drawChart2);
	
	// 열차트(월별 렌트수)
	google.charts.load('current', {'packages':['bar'],'language': 'ko'});
	google.charts.setOnLoadCallback(drawChart3);
	
	// 도넛차트(차량 상태)
	google.charts.load("current", {packages:["corechart"],'language': 'ko'});
	google.charts.setOnLoadCallback(drawChart4);
	
	// 도넛차트(차 종별 렌트수)
	google.charts.load("current", {packages:["corechart"],'language': 'ko'});
	google.charts.setOnLoadCallback(drawChart5);
	
	// 도넛차트(연령별 인기차량) // 차량 모델은 원형으로 표현 불가
	google.charts.load("current", {packages:["corechart"],'language': 'ko'});
	google.charts.setOnLoadCallback(drawChart6);

// 열차트(지점별 매출액)
function drawChart() {
 let jsonData = $.ajax({
		type: 'get',
		url: 'dsbBrcMonthlySale',
		dataType: 'json',
		async: false
	}).responseText;
	var data = new google.visualization.DataTable(jsonData);
	var options = {
		chart: {
			title: '지점별 월 매출액'
		}
	};

  var chart = new google.charts.Bar(document.getElementById('month_brc_sales'));
  chart.draw(data, google.charts.Bar.convertOptions(options));
};

// 열차트(지점별 인기차량) // 지점별 인기차량 열차트 표현불가
function drawChart2() {
	let jsonData = $.ajax({
		type: 'get',
		url: 'dsbBrcMonthlyCount',
		dataType: 'json',
		async: false
	}).responseText;
	var data = new google.visualization.DataTable(jsonData);
	var options = {
		chart: {
			title: '지점별 월 렌트'
		}
	};
	var chart = new google.charts.Bar(document.getElementById('brc_popular_model'));
	chart.draw(data, google.charts.Bar.convertOptions(options));
};

// 열차트(월별 렌트수)
function drawChart3() {
 	let jsonData = $.ajax({
		type: 'get',
		url: 'dsbBrcHoldStatus',
		dataType: 'json',
		async: false
	}).responseText;
	var data = new google.visualization.DataTable(jsonData);
	var options = {
		chart: {
			title: '지점별 보유차량'
		}
	};
  var chart = new google.charts.Bar(document.getElementById('month_rental_count'));
  chart.draw(data, google.charts.Bar.convertOptions(options));
};

// 도넛차트(차량 상태)
function drawChart4() {
	let jsonData = $.ajax({
		type: 'get',
		url: 'dsbCarStatus',
		dataType: 'json',
		async: false
	}).responseText;
	
	var data = new google.visualization.DataTable(jsonData)
    var options = {
	    title: '차량 상태',
	    pieHole: 0.4,
	  };
	var chart = new google.visualization.PieChart(document.getElementById('car_status'));
	chart.draw(data, options);
}

// 도넛차트(차 종별 렌트수)
function drawChart5() {
 	let jsonData = $.ajax({
		type: 'get',
		url: 'dsbCarType',
		dataType: 'json',
		async: false
	}).responseText;

 	var data = new google.visualization.DataTable(jsonData)
    var options = {
	    title: '차종별 렌트수',
	    pieHole: 0.4,
	  };

  var chart = new google.visualization.PieChart(document.getElementById('car_type_rent'));
  chart.draw(data, options);
}

// 도넛차트(연령별 인기차량) // 차량 모델은 원형으로 표현 불가
function drawChart6() {
 	let jsonData = $.ajax({
		type: 'get',
		url: 'dsbUserAges',
		dataType: 'json',
		async: false
	}).responseText;
	var data = new google.visualization.DataTable(jsonData)
	var options = {
		title: '연령대별 이용건수',
		pieHole: 0.4,
	};

  var chart = new google.visualization.PieChart(document.getElementById('age_popular_model'));
  chart.draw(data, options);
}