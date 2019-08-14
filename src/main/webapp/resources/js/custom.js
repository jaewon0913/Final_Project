// custom drag and drop
var jb = $.noConflict();

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
	console.log(original.id);
	console.log(copyimg.src);
	console.log(original.name);
	copyimg.id = original.id;
	jb(copyimg).addClass('copydish');
	
	//	데이터 추가하기
	//sumData(original.name);
	var test = document.getElementById(original.id+"_cal");
	alert(test.value);
	
	var before_cal = jb("#kal_span").text();
	alert("before_cal" + before_cal);
	var after_cal = 0;
	if(before_cal == "0"){
		after_cal = test.value;
		jb("#kal_span").html(after_cal);
	} else {
		var before_cal_int = parseInt(before_cal);
		var test_value_int = parseInt(test.value);
		after_cal = before_cal_int + test_value_int;
		jb("#kal_span").html(after_cal);
	}
	
	event.target.appendChild(copyimg);
	copyimg.setAttribute("style","width : 15rem; height : 15rem;");
	copyimg.setAttribute('draggable', true);
		
	jb(copyimg).dblclick(function() {
		jb(this).remove();
	});
}
//주문
function order(count){
	var list = new Array();
	for (var i = 0 ; i < count ; i++){
		list[i] = jb('.test').eq(i).children('.copydish').attr('id');
		alert(list[i]);
		alert(jb(".copydish")[i].outerHTML);
	}
}
var i = 0;
function sumData(data){
	var list = new Array();
//	list[i] = document.getElementsByName(data+"_tan")[0].value;
//	
//	for(var j = 0 ; j < i ; j++){
//		alert(list[j]);
//	}
//	
//	i++;

}

var hj = jQuery.noConflict();

//	식판 화면 변환
function sikpanChange(content){
	alert(content+" sikpan click")
		
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
							"		<img name = "+list[i].dish_name+" id = 'sideDish"+i+"' class = 'customContent' src = '/mvc/resources/etc/upload/"+list[i].file_name+"' draggable = 'true' ondragstart = 'dragstart_handler(event);'>" +
							"		<input type = 'hidden' id = 'sideDish" + i + "_tan' name = '" + list[i].dish_name + "_tan' value = '" + list[i].dish_tan + "'>" +
							"		<input type = 'hidden' id = 'sideDish" + i + "_dan' name = '" + list[i].dish_name + "_dan' value = '" + list[i].dish_dan + "'>" +
							"		<input type = 'hidden' id = 'sideDish" + i + "_zi' name = '" + list[i].dish_name + "_zi' value = '" + list[i].dish_zi + "'>" +
							"		<input type = 'hidden' id = 'sideDish" + i + "_cal' name = '" + list[i].dish_name + "_cal' value = '" + list[i].dish_cal + "'>" +
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