<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% MemberDto logindto = (MemberDto) session.getAttribute("logindto");%>
<!DOCTYPE html>
<html>
<head>
<!-- <META HTTP-EQUIV="refresh" CONTENT="10"> 10초마다 새로고침-->
<meta charset="UTF-8">
<title>자유게시판 상세보기</title>

<!-- include libraries(jQuery, bootstrap )-->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<!-- include summernote css/js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">


</head>
<body>

	<!-- header -->
	<%@ include file="../header.jsp"%>
<div class="container">
	<h2>자유게시판 상세보기</h2>
	<table class="table">
	
	

		<tr>
			<th>번호</th>
			<td>${dto.free_postnum }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${dto.free_regdate }</td>
		</tr>
		
		<tr>
			<th>작성자</th>
			<td>${dto.member_name }</td>
		</tr>
		<tr>
			<th>제   목</th>
			<td>${dto.free_title }</td>
		</tr>
		<tr  style="height: 30rem;">
			<th>내   용</th>
			<td colspan="6">${dto.free_content }</td>
		</tr>
			

		<tr>
			<td colspan="3" align="right">
					<input type="button" value=" 목록으로 " onclick="location.href='freeboard_list.do'" class="btn btn-outline-light">
					<c:choose>
					<c:when test="${logindto.member_id eq dto.member_id }">
					<input type="button" value=" 글수정 " onclick="location.href='freeboard_updateform.do?free_postnum=${dto.free_postnum }'" class="btn btn-outline-light">
					<%-- <input type="button" value=" 삭  제 " onclick="location.href='freeboard_delete.do?free_postnum=${dto.free_postnum }'"> --%>
					<input type="button" value=" 삭  제 " onclick="removeCheck()" class="btn btn-outline-light">
					</c:when>
					</c:choose>
			</td>
		</tr>	
	</table>
	
	
	<!-- 취소 alert -->
	<script type="text/javascript">
	function removeCheck(){
		if(confirm("정말 삭제하시겠습니까 ?? 삭제시 해당 모든 답글도 삭제 됩니다.") == true){    //확인
			location.href="freeboard_delete.do?free_postnum=${dto.free_postnum }";
			return true;

		}else{  //취소
			return false;
		}
	}

	</script>
	<br>
	<br>
	<br>
	
	<!---- 댓 글 ---------------------------------------------------------------------------------------------->
	
	<h3>&lt; 댓글보기 &gt;</h3>

			<div id="commtable">
				<table class="table">
					<col width="100">
					<col width="100">
					<col width="100">
					<col width="300">
					<col width="100">
					
					<c:forEach items="${cmt }" var="cmt">
						<tr id="comm_commTextF${cmt.com_num }">
							<th>작성자</th>				
							<td>${cmt.member_name }</td>
							<th>댓글</th>
							<td id="content${cmt.com_num }">${cmt.com_content }</td>
							<th>작성일</th>
							<td>${cmt.com_regdate }</td>
							<td colspan="2">
							<c:choose>
								<c:when test="${logindto.member_id eq cmt.member_id }">
								<input  type="button" value="수 정" onclick="commUpdateForm(${cmt.com_num})">
								<input  type="button" value="삭 제 " onclick="commdelete(${cmt.com_num})">
								<input type="hidden" id="comnum${cmt.com_num }" value="${cmt.com_num }">
								</c:when>
							</c:choose>
							</td>	
						</tr>
					</c:forEach>
					
				</table>
			</div>
			
			

	<br>
	<br>
	<br>
	
	
	
	<h2> Comment 쓰기</h2>
	<br>
	
	
	<!-- COM_NUM, FREE_POSTNUM, MEMBER_ID, MEMBER_NAME, COM_CONTENT, COM_CONTAB, COM_COMNO, COM_COMSQ, COM_REGDATE -->
	
	<input type="hidden" name="member_id" value="${logindto.member_id }" >
	<input type="hidden" name="free_postnum" value="${dto.free_postnum }" >

		<table class="table table-hover">
			
			<col width="100">
			<col width="100">
			<col width="100">
			
			<tr>
				<th>작성자</th>
				<td><input type="text" name="member_name" value="${logindto.member_name }" readonly="readonly"></td>
				<!-- <td><input type="text" name="member_name" value="ddd" readonly="readonly"></td> -->
			</tr>
			<tr>
				<th>댓글쓰기</th>
				<td><textarea row="300" cols="100" name="com_content" placeholder="댓글을 작성해 주세요"  ></textarea></td>
			</tr>
			<c:choose>
				<c:when test="${logindto.member_id ne null }">
					<tr align="right">
						<td colspan="2">
							<input type="button" value="저  장"  id="comminsert" class="btn btn-outline-light">
						</td>
					</tr>
				</c:when>
			</c:choose>
		</table>
	<br>
	<br>	
	

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>	

