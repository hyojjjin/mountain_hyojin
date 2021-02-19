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

<script type="text/javascript" src="${root }/resources/js/member/join.js"></script>

<title>산산산</title>
</head>
<body>

<m:topNav />

<form id="joinForm1" method="post">
  <div class="form-group row">
    <label for="inputId" class="col-sm-2 col-form-label">아이디</label>
    <div class="col-sm-10">
      <input type="text" name="id" class="form-control" id="inputId" pattern="[a-z0-9]{4,20}" required value=${param.id }>
      <small class="form-text" style="color: gray" id="idPattern">
      숫자 또는 영문 소문자를 이용하여 입력하세요. (4~20글자)
      </small>
      <c:if test="${errors.memberId }">
      	<small class="form-text" style="color: tomato" id="idNullError">
      		아이디를 입력해주세요.
      	</small>
      </c:if>
      
      <!-- 아이디 중복검사 -->
      <small class="form-text" style="color: tomato" id="idNull">
      		아이디를 입력해주세요.
      </small>
      	
      <small class="form-text" style="color: DodgerBlue" id="idOk" >
      		사용 가능한 아이디입니다.
  	  </small>
      <small class="form-text" style="color: tomato" id="idDup" >
      		중복된 아이디입니다.
  	  </small>
      
     <button type="button" class="btn btn-primary" id="idDupCheck" >아이디 중복 확인</button>
     <input type="hidden" id="checkedId" value="">
    </div>


  </div>
  <div class="form-group row">
    <label for="password" class="col-sm-2 col-form-label">비밀번호</label>
    <div class="col-sm-10">
      <input type="password" name="password" class="form-control" id="password" pattern="([a-zA-Z]+\d{1}\w*)|(\d+[a-zA-Z]{1}\w*)" required>
      <c:if test="${not errors.pwPatternError }">
	      <small class="form-text" style="color: gray" id="pwPattern">
	      영문 대소문자, 숫자를 조합하여 입력하세요. (2글자 이상)
	      </small>
      </c:if>
      <c:if test="${errors.pwPatternError }">
      	<small class="form-text" style="color: tomato" id="pwPatternError" >
      		영문 대소문자, 숫자를 조합하여 입력하세요. (2글자 이상)
      	</small>
      </c:if>
      <c:if test="${errors.memberPw }">
      	<small class="form-text" style="color: tomato" id="pwNullError">
      		비밀번호를 입력해주세요.
      	</small>
      </c:if>
      
    </div>
  </div>
  <div class="form-group row">
    <label for="pwConfirm" class="col-sm-2 col-form-label">비밀번호 확인</label>
    <div class="col-sm-10">
      <input type="password" name="pwConfirm" class="form-control" id="pwConfirm" required>
      
      <c:if test="${errors.pwNotMatch }" >
      	<small class="form-text" style="color: tomato">
      		비밀번호가 일치하지 않습니다.
      	</small>
      </c:if>
      <c:if test="${errors.memberPwConfirm }">
      	<small class="form-text" style="color: tomato">
      		비밀번호 확인을 입력해주세요.
      	</small>
      </c:if>
      
    </div>
  </div>  
  
  <div class="form-group row">
    <label for="email" class="col-sm-2 col-form-label">E-mail</label>
    <div class="col-sm-10">
      
     
<!--    <input type="text" name="email" class="form-control" id="email"> -->

        <input type="text" name="emailFront" id="email" value="${param.emailFront}" placeholder="이메일 입력" required> 
 		<span>@</span>
		 <input id="textEmail" name="textEmail" value="${param.textEmail}"  placeholder="이메일을 선택하세요."> 
 		<select id="select">
 				
         	    <option value="disabled" id=selected>E-Mail 선택</option>
	            <option value="naver.com" id="naver.com">naver.com</option>
	            <option value="hanmail.net" id="hanmail.net">hanmail.net</option>
	            <option value="gmail.com" id="gmail.com">gmail.com</option>
	            <option value="nate.com" id="nate.com">nate.com</option>
	            <option value="directly" id="textEmail">직접 입력하기</option>
	        </select>
	    <input type="hidden" name="email" id="email-input" />
	          <small class="form-text" style="color: gray" id="emailPattern">
      </small>
	    
      <c:if test="${errors.memberEmail }">
      	<small class="form-text" style="color: tomato">
      		이메일을 입력해주세요.
      	</small>
      </c:if>
     
    </div>
  </div>
  
  <div class="form-group row">
    <label for="name" class="col-sm-2 col-form-label">이름</label>
    <div class="col-sm-10">
      <input type="text" name="name" class="form-control" id="name" required value=${param.name }> 	    
      <c:if test="${errors.memberName }">
      	<small class="form-text" style="color: tomato">
      		이름을 입력해주세요.
      	</small>
      </c:if>
      
    </div>
  </div>

  <div class="form-group row">
    <label for="inputNickname" class="col-sm-2 col-form-label">닉네임</label>
    <div class="col-sm-10">
      <input type="text" name="nickname" class="form-control" id="inputNickname" required value=${param.nickname }>    

     <c:if test="${errors.memberNickname }">
      	<small class="form-text" style="color: tomato">
      		닉네임을 입력해주세요.
      	</small>
      </c:if>
      
      <!-- 닉네임 중복검사 -->
      <small class="form-text" style="color: tomato" id="nicknameNull">
      		닉네임을 입력해주세요.
      </small>
      <small class="form-text" style="color: DodgerBlue" id="nicknameOk" >
      		사용 가능한 닉네임입니다.
  	  </small>
      <small class="form-text" style="color: tomato" id="nicknameDup" >
      		중복된 닉네임입니다.
  	  </small>
  
     <button type="button" class="btn btn-primary" id="nicknameDupCheck" >닉네임 중복 확인</button>
      <input type="hidden" id="checkedNn" value="">
    </div>
  </div>
  
  <div class="form-group row">
  
    <label for="loc" class="col-sm-2 col-form-label">주소</label>
    <div class="col-sm-10">
    <input type="hidden" name="loc" id="loc-input" required>
	
	<!-- //주소 api input 태그	 -->	 
	<br> 
	<input type="text" id="sample3_postcode" placeholder="우편번호">
	<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" id="sample3_address" placeholder="주소"><br>
	<input type="text" id="sample3_detailAddress" placeholder="상세주소" value="">
	<input type="text" id="sample3_extraAddress" placeholder="참고항목">
    <c:if test="${errors.memberLoc }">
    	<small class="form-text" style="color: tomato">
     		주소를 입력해주세요.
     	</small>
    </c:if>
    <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
	</div>
    </div>
  </div>

  <button type="submit" class="btn btn-primary" id="join" >회원 가입</button>
  <c:if test="${error }" >
  	<input type="hidden" value="${error }" id="error"> 
  </c:if>
  
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="${root }/resources/js/member/addressAPI.js"></script>
</form>

</body>
</html>