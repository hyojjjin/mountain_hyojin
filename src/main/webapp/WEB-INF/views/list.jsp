<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" data-auto-replace-svg="nest"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/resources/css/font.css">
<link rel="stylesheet" type="text/css" href="${root }/resources/css/mountain/list.css">
<script>
var result = '${result}';
var src = '${root }/resources/img/mountain/';

var isManager = ('${authUser.manager}' == 1);
var available = '${available}';
</script>
<script src="${root }/resources/js/mountain/list.js"></script>

<script>

$(document).ready(function() {
	$("#submitWish").click(function(e) {
		var mountain = $("#mountainNo").val();
		var user = $("#mountainNo").val();
		$.ajax({
			type: "get",
			url: "/mountain/wish/register",
			data: {mountain:, user:}
		}).done(function(data) {	
		}).fail(function() {
			
		});		
		
	})
	
	
});
</script>

<title>산산산</title>
</head>
<body>
<div class="container-fluid my-5">
	<div class="row">
<!-- 		<div class="col-12 col-sm-8 offset-sm-2"> -->
		<div class="col-12 col-md-8 offset-md-2">  
      		<h3 class="text-center">산산산들</h3>
      		<br>
      		<form id="search" class="d-flex justify-content-end align-items-center">
      			<input class="form-control mr-sm-1" type="search" name="keyword" value="${pages.cri.keyword }" placeholder="Search">
		    	<button class="btn btn-outline-success my-2 mr-5"><i class="fas fa-search"></i></button>
		    	<a href="${root }/register" id="newMountain" class="btn btn-outline-success ml-5">산 등록</a>
      		</form>

	      	<table>
	      		<tbody>
	      		  <c:forEach var="mountain" items="${list}" varStatus="status">
	       			<c:if test="${status.count % 3 == 1 }"> 
						<tr>
		          	</c:if>

		        	<td>
						<div class="card">
						
						 <%--
		                 	<img src="${root }/resources/img/mountain/${mountain.mname}.jpg" class="card-img-top" 
		                 		alt="${mountain.mname }" onerror="this.src = '${root }/resources/img/mountain/default.png';">
						  --%>
						 	<c:choose>
							    <c:when test="${empty mountain.filename }">
									<c:set var="src" value="${root }/resources/img/mountain/default.png" />
							    </c:when>
							    <c:otherwise>
							    	<c:set var="src" value="${staticPath }/${mountain.filename}" />
							    </c:otherwise>
							</c:choose>
		                 	<img src="${src }" class="card-img-top img-fluid" alt="${mountain.filename }">	
		                 		
		                 	<div class="card-body">
		                 		<h4 class="card-title">${mountain.mname }</h4>
		                 		<p class="card-text">${mountain.mloc }에 있는 해발고도 ${mountain.height }m의 산</p>
		                 		<c:url var="getUrl" value="/get">
					    		  <c:param name="no" >${mountain.no}</c:param>
					    		  <c:param name="curPage">${cri.curPage }</c:param>
					    		  <c:param name="amount">${cri.amount }</c:param>
					    		  <c:param name="keyword">${cri.keyword }</c:param>
					    	    </c:url>
		                		<a href="${getUrl }" class="btn btn-success">Go Into Detail</a>
		                		<input type="hidden" value="${authUser.no }" id="userNo">
		                		<input type="hidden" value="${mountain.no}" id="mountainNo">
		                		<button type="submit" class="btn btn-primary" id="submitWish" >찜</button>
		               		</div>
	              		</div>
		        	</td>
			      
			        <c:if test="${status.count % 3 == 0 }">
						</tr>
			        </c:if>
			      </c:forEach>
				</tbody>
			</table>
			
			<!-- 페이지네이션 처리 -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <c:if test="${not pages.prev }"><c:set var="prevDisabled" value="disabled" /></c:if>
			    <li class="page-item ${prevDisabled }">
			      <c:url var="prevUrl" value="/list">
		    		<c:param name="curPage">${pages.startPage-1 }</c:param>
		    		<c:param name="amount">${cri.amount }</c:param>
		    		<c:param name="keyword">${cri.keyword }</c:param>
		    	  </c:url>
			      <a class="page-link" href="${prevUrl }">Previous</a>
			    </li>
			    
			    <c:forEach var="page" begin="${pages.startPage }" end="${pages.endPage }">
			    	<c:url var="pageUrl" value="/list">
			    		<c:param name="curPage">${page }</c:param>
			    		<c:param name="amount">${cri.amount }</c:param>
			    		<c:param name="keyword">${cri.keyword }</c:param>
			    	</c:url>
			    	<c:if test="${page eq cri.curPage }"><c:set var="active" value="active" /></c:if>
				    <li class="page-item ${active }"><a class="page-link" href="${pageUrl }">${page }</a></li>			    
				    <c:remove var="active"/>
			    </c:forEach>
					    
				<c:if test="${not pages.next }"><c:set var="nextDisabled" value="disabled" /></c:if>
			    <li class="page-item ${nextDisabled }">
			      <c:url var="nextUrl" value="/list">
		    		<c:param name="curPage">${pages.endPage+1 }</c:param>
		    		<c:param name="amount">${cri.amount }</c:param>
		    		<c:param name="keyword">${cri.keyword }</c:param>
		    	  </c:url>
			      <a class="page-link" href="${nextUrl }">Next</a>
			    </li>
			  </ul>
			</nav>
		
		</div>
	</div>
</div>
<%-- 삭제 성공 결과 삭제 --%>
<c:remove var="result"/>
<%-- 접근 금지 결과 삭제 --%>
<c:remove var="available"/>
</body>
</html>