// custom drag and drop
var jb = $.noConflict();

jb(function() {
	// Make every clone image unique.
	var counts = [ 0 ];
	var resizeOpts = {
		handles : "all",
		autoHide : true
	};
	
	jb(".customContent").draggable({
		helper : "clone",
		// Create counter
		start : function() {
			counts[0]++;
		}
	});

	jb(".customDrop").droppable(
			{
				drop : function(e, ui) {
					if (ui.draggable.hasClass("customContent")) {
						jb(this).append(jb(ui.helper).clone());
						// Pointing to the dragImg class in dropHere and add new class.
						jb(".customDrop .customContent").addClass("item-" + counts[0]);
						jb(".customDrop .customContent").addClass("imgSize-" + counts[0]);
						
						// 그림 사이즈 바꾸기
						//jb(".imgSize-" + counts[0]).width(100);
						//jb(".imgSize-" + counts[0]).height(150);
						
						jb(".imgSize-" + counts[0]).css('width','100px');
						jb(".imgSize-" + counts[0]).css('height','150px');
						
						// Remove the current class (ui-draggable and dragImg)
						jb(".customDrop .item-" + counts[0]).removeClass("customContent ui-draggable ui-draggable-dragging");
						
						// double click => content delete
						jb(".item-" + counts[0]).dblclick(function() {
							jb(this).remove();
						});
						
						// ???
						make_draggable(jb(".item-" + counts[0]));
						
						//jb(".imgSize-" + counts[0]).resizable(resizeOpts);
					}
				}
			});
	var zIndex = 0;

	function make_draggable(elements) {
		elements.draggable({
			containment : 'parent',
			start : function(e, ui) {
				ui.helper.css('z-index', ++zIndex);
			},
			stop : function(e, ui) {
			}
		});
	}
});

var hj = jQuery.noConflict();


function sikpanChange(content){
	alert(content+" sikpan click")
		
	hj.ajax({
		url : "customSikpan.do",
		type : "post",
		data : "sikpan="+content,
		success : function(msg){
			var sikpan = msg.sikpan;
			alert(msg.sikpan);
			
			location.href = "sikpanChange.do?count="+sikpan;
								
		},
		error : function(){
			location.href = "error.do";
		}
	});
}

function order(count){
	var list = new Array();
	for (var i = 0 ; i < count ; i++){
		list[i] = jb('.test').eq(i).children('.ui-draggable').attr('name');
		alert(list[i]);
	}
	
}