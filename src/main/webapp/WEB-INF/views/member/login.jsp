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
		
		$('#idNull').hide();
		$('#pwNull').hide();
		
		$("#loginButton").click(function() {
			$('#idNull').hide(); 
			$('#pwNull').hide();
			
	//	e.preventDefault(); submit 버튼의 기본 기능(submit) 을 막음!
		var inputId = $('#inputId').val();
		var inputPw = $('#inputPw').val();
			
		if (inputId == '') {
			$('#idNull').show();
		}
		
		if (inputPw == '') {
			$('#pwNull').show();
		}
		
		if (inputId == '' || inputPw == '') {
			return;
		} else {
			$('#idNull').hide();
			$('#pwNull').hide();
		}
		
			$.ajax("/mountain/member/login", {
				type: "post",
				data: {inputId:inputId, inputPw:inputPw}
			
			}).fail(function() {
				console.log("등록 실패");

					 alert("아이디 또는 비밀번호를 확인해주세요.");
				
			}).done(function(data, status, xhr) {
				console.log("등록 성공");
			});
		});  
    });
</script>

<title>산산산</title>
</head>
<body>

<m:topNav />

  <div class="form-group row">
    <label for="inputId" class="col-sm-2 col-form-label">아이디</label>
    <div class="col-sm-10">
      <input type="text" name="id" class="form-control" id="inputId" >
 	<span class="form-text" style="color: tomato" id="idNull" >
 			아이디를 입력해주세요.
    </span>
    </div>

  </div>
  
  <div class="form-group row">
    <label for="inputPw" class="col-sm-2 col-form-label">비밀번호</label>
    <div class="col-sm-10">
      <input type="password" name="password" class="form-control" id="inputPw" >
   	  <span class="form-text" style="color: tomato" id="pwNull" >
      		비밀번호를 입력해주세요.
  	  </span>
    </div>
  </div>
  
   <button class="btn btn-primary" id="loginButton" >로그인</button>
  

</body>
</html>