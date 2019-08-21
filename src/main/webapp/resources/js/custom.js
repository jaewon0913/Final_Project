// jQuery 충돌방지
var jb = $.noConflict();

//	create Cookie
function createCookie(count){
	var cookie_cal = jb("#cal_span").text();
	var cookie_tan = jb("#tan_span").text();
	var cookie_dan = jb("#dan_span").text();
	var cookie_zi = jb("#zi_span").text();
	var cookie_price = jb("#price_span").text();
	var cookie_count = count;
	
	var cookie_src = new Array();
	jb(".copydish").each(function (){
		cookie_src.push(jb(this).attr("src"));
	});
	
	var cookie_dish = new Array();
	jb(".span_data").each(function (){
		cookie_dish.push(jb(this).text());
	})	
	if(count=="4"){
		jb.ajax({
			type : "POST",
			url : "createCookie.do",
			data : {
				dish1 : cookie_dish[0], src1 : cookie_src[0],
				dish2 : cookie_dish[1], src2 : cookie_src[1],
				dish3 : cookie_dish[2], src3 : cookie_src[2],
				dish4 : cookie_dish[3], src4 : cookie_src[3],
				dish5 : cookie_dish[4], src5 : cookie_src[4],
				count : cookie_count,
				cal : cookie_cal,
				tan : cookie_tan,
				dan : cookie_dan,
				zi : cookie_zi,
				price : cookie_price
			},
			success : function(msg){				
				if(msg.success == "success"){
					alert("장바구니 추가 완료");
				}
			},
			error : function(){
				alert("데이터 통신 실패!!!!");
			}
		});
	} else if (count == "5"){
		jb.ajax({
			type : "POST",
			url : "createCookie.do",
			data : {
				dish1 : cookie_dish[0], src1 : cookie_src[0],
				dish2 : cookie_dish[1], src2 : cookie_src[1],
				dish3 : cookie_dish[2], src3 : cookie_src[2],
				dish4 : cookie_dish[3], src4 : cookie_src[3],
				dish5 : cookie_dish[4], src5 : cookie_src[4],
				dish6 : cookie_dish[5], src5 : cookie_src[5],
				count : cookie_count,
				cal : cookie_cal,
				tan : cookie_tan,
				dan : cookie_dan,
				zi : cookie_zi,
				price : cookie_price
			},
			success : function(msg){
				if(msg.success == "success"){
					alert("장바구니 추가 완료");
				}
			},
			error : function(){
				alert("데이터 통신 실패!!!!");
			}
		});
	} else {
		jb.ajax({
			type : "POST",
			url : "createCookie.do",
			data : {
				dish1 : cookie_dish[0], src1 : cookie_src[0],
				dish2 : cookie_dish[1], src2 : cookie_src[1],
				dish3 : cookie_dish[2], src3 : cookie_src[2],
				dish4 : cookie_dish[3], src4 : cookie_src[3],
				dish5 : cookie_dish[4], src5 : cookie_src[4],
				dish6 : cookie_dish[5], src5 : cookie_src[5],
				dish7 : cookie_dish[6], src5 : cookie_src[6],
				count : cookie_count,
				cal : cookie_cal,
				tan : cookie_tan,
				dan : cookie_dan,
				zi : cookie_zi,
				price : cookie_price
			},
			success : function(msg){				
				if(msg.success == "success"){
					alert("장바구니 추가 완료");
				}
			},
			error : function(){
				alert("데이터 통신 실패!!!!");
			}
		});
	}
	
	
}

var contextPath = '${pageContext.request.contextPath }';

//	드래그 시작시
function dragstart_handler(event){
	fnMove();
	
	event.dataTransfer.effectAllowed = "copy";
	event.dataTransfer.setData("text/plain",event.target.id);
}

//무한 스크롤 처럼 화면의 몇 % 지나면 스크롤이 올라가도록 해보기
function fnMove(){
	var offset = jb(".container").offset();
	jb('html,body').animate({scrollTop : offset.top + 100}, 400);
}

//	드래그 도중
function dragover_handler(event){
	event.dataTransfer.dropEffect = "copy";
	event.preventDefault();
}

