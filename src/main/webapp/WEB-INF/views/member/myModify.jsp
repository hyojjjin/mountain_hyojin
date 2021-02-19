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

<script type="text/javascript" src="${root }/resources/js/member/myModify.js"></script>

<title>산산산</title>
</head>
<body>

<m:topNav />
<%-- <form>
<table>
  <tr>
  	<th>이름<th>
    <td>
    	 <input type="text" readonly name="name" class="form-control-plaintext" id="staticName" value="${sessionScope.authUser.name }">
    </td>
  </tr>
  <tr> 
  	<th>별명<th>
  	<td>
  		<input type="text" name="nickname" class="form-control-plaintext" id="inputNickname" value="${sessionScope.authUser.nickname }" required>
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
	 
	    <button type="button" class="btn btn-primary" id="nicknameDupCheck" disabled>닉네임 중복 확인</button>
	    <input type="hidden" id="checkedNn" value="">
    </td>
    <td></td>
  </tr>
</table>

</form> --%>








	<form method="post" action="${root }/member/myModify" id="modifyForm1">
	  <div class="form-group row">
	    <label for="staticId" class="col-sm-2 col-form-label">아이디</label>
	    <div class="col-sm-10">
	      <input type="text" readonly name="id" class="form-control-plaintext" id="staticId" value="${sessionScope.authUser.id }">
	    </div>
	  </div>

	  <div class="form-group row">
	    <label for="staticPw" class="col-sm-2 col-form-label">비밀번호</label>
	    <div class="col-sm-10">
	      <input type="password" name="password" class="form-control-plaintext" id="staticPw" pattern="([a-zA-Z]+\d{1}\w*)|(\d+[a-zA-Z]{1}\w*)" value="${sessionScope.authUser.password }" required>
	      <small class="form-text" style="color: gray" id="pwPattern">
	      	영문 대소문자, 숫자를 조합하여 입력하세요. (2글자 이상)
	      </small>
	    </div>
	  </div>
	   <div class="form-group row">
	    <label for="pwConfirm" class="col-sm-2 col-form-label">비밀번호 확인</label>
	    <div class="col-sm-10">
	      <input type="password" name="pwConfirm" class="form-control" id="pwConfirm"  value="${sessionScope.authUser.password }">
	      
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
	    <label for="staticName" class="col-sm-2 col-form-label">이름</label>
	    <div class="col-sm-10">
	      <input type="text" readonly name="name" class="form-control-plaintext" id="staticName" value="${sessionScope.authUser.name }">
	    </div>
	  </div>
	   <div class="form-group row">
	    <label for="inputNickname" class="col-sm-2 col-form-label">닉네임</label>
	    <div class="col-sm-10">
	      <input type="text" name="nickname" class="form-control-plaintext" id="inputNickname" value="${sessionScope.authUser.nickname }" required>
	   
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
	 
	    <button type="button" class="btn btn-primary" id="nicknameDupCheck" disabled>닉네임 중복 확인</button>
	    <input type="hidden" id="checkedNn" value="">
 	   </div>
	  </div>
	  
	  <div class="form-group row">
	    <label for="staticEmail" class="col-sm-2 col-form-label">이메일</label>
	    <div class="col-sm-10" id="staticEmail">
	   		<input type="text" id="emailFront" value="${emailDTO.emailFront }" placeholder="이메일 입력" required > 
	 		<span>@</span>
			 <input id="emailSelect" value="${emailDTO.emailSelect }" placeholder="이메일을 선택하세요." required> 
	 		<select id="select">
	         	   <option value="disabled" id="selected">E-Mail 선택</option>
		            <option value="naver.com" id="naver.com">naver.com</option>
		            <option value="hanmail.net" id="hanmail.net">hanmail.net</option>
		            <option value="gmail.com" id="gmail.com">gmail.com</option>
		            <option value="nate.com" id="nate.com">nate.com</option>
		            <option value="directly" id="textEmail">직접 입력하기</option>
		        </select>
		    <input type="hidden" name="email" id="email-input" value="${sessionScope.authUser.email }"/>
	    </div>
	  </div>
	  
	  <div class="form-group row">
	    <label for="loc-input" class="col-sm-2 col-form-label">주소</label>
	    <div class="col-sm-10">
	
		  <input type="hidden" class="form-control" id="loc-input" name="loc" value="${authUser.loc }">
		<br> 
		<!-- //주소 api input 태그	 -->	 
	      <input type="text" id="sample3_postcode" placeholder="우편번호" value="${locDiv.postcode }">
	      <input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
	  	  <input type="text" id="sample3_address" placeholder="주소" value="${locDiv.address }"><br>
		  <input type="text" id="sample3_detailAddress" placeholder="상세주소" value="${locDiv.detailAddress }">
		  <input type="text" id="sample3_extraAddress" placeholder="참고항목" value="${locDiv.extraAddress }">
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
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript" src="${root }/resources/js/member/addressAPI.js"></script>
	
		<button type="submit" class="btn btn-primary" id="modify" >수정</button>
		
	</form>

</body>
</html>