<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 이벤트게시판 list </title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>



</head>
<!-- <script type="text/javascript">

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



 	 function allChk(bool){
		var chks = document.getElementsByName("event_chk");
		for(var i=0; i<chks.length; i++){
			chks[i].checked=bool;
		}
	}  

 </script> -->
 
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
			<td><input type="hidden" id="txt_search"
				value="${txt_search }"> <input type="hidden" 
				value="검색"  onclick="javascript:PageMove(${paging.pageNo})">
			</td>
		</tr>
	</table>
	
	<br>

	<c:choose>
		<c:when test="${empty eventboard_list }">
			<h3>고객 정보가 없습니다. ㅜ.ㅜ...</h3>
			<tr>
					<td colspan="3">===== 작성된 글이 없습니다 ====</td>
			</tr>
		</c:when>
		<c:otherwise>
			
				<table class="table table-hover">
	
					<col width = "1000"  />
					<col width = "100" />
					<col width = "100" />
					<col width = "100" />

					<!-- 	<th><input type="checkbox" name="allchk" onclick="allChk(this.checked)"></th> -->
					
					<!-- <th>번호</th>
						<th>작성자</th> -->
						<!-- <th>제목</th> -->
					<%-- 	<c:choose>
						<c:when test="${logindto.member_id ne null }">
						<th></th>
						</c:when>
						</c:choose> --%>
						
						<th>이벤트글(제목)</th>
						<!--나중에  조회수, 작성일은 는 관리자만 보이게 설정하기 8019-->
						<th>조회수</th>
						
						<c:choose>
						<c:when test="${logindto.member_id ne null }">
						<!-- <th>제목</th> -->
						<th>작성일</th>
						<th>관리자</th>
						</c:when>
						</c:choose>
						
					</tr>
					<c:forEach items="${eventboard_list }" var="dto">
						<tr>
							<%-- <td><input type="checkbox" name="event_chk" value="${dto.member_name} }"></td> --%>
							<!-- 체크삭제 관리자만보이기 -->	
						<%-- 	<c:choose>
							<c:when test="${logindto.member_id ne null }">
							<td><input type="checkbox" name="event_chk" value="${dto.event_postnum}"></td>
							</c:when>
							</c:choose> --%>
							<%-- <td>${dto.event_postnum }</td>
							<td>${dto.member_name }</td> --%>
							
							<td><a href="eventboard_detail.do?event_postnum=${dto.event_postnum }">${dto.event_title}</td>
							
							
							<td>${dto.event_views }</td>
							
							<!-- 관리자만 보이게 할계획 0819 -->
							
							<c:choose>
							<c:when test="${logindto.member_id ne null }">
							<%-- <td><a href="eventboard_detail.do?event_postnum=${dto.event_postnum }">${dto.event_title }</a></td> --%>
							<td>${dto.event_regdate }</td>
							<td><input type="button" value="수 정" onclick="location.href='eventboard_updateform.do?event_postnum=${dto.event_postnum }'">
							<input type="submit" value="삭 제"  onclick="location.href='eventboard_delete.do?event_postnum=${dto.event_postnum }'"></td>
							</c:when>
							</c:choose>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6">
							<c:choose>
							<c:when test="${logindto.member_id ne null }">
							<input type="button" value="글쓰기" onclick="location.href='eventboard_insertform.do'">
							</c:when>
							</c:choose>

						</td>
					</tr>
				</table>
			
		</c:otherwise>
	</c:choose>
	



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
</script>

	<!-- footer -->
  <%@ include file="../footer.jsp"%>
  
  
</body>
</html>