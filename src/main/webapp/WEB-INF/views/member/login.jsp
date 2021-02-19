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


<script type="text/javascript" src="${root }/resources/js/member/login.js"></script>

<title>산산산</title>
</head>
<body>

<m:topNav />

로그인 된 아이디 : ${authUser.id } <br>
로그인 된 NO : ${authUser.no }
<form name="loginForm">

	<c:if test="${notFoundUser }">
		<small class="form-text" style="color: tomato" >
 			일정 시간이 지나 로그아웃 되었습니다. 다시 로그인을 해주세요.
    	</small>
	</c:if>

  <div class="form-group row">
    <label for="inputId" class="col-sm-2 col-form-label">아이디</label>
    <div class="col-sm-10">
      <input type="text" name="id" class="form-control" id="inputId" >
 	<small class="form-text" style="color: tomato" id="idNull" >
 			아이디를 입력해주세요.
    </small>
    </div>

  </div>
  
  <div class="form-group row">
    <label for="inputPw" class="col-sm-2 col-form-label">비밀번호</label>
    <div class="col-sm-10">
      <input type="password" name="password" class="form-control" id="inputPw" >
   	  <small class="form-text" style="color: tomato" id="pwNull" >
      		비밀번호를 입력해주세요.
  	  </small>
    </div>
  </div>
  
   <button class="btn btn-primary" id="loginButton" >로그인</button>

	<!-- ##로그인 실패 - 모달
	<div class="modal fade" id="#loginFailModal" tabindex="-1"
		aria-labelledby="#loginFailModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ModalTitle">로그인 실패</h5>
					<button id="loginFailCancel1" type="button" class="close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
       			 	<p>로그인이 실패하였습니다. 아이디 또는 비밀번호를 확인해주세요</p>
     			</div>
     			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="memberDelete"
					data-dismiss="modal" id="loginFailCancel1">확인</button>
			</div>
		</div>
	</div> -->
	
</form>	
</body>
</html>