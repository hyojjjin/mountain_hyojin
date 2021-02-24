<%@ tag language="java" pageEncoding="UTF-8"%>

<script>
$(document).ready(function() {	
	//산 keyword를 받았을 때 산 keyword 넣고
	
	//검색 기능
	$("#searchButton").click(function(e) {
		e.preventDefault();
		console.log("serch");
		console.log($("#select-search").val());
		if ($("#select-search").val()=='산') {
			console.log("산");
			var keyword = $("#search").val();
			window.location.href="/mountain/list?&keyword=" + keyword;
			
			
		} else if($("#select-search").val()=='맛집'){
			console.log("맛집");
				var type="MNLFD";
				//var type="MNLFD";
				var keyword = $("#search").val();
				window.location.href="/mountain/restaurant/list?type=" + type + "&keyword=" + keyword;
		}	else if($("#select-search").val()=='공지'){
			console.log("공지");
			//var type="MNLFD";
			var keyword = $("#search").val();
			window.location.href="/mountain/notice/list?&keyword=" + keyword;
		}
	});
	
	//select-search값 남기기
	function() {
		
		
	}	
	
/* 	만약 산이라면 산
	만약 맛집이라면 맛집
	만약 공지라면 공지
	 */
});


</script>


<!-- <style>
	#search {
		border-radius: 30px 30px 30px 30px;
	}

</style> -->

<div class="container">
 		<form class="form-inline justify-content-center ml-5">
			<select class="form-control" id="select-search">
			  <option id="m">산</option>
			  <option id="r">맛집</option>
			  <option id="n">공지</option>
			</select>
			
		    <input class="form-control mr-sm-2" type="search" name="search" value="${page.cri.keyword }${pages.cri.keyword}" id="search" placeholder="Search" aria-label="Search">
		    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="searchButton"><i class="fas fa-search"></i></button>
		<!-- 	
		    	<input class="form-control mr-sm-1" type="search" name="search" placeholder="Search">
		    	<button class="btn btn-outline-success my-2 mr-5"><i class="fas fa-search"></i></button> -->
		</form> 
</div>