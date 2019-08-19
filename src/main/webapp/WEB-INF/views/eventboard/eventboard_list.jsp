<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% MemberDto logindto = (MemberDto) session.getAttribute("logindto");%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 이벤트게시판 list </title>
</head>
<script type="text/javascript">

$(function(){
	$("#eventboard_muldel").submit(function(){
		if($("#eventboard_muldel input:checked").length==0){
			alert("한개이상 체크해주세요!!!");
		
			return false;
	
        }
    })
		var chk = 1;
		$("#eventboard_muldel input[name='event_chk']").on("click", function () {
			chk = 1;
		   $("#eventboard_muldel input[name='event_chk']").each(function () {
		      if ($(this).prop("checked") == false) {
		    	  chk = 0;
		      }
		   })
		   if (chk == 0) {
		      $("input[name='allchk']").prop("checked", false);
		   } else if (chk == 1) {
		      $("input[name='allchk']").prop("checked", true);
		   }
		})
		})
		
		function allChk(check) {
		if (check) {
		   $("#eventboard_muldel input[name='event_chk']").each(function () {
		      $(this).prop("checked", true);
		   })
		}else {
			$("#eventboard_muldel input[name='event_chk']").each(function () {
			      $(this).prop("checked", false);
			   })
		}
		}



/* 	 function allChk(bool){
		var chks = document.getElementsByName("event_chk");
		for(var i=0; i<chks.length; i++){
			chks[i].checked=bool;
		}
	}  */

 </script>
 
<script type="text/javascript">
	function PageMove(page, data) {
		location.href = "eventboard_list.do?page=" + page + "&txt_search=" + $('input#txt_search').val();
		
	
	}

</script>

 


<body>
	<!-- header -->
		<%@ include file="../header.jsp"%>

	<h1>이벤트 게시판</h1>
	<br>
		<table>
		<tr>
			<td colspan="5"><input type="text" id="txt_search"
				value="${txt_search }"> <input type="button" class="small"
				value="검색"  onclick="javascript:PageMove(${paging.pageNo})">
			</td>
		</tr>
	</table>
	<br>

	<c:choose>
		<c:when test="${empty eventboard_list }">
			<h3>고객 정보가 없습니다. ㅜ.ㅜ...</h3>
			<!-- 사용여부결정해야함 0810 -->
			<tr>
					<td colspan="3">===== 작성된 글이 없습니다 ====</td>
			</tr>
		</c:when>
		<c:otherwise>
			<form action="eventboard_muldel.do" method="post" id="eventboard_muldel">
				<table class="table table-hover">
					<col width = "30" />
					<col width = "50" />
					<col width = "200" />
					<col width = "500" />
					<col width = "70" />
					<col width = "100" />
					<tr>
						<th><input type="checkbox" name="allchk" onclick="allChk(this.checked)"></th>
						<th>번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
					<c:forEach items="${eventboard_list }" var="dto">
						<tr>
							<%-- <td><input type="checkbox" name="event_chk" value="${dto.member_name} }"></td> --%>
							<td><input type="checkbox" name="event_chk" value="${dto.event_postnum}"></td>
							<td>${dto.event_postnum }</td>
							<td>${dto.member_name }</td>
							<td><a href="eventboard_detail.do?event_postnum=${dto.event_postnum }">${dto.event_title }</a></td>
							<td>${dto.event_views }</td>
							<td>${dto.event_regdate }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6">
							<input type="button" value="처음으로" onclick="location.href='mainpage.do'"> 
							<c:choose>
							<c:when test="${logindto.member_id ne null }">
							<input type="button" value="글쓰기" onclick="location.href='eventboard_insertform.do'">
							</c:when>
							</c:choose>
							
							<!-- 취소를 선택해도 삭제됨 -->
							<input type="submit" value="삭제"  onclick="removeChk()" >
							<%-- <input type="button" value="삭  제" onclick="location.href='eventboard_delete.do?event_postnum=${dto.event_postnum}'"> --%>
							
						
						</td>
					</tr>
				</table>
			</form>
		</c:otherwise>
	</c:choose>
	
	<!-- 8.9 취소해도 삭제된 오류 수정해야 됩니다. -->
	<!-- check 취소 alert -->
	<script type="text/javascript">
	function removeChk(){
		if(confirm("정말 정말~~ 삭제하시겠습니까 ??") == true){    //확인
			/* location.href="eventboard_delete.do?event_postnum=${dto.event_postnum }"; */
			
		}else {  //취소
			return false;
		}
	}

	
	
	</script>
	<br>
	<br>

	
	

<%-- 	<table>
		<tr>
			<td colspan="5"><input type="text" id="txt_search"
				value="${txt_search }"> <input type="button" class="small"
				value="검색" onclick="javascript:PageMove(${paging.pageNo})">
			</td>
		</tr>
	</table> --%>



	<!-- Pagination -->
	<div class="pagination">
		<a href="javascript:PageMove(${paging.firstPageNo})"
			class="button previous">&laquo;</a> <a
			href="javascript:PageMove(${paging.prevPageNo})"
			class="button previous">&lt;</a>
		<div class="pages">
			<c:forEach var="i" begin="${paging.startPageNo}"
				end="${paging.endPageNo}" step="1">
				<c:choose>
					<c:when test="${i eq paging.pageNo}">
						<a href="javascript:PageMove(${i})" class="active">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:PageMove(${i})">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<a href="javascript:PageMove(${paging.nextPageNo})"
			class="button next">&gt;</a> <a
			href="javascript:PageMove(${paging.finalPageNo})" class="button next">&raquo;</a>
	</div>

	





	<!-- footer -->
  <%@ include file="../footer.jsp"%>
</body>
</html>