//	드래그 끝 = 드랍시
function drop_handler(event){
	event.dataTransfer.dropEffect = "copy";
	event.preventDefault();

	var data = event.dataTransfer.getData("text/plain");
	
	var copyimg = document.createElement("img");
	var original = document.getElementById(data);
	
	copyimg.src = original.src;
	copyimg.id = original.id + "copy";
	
	console.log(original.name);
	console.log(event.target.childNodes[1]);
	
	event.target.childNodes[1].value = original.name;
		
	console.log(original.src);
	console.log(copyimg.src);
	
	jb(copyimg).addClass('copydish');
	
	//	데이터 추가하기
	one_data(original.id, original.name, event.target.childNodes[1]);	//	1회 구매창
	multi_data(original.id, original.name);	//	정기 구매창
	
	event.target.appendChild(copyimg);
	copyimg.setAttribute("style","width : 15rem; height : 15rem;");
	copyimg.setAttribute('draggable', true);
		
	jb(copyimg).dblclick(function() {
		jb(this).remove();
		one_remove(this.id);
		multi_remove(this.id);
	});
}

function cancelDish(msg){
	var plusCopy = msg + "copy";
	jb("#"+plusCopy).remove();
	one_remove(plusCopy);
	multi_remove(plusCopy);
}

function one_remove(msg){
	var replace_id = msg.replace("copy","");
	var remove_id =  msg + "_sendDiv";
	jb("#"+remove_id).remove();
	
	var data_cal = document.getElementById(replace_id+"_cal");
	var data_tan = document.getElementById(replace_id+"_tan");
	var data_dan = document.getElementById(replace_id+"_dan");
	var data_zi = document.getElementById(replace_id+"_zi");
	
	var before_cal = jb("#cal_span").text();
	var before_tan = jb("#tan_span").text();
	var before_dan = jb("#dan_span").text();
	var before_zi = jb("#zi_span").text();
	
	//	형변환
	var before_cal_int = parseInt(before_cal);
	var before_tan_int = parseInt(before_tan);
	var before_dan_int = parseInt(before_dan);
	var before_zi_int = parseInt(before_zi);
	
	var data_cal_value_int = parseInt(data_cal.value);
	var data_tan_value_int = parseInt(data_tan.value);
	var data_dan_value_int = parseInt(data_dan.value);
	var data_zi_value_int = parseInt(data_zi.value);
	
	var after_cal = before_cal_int - data_cal_value_int;
	var after_tan = before_tan_int - data_tan_value_int;
	var after_dan = before_dan_int - data_dan_value_int;
	var after_zi = before_zi_int - data_zi_value_int;
	
	jb("#cal_span").html(after_cal);
	jb("#tan_span").html(after_tan);
	jb("#dan_span").html(after_dan);
	jb("#zi_span").html(after_zi);
	
	jb("#input_tan").val(after_tan);
	jb("#input_dan").val(after_dan);
	jb("#input_zi").val(after_zi);
	jb("#input_kal").val(after_cal);
}

function multi_remove (msg){
	var replace_id = msg.replace("copy","");
	var remove_id =  msg + "_sendDiv2";
	jb("#"+remove_id).remove();
	
	var data_cal = document.getElementById(replace_id+"_cal");
	var data_tan = document.getElementById(replace_id+"_tan");
	var data_dan = document.getElementById(replace_id+"_dan");
	var data_zi = document.getElementById(replace_id+"_zi");
	
	var before_cal = jb("#cal_span_multi").text();
	var before_tan = jb("#tan_span_multi").text();
	var before_dan = jb("#dan_span_multi").text();
	var before_zi = jb("#zi_span_multi").text();
	
	//	형변환
	var before_cal_int = parseInt(before_cal);
	var before_tan_int = parseInt(before_tan);
	var before_dan_int = parseInt(before_dan);
	var before_zi_int = parseInt(before_zi);
	
	var data_cal_value_int = parseInt(data_cal.value);
	var data_tan_value_int = parseInt(data_tan.value);
	var data_dan_value_int = parseInt(data_dan.value);
	var data_zi_value_int = parseInt(data_zi.value);
	
	var after_cal = before_cal_int - data_cal_value_int;
	var after_tan = before_tan_int - data_tan_value_int;
	var after_dan = before_dan_int - data_dan_value_int;
	var after_zi = before_zi_int - data_zi_value_int;
	
	jb("#cal_span_multi").html(after_cal);
	jb("#tan_span_multi").html(after_tan);
	jb("#dan_span_multi").html(after_dan);
	jb("#zi_span_multi").html(after_zi);
	
	jb("#input_tan_multi").val(after_tan);
	jb("#input_dan_multi").val(after_dan);
	jb("#input_zi_multi").val(after_zi);
	jb("#input_kal_multi").val(after_cal);
}

