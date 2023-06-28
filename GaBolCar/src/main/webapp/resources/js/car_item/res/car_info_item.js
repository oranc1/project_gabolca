let pageNum = '1';

$(function(){
	
	carList();
	
	function carList() {
		let car_type = new Array();
		let car_fuel = new Array();
		$("input[name=selectCarType]:checked").each(function() {
			car_type.push($(this).val());
		});
		
		$("input[name=selectFuel]:checked").each(function() {
			car_fuel.push($(this).val());
		});
		
		console.log(pageNum);
		
		$.ajax({
			url:"carInfoList.ajax",
			type:"GET",
			dataType:"json",
			data:{
				'pageNum': pageNum,
				'car_type': car_type,
				'car_fuel': car_fuel
			},
			async: false
		}).done(function(carList) {
			doneResult(carList);			
		}).fail(function(){
			// 실패시
		}) 
	}
	
	function doneResult(carList) {
		let pageInfo = carList.pop();
		let path = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
//		console.log(path);
		console.log(pageInfo)
		for (let car of carList) {
			let result =
				"<div class='car-item ${fn:toLowerCase("+car.car_type+".replace(' ', '_'))} "+car.car_fuel_type+"'>"
		      		+"<div class='int_wrap'>"
		        		+"<div class='left-image'>"
		        			+"<img src='"+path+"/resources/upload/car/"+car.car_file_path+"/"+car.car_file1+"' alt='"+car.car_model+"' />"
		        		+"</div>"
		        		+"<div class='right-content'>"
		          			+"<div class='name-flex'>"
		            			+"<div class='name1'>"
		              				+"<p>" + car.car_model + "(" + car.car_company + ") </p>"
		            			+"</div>"
		            			+"<div class='name2'>"
		              				+"<p>" + car.car_type + "/" + car.car_riding + "인승 / " + car.car_fuel_type + "</p>"
		            			+"</div>"
		          			+"</div>"
		          			+"<div class='table-wrapper'>"
		            			+"<div class='table'>"
		              				+"<h3>요금정보</h3>"
		              					+"<table class='custom-table' border='1'>"
		                					+"<tr>"
							                  	+"<th>구분</th>"
							                  	+"<th>주중 대여료</th>"
							                  	+"<th>주말 대여료</th>"
							                +"</tr>"
		                					+"<tr>"
							                  	+"<td>24시간</td>"
							                  	+"<td><span>"+car.car_weekdays+"</span>원</td>"
							                  	+"<td><span>"+car.car_weekend+"</span>원</td>"
							                +"</tr>"
					    					+"<tr>"
					        					+"<td>6시간</td>"
					        					+"<td>"+car.car_weekdays*0.5+"원</td>"
					        					+"<td>"+car.car_weekend*0.5+"원</td>"
					    					+"</tr>"
					    					+"<tr>"
					        					+"<td>1시간</td>"
					        					+"<td>"+car.car_weekdays*0.5*0.5+"원</td>"
					        					+"<td>"+car.car_weekend*0.5*0.5+"원</td>"
					    					+"</tr>"
		              				+"</table>"
		            			+"</div>"
								+"<div class='option-div'>"
					  				+"<h3>옵션</h3>"
										+"<div class='custom-div'>"    
											+"<span>"+car.option_name+"</span>"
										+"</div>"
									+"</div>"
								+"</div>"
							+"</div>"
						+"</div>"
					+"</div>";
			$("#itemList").append(result);
		}
		
		if (pageInfo.maxPage == 0) {
			$("#nextPage").css("display","none");
		} else if (pageNum != pageInfo.maxPage) {
			$("#nextPage").css("display","");
		} else {
			$("#nextPage").css("display","none");
		}
		
	}
	
	$("input[name=selectCarType]").on("click",function() {
		pageNum = 1;
		$("#itemList").empty()
		carList();
		
	});
	
	$("input[name=selectFuel]").on("click",function() {
		pageNum = 1;
		$("#itemList").empty();
		carList();
	});
	
	$("#nextPage").on("click",function() {
		pageNum++;
		carList();
	});
})