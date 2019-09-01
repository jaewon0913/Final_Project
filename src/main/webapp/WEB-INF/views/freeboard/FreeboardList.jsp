<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   MemberDto logindto = (MemberDto) session.getAttribute("logindto");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 list</title>

</head>
<script type="text/javascript">

$(function(){
   $("#freeboard_muldel").submit(function(){
      if($("#freeboard_muldel input:checked").length==0){
         alert("한개이상 체크해주세요!!!");
      
         return false;
   
        }
    })
      var chk = 1;
      $("#freeboard_muldel input[name='free_chk']").on("click", function () {
         chk = 1;
         $("#freeboard_muldel input[name='free_chk']").each(function () {
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
         $("#freeboard_muldel input[name='free_chk']").each(function () {
            $(this).prop("checked", true);
         })
      }else {
         $("#freeboard_muldel input[name='free_chk']").each(function () {
               $(this).prop("checked", false);
            })
      }
      }



/*     function allChk(bool){
      var chks = document.getElementsByName("free_chk");
      for(var i=0; i<chks.length; i++){
         chks[i].checked=bool;
      }
   }  */

 </script>

<script type="text/javascript">
   function PageMove_free(page, data) {
      location.href = "freeboard_list.do?page=" + page + "&txt_search=" + $('input#txt_search').val();   
   }

</script>
<style type="text/css">
td>a {
	color: black;
}

td>a:hover {
	color: gray;
}
</style>
<body>
	<!-- header -->
	<%@ include file="../header.jsp"%>
	<div class="container">
		<br>
		<div class="container col-sm-12 text-center ">
			<table class="pull-right">
				<tr>
					<td colspan="5">
						<input type="text" id="txt_search" value="${txt_search }"> 
						<input type="button" class="btn btn-outline-light" value="검색" onclick="javascript:PageMove_free(${paging.pageNo})">
					</td>
				</tr>
			</table>
			<br>

			<c:choose>
				<c:when test="${empty freeboard_list }">
					<c:choose>
						<c:when test="${logindto.member_id ne null}">
							<input type="button" value="글쓰기" onclick="location.href='freeboard_insertform.do'" class="btn btn-outline-light">
						</c:when>
					</c:choose> 
				</c:when>
				<c:otherwise>
					<form action="freeboard_muldel.do" method="post"
						id="freeboard_muldel">
						<table class="table table-hover">
							<tr>
								<th><input type="checkbox" name="allchk"
									onclick="allChk(this.checked)"></th>
								<th>번호</th>
								<th>작성자</th>
								<th>제목</th>
								<th>조회수</th>
								<th>작성일</th>
							</tr>
							<c:choose>
								<c:when test="${empty freeboard_list }">
									<!-- 사용여부결정해야함 0810 -->
									<tr>
										<td colspan="3">--글을 작성해 주세요--</td>
									</tr>
									<c:choose>
										<c:when test="${logindto.member_id eq 'admin'}">
											<input type="button" value="글쓰기" onclick="location.href='freeboard_insertform.do'" class="btn btn-outline-light">
										</c:when>
									</c:choose>
									
									<c:choose>
										<c:when test="${logindto.member_id eq 'admin'}">
										<tr>
											<td>
												<input type="button" value="글쓰기" onclick="location.href='freeboard_insertform.do'" class="btn btn-outline-light">
											</td>
										</tr>
										</c:when>
									</c:choose>
									
								</c:when>
								<c:otherwise>
									<c:forEach items="${freeboard_list }" var="dto">
										<tr>
											<%-- <td><input type="checkbox" name="free_chk" value="${dto.member_name} }"></td> --%>
											<td><input type="checkbox" name="free_chk"
												value="${dto.free_postnum}"></td>
											<td>${dto.free_postnum }</td>
											<td>${dto.member_name }</td>
											<td><a
												href="freeboard_detail.do?free_postnum=${dto.free_postnum }">${dto.free_title }</a></td>
											<td>${dto.free_views }</td>
											<td>${dto.free_regdate }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>

							<tr>
								<td colspan="6" align="right">
								<input type="button" value="처음으로" onclick="location.href='mainpage.do'"
									class="btn btn-outline-light"> 
									
									
									<c:choose>
										<c:when test="${logindto.member_id ne null }">
											<input type="button" value="글쓰기" onclick="location.href='freeboard_insertform.do'" class="btn btn-outline-light">
										</c:when>
										<c:when test="${logindto.member_id eq 'admin'}">
											<input type="button" value="글쓰기" onclick="location.href='freeboard_insertform.do'" class="btn btn-outline-light">
											<input type="submit" value="삭제" onclick="removeChk()" class="btn btn-outline-light">
										</c:when>
									</c:choose> <!-- 취소를 선택해도 삭제됨 --> <%-- <input type="button" value="삭  제" onclick="location.href='freeboard_delete.do?free_postnum=${dto.free_postnum}'"> --%>


								</td>
							</tr>
						</table>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<br>
	<br>




	<%--    <table>
      <tr>
         <td colspan="5"><input type="text" id="txt_search"
            value="${txt_search }"> <input type="button" class="small"
            value="검색" onclick="javascript:PageMove(${paging.pageNo})">
         </td>
      </tr>
   </table> --%>



	<!-- Pagination -->
	<div class="container text-center "
		style="font-size: 3rem; margin-bottom: 5rem;">
		<span> <a
			href="javascript:PageMove_free(${paging.firstPageNo})" class="page">&laquo;</a>
			<a href="javascript:PageMove_free(${paging.prevPageNo})" class="page">&lt;</a>
			<c:forEach var="i" begin="${paging.startPageNo}"
				end="${paging.endPageNo}" step="1">
				<c:choose>
					<c:when test="${i eq paging.pageNo}">
						<a href="javascript:PageMove_free(${i})" class="page">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:PageMove_free(${i})" class="page">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach> <a href="javascript:PageMove_free(${paging.nextPageNo})"
			class="page">&gt;</a> <a
			href="javascript:PageMove_free(${paging.finalPageNo})" class="page">&raquo;</a>
		</span>
	</div>
	<!-- /Pagination -->





	<!-- 8.9 취소해도 삭제된 오류 수정해야 됩니다. -->
	<!-- check 취소 alert -->
	<script type="text/javascript">
   function removeChk(){
      if(confirm("정말 정말~~ 삭제하시겠습니까 ??") == true){    //확인
         /* location.href="freeboard_delete.do?free_postnum=${dto.free_postnum }"; */
         
      }else {  //취소
         return false;
      }
   }
   </script>
	<!-- footer -->
	<%@ include file="../footer.jsp"%>
</body>
</html>