function one_data(msg, name, data){
		
	var data_name = name;
	
	var replace_msg = "'"+msg+"'";
	
	var tag = "<div id = '"+ msg +"copy_sendDiv'>" +
			"<span class = 'font span_data' id = '"+ msg  +"'>"+data_name+"</span>" +
			"<input type ='button' value ='x' onclick = 'cancelDish(&#39"+msg+"&#39)' style = 'float : right; font-size : 1rem;'>" + data.outerHTML + 
			"</div>";
	
	jb("#sendDiv").prepend(tag);
	
	var data_cal = document.getElementById(msg+"_cal");
	var data_tan = document.getElementById(msg+"_tan");
	var data_dan = document.getElementById(msg+"_dan");
	var data_zi = document.getElementById(msg+"_zi");
	
	var before_cal = jb("#cal_span").text();
	var before_tan = jb("#tan_span").text();
	var before_dan = jb("#dan_span").text();
	var before_zi = jb("#zi_span").text();
	
	var after_cal = 0;
	var after_tan = 0;
	var after_dan = 0;
	var after_zi = 0;
	
	if(before_cal == "0"){
		
		after_cal = data_cal.value;
		after_tan = data_tan.value;
		after_dan = data_dan.value;
		after_zi = data_zi.value;
		
		jb("#cal_span").html(after_cal);
		jb("#tan_span").html(after_tan);
		jb("#dan_span").html(after_dan);
		jb("#zi_span").html(after_zi);
		
		jb("#input_tan").val(after_tan);
		jb("#input_dan").val(after_dan);
		jb("#input_zi").val(after_zi);
		jb("#input_kal").val(after_cal);
		
	} else {
		var before_cal_int = parseInt(before_cal);
		var before_tan_int = parseInt(before_tan);
		var before_dan_int = parseInt(before_dan);
		var before_zi_int = parseInt(before_zi);
		
		var data_cal_value_int = parseInt(data_cal.value);
		var data_tan_value_int = parseInt(data_tan.value);
		var data_dan_value_int = parseInt(data_dan.value);
		var data_zi_value_int = parseInt(data_zi.value);
		
		after_cal = before_cal_int + data_cal_value_int;
		after_tan = before_tan_int + data_tan_value_int;
		after_dan = before_dan_int + data_dan_value_int;
		after_zi = before_zi_int + data_zi_value_int;
		
		jb("#cal_span").html(after_cal);
		jb("#tan_span").html(after_tan);
		jb("#dan_span").html(after_dan);
		jb("#zi_span").html(after_zi);
		
		jb("#input_tan").val(after_tan);
		jb("#input_dan").val(after_dan);
		jb("#input_zi").val(after_zi);
		jb("#input_kal").val(after_cal);
	}
}