<script type="text/javascript">

	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			airMode : true,
			focus : true,
			lang : 'ko-KR'
		});
	});
	
$("#comminsert").click(function(){
// 	alert("comminsert 함수 실행");
	var com_content = document.getElementsByName("com_content")[0].value;
	var free_postnum = ${dto.free_postnum };
	
	if(com_content == ""){
		alert("댓글을 입력해주세요!");
	}else if(com_content != ""){
		$.ajax({
			url:"com_board_insert.do",
			type:"post",
			data:"com_content="+com_content+"&free_postnum="+free_postnum,
			dataType:"json",
			success:function(data){
				var list = data.list;
				$("#commtable").children('.table').remove();
				
				var tbl = $("<table class='table'>")
				var col1 = $("<col>").attr("width","100")
				var col2 = $("<col>").attr("width","100")
				var col3 = $("<col>").attr("width","100")
				var col4 = $("<col>").attr("width","300")
				var col5 = $("<col>").attr("width","100")
				tbl.append(col1);
				tbl.append(col2);
				tbl.append(col3);
				tbl.append(col4);
				tbl.append(col5);
				
				$.each(list, function(idx,val){
					var tr = $("<tr id='comm_commTextF"+val.com_num+"'>")
					var th1 = $("<th>")
					var th2 = $("<th>")
					var th3 = $("<th>")
					var td1 = $("<td>")
					var td2 = $("<td id='content"+val.com_num+"'>")
					var td3 = $("<td>")
					var td4 = $("<td>")
					var button = $("<input>").attr("type","button").attr("value","삭제").attr("onclick","commdelete("+val.com_num+")")
					var button2 = $("<input>").attr("type","button").attr("value","수정").attr("onclick","commUpdateForm("+val.com_num+")")
					
					button.addClass('btn btn-outline-light');
					button2.addClass('btn btn-outline-light');
					
					th1.append("작성자");
					td1.append(val.member_name);
					th2.append("내용");
					td2.append(val.com_content);
					th3.append("작성일");
					td3.append(val.com_regdate);
					
					if(val.member_id == '${logindto.member_id}'){
						td4.append(button2);
						td4.append(button);
					}
					tr.append(th1);
				   tr.append(td1);
				   tr.append(th2);
				   tr.append(td2);
				   tr.append(th3);
				   tr.append(td3);
				   tr.append(td4);
					
					tbl.append(tr);
				});
				$("#commtable").append(tbl);
				document.getElementsByName("com_content")[0].value="";
			},error:function(){
				alert("댓글을 입력해 주세요.");
			}
		});
	}
});

