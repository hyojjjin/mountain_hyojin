<%@ tag language="java" pageEncoding="UTF-8"%>

<script>
//ajax로 controller에 데이터 넘겨주기
$(document).ready(function() {
	$("#searchButton").click(function(e) {
		e.preventDefault();
		console.log("serch");
		console.log($("#select").val());
		if ($("#select").val()=='산') {
			console.log("if");
			var keyword = $("#search").val();
			window.location.href="/mountain/list?type=" + type + "&keyword=" + keyword + "&pageNo=1&amount=5";
			//mountain 키워드 확인
			
/* 			$.ajax({
				type: "get",
				url: "/mountain/list",
				data: {keyword:keyword}
				
			});  */
		} else if($("#select").val()=='맛집'){
			console.log("else");
				var type="M";
				//var type="MNLFD";
				var keyword = $("#search").val();
					window.location.href="/mountain/restaurant/list?type=" + type + "&keyword=" + keyword + "&pageNo=1&amount=5";
					//ajax 상관없이 이동이 된다구..?
							
				/* $.ajax({
					type: "get",
					url: "/mountain/restaurant/list",
					data: {type:type, keyword:keyword}
							
				}).done(function(data) {
					console.log("맛집 찾기 성공패")
				//	window.location.href="/mountain/restaurant/list?type=" + type + "&keyword=" + keyword 
				}).fail(function() {
					console.log("맛집 찾기 실패")
					
				}); */
		}
	});
});


</script>


<!-- <style>
	#search {
		border-radius: 30px 30px 30px 30px;
	}

</style> -->

<div class="container">
 		<form class="form-inline ml-5">
			<select class="form-control" id="select">
			  <option>산</option>
			  <option>맛집</option>
			  <option>공지</option>
			</select>
	
		    <input class="form-control mr-sm-2" type="search" name="search" id="search" placeholder="Search" aria-label="Search">
		    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="searchButton">Search</button>
		</form> 
</div>