function multi_data(msg, name){
	
	var data_name = name;
	
	var tag = "<div id = '"+ msg +"copy_sendDiv2'>" +
			"<span class = 'font' id = '"+ msg  + "'>"+data_name+"</span>" +
			"<input type ='button' value ='x' id ='' style = 'float : right; font-size : 1rem;'>" +
			"</div>";
	
	jb("#sendDiv2").prepend(tag);
	
	var data_cal = document.getElementById(msg+"_cal");
	var data_tan = document.getElementById(msg+"_tan");
	var data_dan = document.getElementById(msg+"_dan");
	var data_zi = document.getElementById(msg+"_zi");
	
	var before_cal = jb("#cal_span_multi").text();
	var before_tan = jb("#tan_span_multi").text();
	var before_dan = jb("#dan_span_multi").text();
	var before_zi = jb("#zi_span_multi").text();
	
	var after_cal = 0;
	var after_tan = 0;
	var after_dan = 0;
	var after_zi = 0;
	
	if(before_cal == "0"){
		
		after_cal = data_cal.value;
		after_tan = data_tan.value;
		after_dan = data_dan.value;
		after_zi = data_zi.value;
		
		jb("#cal_span_multi").html(after_cal);
		jb("#tan_span_multi").html(after_tan);
		jb("#dan_span_multi").html(after_dan);
		jb("#zi_span_mulit").html(after_zi);
		
		jb("#input_tan_multi").val(after_tan);
		jb("#input_dan_multi").val(after_dan);
		jb("#input_zi_multi").val(after_zi);
		jb("#input_kal_multi").val(after_cal);
		
	} else {
		var before_cal_int = parseInt(before_cal);
		var before_tan_int = parseInt(before_tan);
		var before_dan_int = parseInt(before_dan);
		var before_zi_int = parseInt(before_zi);
		
		var data_cal_value_int = parseInt(data_cal.value);
		var data_tan_value_int = parseInt(data_tan.value);
		var data_dan_value_int = parseInt(data_dan.value);
		var data_zi_value_int = parseInt(data_zi.value);
		
		after_cal = before_cal_int + data_cal_value_int;
		after_tan = before_tan_int + data_tan_value_int;
		after_dan = before_dan_int + data_dan_value_int;
		after_zi = before_zi_int + data_zi_value_int;
		
		jb("#cal_span_multi").html(after_cal);
		jb("#tan_span_multi").html(after_tan);
		jb("#dan_span_multi").html(after_dan);
		jb("#zi_span_multi").html(after_zi);
		
		jb("#input_tan_multi").val(after_tan);
		jb("#input_dan_multi").val(after_dan);
		jb("#input_zi_multi").val(after_zi);
		jb("#input_kal_multi").val(after_cal);
	}
}

var hj = jQuery.noConflict();

//	식판 화면 변환
function sikpanChange(content){		
	hj.ajax({
		url : "customSikpan.do",
		type : "post",
		data : "sikpan="+content,
		success : function(msg){
			var sikpan = msg.sikpan;
			
			location.href = "sikpanChange.do?count="+sikpan;
								
		},
		error : function(){
			location.href = "error.do";
		}
	});
}

//	ajax로 반찬 변경
function changeDish(data) {
	hj.ajax({
		url : "changeDish.do",
		type : "post",
		data : "dishname=" + data,
		dataType : "json",
		success : function(data){
			hj("#dish_list *").remove();
			var list = data.list;
			// list
			
			for(var i = 0 ; i < list.length ; i++){
				hj("#dish_list").append(
							"<div style = 'display : inline-block'>" +
							"	<div class = 'customImg'>" +
							"		<img name = "+list[i].dish_name+" id = 'sideDish"+list[i].upload_no+"' class = 'customContent' src = '/mvc/resources/etc/upload/"+list[i].file_name+"' draggable = 'true' ondragstart = 'dragstart_handler(event);'>" +
							"		<input type = 'hidden' id = 'sideDish" + list[i].upload_no + "_tan' name = '" + list[i].dish_name + "_tan' value = '" + list[i].dish_tan + "'>" +
							"		<input type = 'hidden' id = 'sideDish" + list[i].upload_no + "_dan' name = '" + list[i].dish_name + "_dan' value = '" + list[i].dish_dan + "'>" +
							"		<input type = 'hidden' id = 'sideDish" + list[i].upload_no + "_zi' name = '" + list[i].dish_name + "_zi' value = '" + list[i].dish_zi + "'>" +
							"		<input type = 'hidden' id = 'sideDish" + list[i].upload_no + "_cal' name = '" + list[i].dish_name + "_cal' value = '" + list[i].dish_cal + "'>" +
							"	</div>" +
							"</div>"
						);
			}
		},
		error : function(){
			location.href = "error.do";
		}
	});
}