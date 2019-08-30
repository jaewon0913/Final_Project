var jb = $.noConflict();

function createCookie(){
	var cookie_cal = jb("#cal_span").text();
	var cookie_tan = jb("#tan_span").text();
	var cookie_dan = jb("#dan_span").text();
	var cookie_zi = jb("#zi_span").text();
	var cookie_price = jb("#price_span").text();
	
	var cookie_src = jb("#dosriak_src").val();
	var cookie_name = jb("#doriak_name").val();
	
	jb.ajax({
		type : "POST",
		url : "dosirakCookie.do",
		data : {
			cal : cookie_cal,
			tan : cookie_tan,
			dan : cookie_dan,
			zi : cookie_zi,
			price : cookie_price,
			src1 : cookie_src,
			dish1 : cookie_name
		},
		success : function(msg){
			if(msg.success = "success"){
				alert("장바구니 추가 완료");
			}
		},
		error : function(){
			alert("데이터 통신 실패!!!");
		}
	});
}