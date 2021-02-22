<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="m" tagdir="/WEB-INF/tags"%>


<!-- <style>
#navbarSupportedContent li {
 	margin-left: 35px;
	margin-right: 35px;
}
	border-left: 10px solide #c0c0c0; // border 안됨
</style> -->

<style>
#navbarSupportedContent ul {
	padding-left:0px;
}

#navbarSupportedContent li  {
	font-size: 20px;
	display:inline;
	padding:0px 10px 0px 10px;
	margin:0px 50px 0px 50px;
	}
</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="collapse navbar-collapse" id="navbarSupportedContent1">
	
		  <c:if test="${empty sessionScope.authUser }">
			 <ul class="navbar-nav ml-auto">
			      <li class="nav-item">
			       <a class="nav-link" href="${root }/member/join">회원가입</a>
			      </li>
			      <li class="nav-item">
			       <a class="nav-link" href="${root }/member/login">로그인</a>
			      </li>
			      <li class="nav-item">
			       <a class="nav-link" href="${root }/admin/index">관리자 페이지</a>
			      </li>
			</ul>
		  </c:if>
		  
		   <c:if test="${not empty sessionScope.authUser }">
		     <ul class="navbar-nav ml-auto">
		    	 <li class="nav-item">
		      		 <a class="nav-link" href="${root }/member/myHome">마이홈</a>
		   		 </li>
		     
		   		 <li class="nav-item">
		    		<a class="nav-link" href="${root }/member/logout">로그아웃</a>
		    	 </li>
		    </ul>
	    </c:if>
	</div>
</nav>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="collapse navbar-collapse ml-5" id="navbarSupportedContent2">
		<a class="navbar-brand" href="${root }/index.jsp">
			<img src="<spring:url value='/resources/img/mountainLogo.png' />" class="center-block mb-3" height="170" width="auto" alt="마운팀">
		</a>
		
<!-- 		<form class="form-inline ml-5">
		    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
		    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form> -->
 	<m:search />
	</div>
</nav> 

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse d-flex justify-content-around" id="navbarSupportedContent">
		<ul class="navbar-nav ">
			<li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle" href="${root }/list" id="navbarDropdown" role="button"
		        		 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		        	 <b>산게시판</b>
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		    	    <a class="dropdown-item" href="${root }/list">전체보기</a>
		       		<div class="dropdown-divider"></div>
			        <a class="dropdown-item" href="#">지역1</a>
			        <a class="dropdown-item" href="#">지역2</a>
			        <a class="dropdown-item" href="#">지역3</a>
		        </div>
			</li>
	  	    <li class="nav-item">
	       		<a class="nav-link" href=""><b>산 축제</b></a>
	   	  	</li>
	  	    <li class="nav-item">
	       		<a class="nav-link" href=""><b>산 명소</b></a>
	   	  	</li>
	  	    <li class="nav-item">
	       		<a class="nav-link" href="${root }/restaurant/list"><b>맛집게시판</b></a>
	   	  	</li>
	      	<li class="nav-item">
	       		<a class="nav-link" href="${root }/freeboard/list"><b>자유게시판</b></a>
	    	</li>
	    	<li class="nav-item">
	        	<a class="nav-link" href="${root }/notice/list"><b>공지사항</b></a>
	     	</li>
		</ul>
	</div>
</nav>