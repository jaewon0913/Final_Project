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



/* 	 function allChk(bool){
		var chks = document.getElementsByName("free_chk");
		for(var i=0; i<chks.length; i++){
			chks[i].checked=bool;
		}
	}  */

 </script>
 


 

</script>
<body>
	<!-- header -->
		<%@ include file="../header.jsp"%>

	<h1>자유 게시판</h1>

	<c:choose>
		<c:when test="${empty freeboard_list }">
			<h3>고객 정보가 없습니다. ㅜ.ㅜ...</h3>
		</c:when>
		<c:otherwise>
			<form action="freeboard_muldel.do" method="post" id="freeboard_muldel">
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
					<c:forEach items="${freeboard_list }" var="dto">
						<tr>
							<%-- <td><input type="checkbox" name="free_chk" value="${dto.member_name} }"></td> --%>
							<td><input type="checkbox" name="free_chk" value="${dto.free_postnum}"></td>
							<td>${dto.free_postnum }</td>
							<td>${dto.member_name }</td>
							<td><a href="freeboard_detail.do?free_postnum=${dto.free_postnum }">${dto.free_title }</a></td>
							<td>${dto.free_views }</td>
							<td>${dto.free_regdate }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6">
							<input type="button" value="처음으로" onclick="location.href='mainpage.do'"> 
							<c:choose>
							<c:when test="${logindto.member_id ne null }">
							<input type="button" value="글쓰기" onclick="location.href='freeboard_insertform.do'">
							</c:when>
							</c:choose>
							
							<input type="submit" value="삭제" >
							<%-- <input type="button" value="삭  제" onclick="location.href='freeboard_delete.do?free_postnum=${dto.free_postnum}'"> --%>
							
						
						</td>
					</tr>
				</table>
			</form>
		</c:otherwise>
	</c:choose>
	
	<br>
	<br>


                    
 <!-- footer -->
  <%@ include file="../footer.jsp"%>
</body>
</html>