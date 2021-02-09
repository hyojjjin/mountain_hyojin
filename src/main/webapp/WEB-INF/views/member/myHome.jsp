<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="m" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script>
$(document).ready(function() {
	
		$('#errorPw').hide();

	
	$("#memberDelete").click(function() {
	//모달창을 띄우고 비밀번호 확인이 맞으면
	//비밀번호 확인은 controller에서 함.	
		var userId = $(this).attr("data-userId"); //attribute 값
		var pwConfirm = $('#pwConfirm').val(); //value값
		//변수에 원하는 값을 넣어준다.
	
		$.ajax("/mountain/member/delete?" + $.param({userId: userId, pwConfirm:pwConfirm}), { //경로
			method: "delete" //메소드 방법(controller에서 deleteMapping으로 표시)
			//data:{id: userId, pw:pwConfirm}로 보내줬을때 읽어오질 못함
			//=> delete 방식으로 보냈을때, delete는 body가 없기 때문에 요청이 오류, 거절이 일어날 수 있다.
			//=> 해결 : 파라미터로 값을 붙여서 보내주자!
			
		}).fail(function() {
			console.log("삭제 실패");
			 //왜 삭제 실패로 나오지????
			//	$('#errorPw').show();
		//	 $('#memberDeleteModal').hide(); // 왜 마음대로야,,
		//	 $('#memberDelete').attr("data-dismiss", modal); // 왜 마음대로야,,
		}).done(function() {
			console.log("삭제 완료");
			$('#errorPw').show(); // 왜 삭제 완료에서 뜨는거야?????!!
			
		});
	});
});
</script>


<title>Insert title here</title>
</head>
<body>
<m:topNav />

<!--내 정보 보기 -->
<form>
  <div class="form-group row">
    <label for="staticId" class="col-sm-2 col-form-label">아이디</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticId" value="${sessionScope.authUser.id }">
    </div>
  </div>
  <div class="form-group row">
    <label for="staticPassword" class="col-sm-2 col-form-label">비밀번호</label>
    <div class="col-sm-10">
      <input type="password" readonly class="form-control-plaintext" id="staticPassword" value="${sessionScope.authUser.name }">
  </div>
  </div>
  <div class="form-group row">
    <label for="staticName" class="col-sm-2 col-form-label">이름</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticName" value="${sessionScope.authUser.name }">
    </div>
 
  </div>
  <div class="form-group row">
    <label for="staticNickname" class="col-sm-2 col-form-label">닉네임</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticNickname" value="${sessionScope.authUser.nickname }">
    </div>
  </div>
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">이메일</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${sessionScope.authUser.email }">
    </div>
  </div>
  <div class="form-group row">
    <label for="staticLoc" class="col-sm-2 col-form-label">주소</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticLoc" value="${authUser.loc }">
    </div>
  </div>

</form>

<h3>산킷리스트</h3>


	<!-- ##수정 버튼 -->
	<a href="${root }/member/myModify">
		<button type="submit" class="btn btn-primary">회원 정보 수정</button>
	</a>
	
<%-- 	<!-- ##탈퇴 버튼 -->
	<a href="/member/delete">
		<button type="submit" id="memberDelete" class="btn btn-primary" data-userId="${authUser.id }">회원 탈퇴</button>
	</a> --%>
	
<!-- ##탈퇴 버튼 - 모달 -->
<button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#memberDeleteModal" data-whatever="@mdo">회원 탈퇴 모달</button>
//#은 아래 모달창을 참조한다는 것!
//@는 뭐지?

<div class="modal fade" id="memberDeleteModal" tabindex="-1" aria-labelledby="memberDeleteModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalTitle">진심이세요?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span> //이건 모야? 아! x표시다!!
        </button>
      </div>
      
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="pwConfirm" class="col-form-label">비밀번호를 입력하세요.</label>
            <input type="password" class="form-control" id="pwConfirm">
          		<span class="form-text" style="color: tomato" id="errorPw" >
      				비밀번호를 확인해주세요.
      			</span>
          </div>
          
          //비밀번호 확인해야함
          
          <div class="form-group">
      
      -------------<br>
      	// ##탈퇴 이유 - 나중에 없애도됨!
         <br>
            <label for="message-text" class="col-form-label">탈퇴하는 이유가 무엇인가요?</label>
            <br>
          <select id="select">
         	   <option value="" disabled selected>홈페이지 개선에 도움을 주세요.</option>
	            <option value="그냥1" id="go1">그냥1</option>
	            <option value="그냥그냥2" id="go2">그냥그냥2</option>
	            <option value="그냥그냥그냥3" id="go3">그냥그냥그냥3</option>
	            <option value="directly" id="go4">직접 입력하기</option>
	      </select>
	      
	      
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        //data-dismiss 모달 닫기 속성
        
        <button type="button" class="btn btn-primary" id="memberDelete" data-userId="${authUser.id }">탈퇴</button>
        
      </div>
    </div>
  </div>
</div>


</body>
</html>