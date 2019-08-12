// custom drag and drop
var jb = $.noConflict();

function dragstart_handler(event){	
	event.dataTransfer.effectAllowed = "copy";
	event.dataTransfer.setData("text/plain",event.target.id);
}

function dragover_handler(event){
	event.dataTransfer.dropEffect = "copy";
	event.preventDefault();
}

function drop_handler(event){
	event.dataTransfer.dropEffect = "copy";
	event.preventDefault();

	var data = event.dataTransfer.getData("text/plain");
	
	var copyimg = document.createElement("img");
	var original = document.getElementById(data);
	
	copyimg.src = original.src;
	copyimg.id = original.id;
	jb(copyimg).addClass('copydish');
	
	event.target.appendChild(copyimg);
	copyimg.setAttribute("style","width : 100px; height : 150px;");
	copyimg.setAttribute('draggable', true);
	
	jb(copyimg).dblclick(function() {
		jb(this).remove();
	});
}

var hj = jQuery.noConflict();

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
//
function order(count){
	var list = new Array();
	for (var i = 0 ; i < count ; i++){
		list[i] = jb('.test').eq(i).children('.copydish').attr('id');
		alert(list[i]);
		alert(jb(".copydish")[i].outerHTML);
	}
	
}

//	ajax로 
function changeDish(data) {
	alert(data);
	hj.ajax({
		url : "changeDish.do",
		type : "post",
		data : "dishname=" + data,
		dataType : "json",
		success : function(msg){
			hj("#dish_list *").remove();
			var list = msg.list;
			
			for(var i = 0 ; i < list.length ; i++){
				hj("#dish_list").append(
							"<div style = 'display : inline-block'>" +
							"	<div class = 'customImg'>" +
							"		<img name = "+list[i].dish_name+" id = 'sideDish' class = 'customContent' src = "+list[0].file_path+" draggable = 'true' ondragstart = 'dragstart_handler(event);'>" +
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

//jb(function() {
//// Make every clone image unique.
//var counts = [ 0 ];
//var resizeOpts = {
//	handles : "all",
//	autoHide : true
//};
//
//jb(".customContent").draggable({
//	helper : "clone",
//	// Create counter
//	start : function() {
//		counts[0]++;
//	}
//});
//
//jb(".customDrop").droppable(
//		{
//			drop : function(e, ui) {
//				if (ui.draggable.hasClass("customContent")) {
//					jb(this).append(jb(ui.helper).clone());
//					// Pointing to the dragImg class in dropHere and add new class.
//					jb(".customDrop .customContent").addClass("item-" + counts[0]);
//					jb(".customDrop .customContent").addClass("imgSize-" + counts[0]);
//					
//					// 그림 사이즈 바꾸기
//					//jb(".imgSize-" + counts[0]).width(100);
//					//jb(".imgSize-" + counts[0]).height(150);
//					
//					jb(".imgSize-" + counts[0]).css('width','100px');
//					jb(".imgSize-" + counts[0]).css('height','150px');
//					
//					// Remove the current class (ui-draggable and dragImg)
//					jb(".customDrop .item-" + counts[0]).removeClass("customContent ui-draggable ui-draggable-dragging");
//					
//					// double click => content delete
//					jb(".item-" + counts[0]).dblclick(function() {
//						jb(this).remove();
//					});
//					
//					// ???
//					make_draggable(jb(".item-" + counts[0]));
//					
//					//jb(".imgSize-" + counts[0]).resizable(resizeOpts);
//				}
//			}
//		});
//var zIndex = 0;
//
//function make_draggable(elements) {
//	elements.draggable({
//		containment : 'parent',
//		start : function(e, ui) {
//			ui.helper.css('z-index', ++zIndex);
//		},
//		stop : function(e, ui) {
//		}
//	});
//}
//});
//