function commdelete(com_num){
	var free_postnum = ${dto.free_postnum };
	
	$.ajax({
		url:"com_board_delete.do",
		type:"post",
		data:"com_num="+com_num+"&free_postnum="+free_postnum,
		dataType:"json",
		success:function(data){
			var list = data.list;
			$("#commtable").children('.table').remove();
			
			var tbl = $("<table class='table'>")
			var col1 = $("<col>").attr("width","100")
			var col2 = $("<col>").attr("width","100")
			var col3 = $("<col>").attr("width","100")
			var col4 = $("<col>").attr("width","300")
			var col5 = $("<col>").attr("width","100")
			tbl.append(col1);
			tbl.append(col2);
			tbl.append(col3);
			tbl.append(col4);
			tbl.append(col5);
			
			$.each(list, function(idx,val){
				var tr = $("<tr id='comm_commTextF"+val.com_num+"'>")
				var th1 = $("<th>")
				var th2 = $("<th>")
				var th3 = $("<th>")
				var td1 = $("<td>")
				var td2 = $("<td id='content"+val.com_num+"'>")
				var td3 = $("<td>")
				var td4 = $("<td>")
				var button = $("<input>").attr("type","button").attr("value","삭제").attr("onclick","commdelete("+val.com_num+")")
				var button2 = $("<input>").attr("type","button").attr("value","수정").attr("onclick","commUpdateForm("+val.com_num+")")
				
				button.addClass('btn btn-outline-light');
				button2.addClass('btn btn-outline-light');
				
				th1.append("작성자");
				td1.append(val.member_name);
				th2.append("내용");
				td2.append(val.com_content);
				th3.append("작성일");
				td3.append(val.com_regdate);
				
				if(val.member_id == '${logindto.member_id}'){
					td4.append(button2);
					td4.append(button);
				}
				tr.append(th1);
			   tr.append(td1);
			   tr.append(th2);
			   tr.append(td2);
			   tr.append(th3);
			   tr.append(td3);
			   tr.append(td4);
				
				tbl.append(tr);
			});
			$("#commtable").append(tbl);
		},error:function(){
			alert("통신에러");
		}
	});
}
function commUpdate(com_num){
	var free_postnum = ${dto.free_postnum };
	var content = $("#updatecontent"+com_num+"").val();
	
	$.ajax({
		url:"com_board_update.do",
		type:"post",
		data:"com_num="+com_num+"&free_postnum="+free_postnum+"&com_content="+content,
		dataType:"json",
		success:function(data){
			
			var list = data.list;
			$("#commtable").children('.table').remove();
			
			var tbl = $("<table class='table'>")
			var col1 = $("<col>").attr("width","100")
			var col2 = $("<col>").attr("width","100")
			var col3 = $("<col>").attr("width","100")
			var col4 = $("<col>").attr("width","300")
			var col5 = $("<col>").attr("width","100")
			tbl.append(col1);
			tbl.append(col2);
			tbl.append(col3);
			tbl.append(col4);
			tbl.append(col5);
			
			$.each(list, function(idx,val){
				var tr = $("<tr id='comm_commTextF"+val.com_num+"'>")
				var th1 = $("<th>")
				var th2 = $("<th>")
				var th3 = $("<th>")
				var td1 = $("<td>")
				var td2 = $("<td id='content"+val.com_num+"'>")
				var td3 = $("<td>")
				var td4 = $("<td>")
				var button = $("<input>").attr("type","button").attr("value","삭제").attr("onclick","commdelete("+val.com_num+")");
				var button2 = $("<input>").attr("type","button").attr("value","수정").attr("onclick","commUpdateForm("+val.com_num+")");
				
				button.addClass('btn btn-outline-light');
				button2.addClass('btn btn-outline-light');
				
				td1.append(val.member_name);
				th2.append("내용");
				td2.append(val.com_content);
				th3.append("작성일");
				td3.append(val.com_regdate);
				
				if(val.member_id == '${logindto.member_id}'){
					td4.append(button2);
					td4.append(button);
				}
				tr.append(th1);
			   tr.append(td1);
			   tr.append(th2);
			   tr.append(td2);
			   tr.append(th3);
			   tr.append(td3);
			   tr.append(td4);
				
				tbl.append(tr);
			});
			$("#commtable").append(tbl);
		},error:function(){
			alert("통신에러");
		}
	});
}
function commUpdateForm(com_num){
	var content = $("#comm_commTextF"+com_num+"").children("#content"+com_num+"");
	var test = $("#content"+com_num).text();
	
	var td = $("<td>").attr("colspan","5")
	var td2 = $("<td>")
	var th = $("<th>")
	var td3 = $("<td>")
	var textarea = $("<textarea>").attr("cols","80").attr("id","updatecontent"+com_num+"")
	var button = $("<input>").attr("type","button").attr("value","수정").attr("onclick","commUpdate("+com_num+")")
	
	button.addClass('btn btn-outline-light');
	
	$("#comm_commTextF"+com_num+"").children().hide();
	
	textarea.append(test);
	th.append("작성자")
	td3.append("${logindto.member_id}")
	
	td.append(textarea);
	td2.append(button);
	$("#comm_commTextF"+com_num+"").append(th);
	$("#comm_commTextF"+com_num+"").append(td3);
	$("#comm_commTextF"+com_num+"").append(td);
	$("#comm_commTextF"+com_num+"").append(td2);
}
</script>	

	
	</div>
	
	<%@ include file="../footer.jsp"%>

</body>
</html>