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

<script type="text/javascript" src="${root }/resources/js/member/myHome.js"></script>

<title>산산산</title>
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
      <input type="text" readonly id="emailFront" value="${emailDTO.emailFront }" > 
 	  <span>@</span>
	  <input type="text" readonly id="emailSelect" value="${emailDTO.emailSelect }" > 
    </div>
  </div>
  
  
  <div class="form-group row">
    <label for="staticLoc" class="col-sm-2 col-form-label">주소</label>
    <div class="col-sm-10">
      <input type="hidden" readonly class="form-control-plaintext" id="staticLoc" value="${authUser.loc }">
      <input type="text" id="sample3_postcode" placeholder="우편번호" value="${locDiv.postcode }"><br>
  	  <input type="text" id="sample3_address" placeholder="주소" value="${locDiv.address }"><br>
	  <input type="text" id="sample3_detailAddress" placeholder="상세주소" value="${locDiv.detailAddress }">
	  <input type="text" id="sample3_extraAddress" placeholder="참고항목" value="${locDiv.extraAddress }">
    </div>
  </div>

</form>

<form method="post" action="/mountain/wish/register.do">
	<h3>산킷리스트 삽입 예정</h3>
</form>



	<!-- ##수정 버튼 -->
	<a href="/mountain/member/myModify">
		<button type="submit" class="btn btn-primary">회원 정보 수정</button>
	</a>	
	
	
	<!-- ##탈퇴 버튼 - 모달 -->
	<button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#memberDeleteModal" data-whatever="@mdo">회원 탈퇴 모달</button>

	<div class="modal fade" id="memberDeleteModal" tabindex="-1" aria-labelledby="memberDeleteModal" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="ModalTitle">탈퇴하시겠습니까??</h5>
	        <button id="memberDeleteCancel1" type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form>
	          <div class="form-group">
	            <label for="pwConfirm" class="col-form-label">비밀번호 확인</label>
	            <input type="password" class="form-control" id="pwConfirm">
	          		<small class="form-text" style="color: tomato" id="pwError">
	      				비밀번호가 일치하지 않습니다.
	      			</small>
	      			<small class="form-text" style="color: tomato" id="pwNull">
	      				비밀번호를 입력해주세요.
	      			</small>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="memberDeleteCancel2">취소</button>        
	        <button type="button" class="btn btn-primary" id="memberDelete" data-userId="${authUser.id }">탈퇴</button>
	      </div>
	    </div>
	  </div>
	</div>
	<div class="modal fade" id="memberDeleteSuccessModal" tabindex="-1" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="ModalTitle">탈퇴되었습니다.</h5>
	      </div>
	      <div class="modal-body">
			<span class="form-text">
	      		정상적으로 탈퇴되었습니다.
	      	</span>
	      </div>
	      <div class="modal-footer">
	        <a href="${root }/index.jsp">
	        	<button type="button" class="btn btn-secondary">닫기</button>
	        </a>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>