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
//string email = email.concat(email, select);
</script>


<script>
	$(document).ready(function() {
	
		// ##아이디 중복 확인 멘트 - hide
		$('#idOk').hide();
		$('#idDup').hide();
		$('#idNull').hide();
		
		// ##아이디 패턴 검사
		$('#idPattern').show();
		$('#idPattern').attr("style", "color:gray");
		
		// ##닉네임 중복 확인 멘트 - hide
		$('#nicknameOk').hide();
		$('#nicknameDup').hide();
		$('#nicknameNull').hide();	
		
		
		// ##아이디 중복 검사
		$("#idDupCheck").click(function(e) {
			e.preventDefault();
			var inputId = $('#inputId').val();
						
			$.ajax({
				type: "get",
				url: "/mountain/member/join/idDupCheck",
				data: {inputId:inputId}
			}).done(function(data) {
				console.log("아이디 중복 검사");
				if(data != null) {
					$('#idNullError').hide();
					if(data == '0' ) {
						console.log("사용할 수 있음");
						$('#idDup').hide();
						$('#idNull').hide();
						$('#idPattern').hide();
						
						alert("아이디를 사용할 수 있습니다.");
						$("#checkedId").val('y');
						$('#idOk').show();
					} else if(data == '-1') {
						console.log("중복 아이디");
						$('#idOk').hide();
						$('#idNull').hide();
						$('#idPattern').hide();
						alert("중복된 아이디입니다.");
						$('#idDup').show();
					} else if(data == '-2') {
						console.log("아이디 null");
						$('#idDup').hide();
						$('#idNull').hide();
						$('#idPattern').show();
						$('#idPattern').attr("style", "color:tomato");
						$('#idNull').show(); //inputId가 빈 스트링일때 아이디를 적어주세요 멘트 어떻게 하냐!!!
					} else if(data == '-3') {
						console.log("아이디 패턴 x");
						$('#idOk').hide();
						$('#idDup').hide();
						$('#idNull').hide();
						
						$('#idPattern').show();
						$('#idPattern').attr("style", "color:tomato"); //inputid 패턴식 false
						
					}
				} 
			}).fail(function() {
	
			});
		});
		
  		// ##아이디 중복 검사를 해주세요.
		$("#join").click(function(e) {
			e.preventDefault();
			if($("#checkedId").val() == ''){
				alert("아이디 중복 확인을 해주세요.");
		//		 $("input[name='checked_id']").eq(0).focus(); //커서 옮기기
				return false;
			}
			$("#joinForm1").submit();
		}); 		
	
		// ##닉네임 중복 검사
		$("#nicknameDupCheck").click(function(e) {
			e.preventDefault();
			var inputNickname = $('#inputNickname').val();
			
			$.ajax({
				type: "get",
				url: "/mountain/member/join/nicknameDupCheck",
				data: {inputNickname:inputNickname}
			}).done(function(data) {
				console.log("닉네임 중복 검사");
				if(data != null) {
					if(data == '0' ) {
						console.log("사용할 수 있음");
						$('#nicknameDup').hide();
						$('#nicknameNull').hide();
						alert("닉네임을 사용할 수 있습니다.");
						$("#checkedNn").val('y');
						$('#nicknameOk').show();
					} else if(data == '-1') {
						console.log("중복된 닉네임");
						$('#nicknameOk').hide();
						$('#nicknameNull').hide();
						alert("중복된 닉네임입니다.");
						$('#nicknameDup').show();
					} else if(data == '-2') {
						console.log("닉네임 null");
						$('#nicknameOk').hide();
						$('#nicknameDup').hide();
						$('#nicknameNull').show(); //inputId가 빈 스트링일때 아이디를 적어주세요 멘트 어떻게 하냐!!!
					}
				} 
			}).fail(function() {
	
			});
		});
		
		
 		//닉네임 중복 검사를 해주세요.
		$("#join").click(function(e) {
			e.preventDefault();
			if($("#checkedNn").val() == ''){
				alert("닉네임 중복 확인을 해주세요.");
				return false;
			}
			$("#joinForm1").submit();
		});
 		
 		
 		// ## 키업 될때, 아이디, 닉네임 중복 확인 필요
 		function setIdReset() {
 			$("#checkedId").val('');
 		}	
 	        $("#inputId").keyup(setIdReset);
 	        
 		function setNnReset() {
 			$("#checkedNn").val('');
 		}	
 	        $("#inputNickname").keyup(setNnReset);
		
 		
 		//비밀번호 패턴 안내
 		$('#join').click(function() {
 			if($('#pwPatternError').val() != null) {
 				//비밀번호 패턴 에러가 있다면
 				console.log("#pwPatternError");
 				$('#pwPatternError').show();
 			} else if($('#pwNullError').val() != null) {
 				//비밀번호가 null 이면	
 				$('#pwPattern').hide();
 				$('#pwPatternError').show();
 			}
 			
 			
 		}); 
 		
		//<!-- 이메일 주소 선택  -->
    	// ##이메일 셀렉트 선택
        $('#select').change(function() {
            if ($('#select').val() == 'directly') {
                $('#textEmail').attr("disabled", false);
                $('#textEmail').val("");
                $('#textEmail').focus();
            } else {
                $('#textEmail').val($('#select').val());
            }
        });
        
        /* 이메일 값을 합쳐서 name으로 보내기 */
        function setEmailInput() {
        	var email = $("#email").val() + "@" + $("#textEmail").val();  
        	$("#email-input").val(email);
        }
        
        $("#select").change(setEmailInput);
        $("#email").keyup(setEmailInput);
        $("#textEmail").keyup(setEmailInput);
        
        /* 주소 값을 합쳐서 name으로 보내기 */
        function setLocInput() {
        	var loc = $("#sample3_postcode").val() + "|" + $("#sample3_address").val() + " " +
        	$("#sample3_detailAddress").val() + $("#sample3_extraAddress").val();
        	$("#loc-input").val(loc);
        }
  
        $("#sample3_postcode").change(setLocInput);
        $("#sample3_address").change(setLocInput);
        $("#sample3_detailAddress").keyup(setLocInput);
        $("#sample3_extraAddress").change(setLocInput);
        
    });
</script>

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
 				
         	    <option value="" disabled selected>E-Mail 선택</option>
	            <option value="naver.com" id="naver.com">naver.com</option>
	            <option value="hanmail.net" id="hanmail.net">hanmail.net</option>
	            <option value="gmail.com" id="gmail.com">gmail.com</option>
	            <option value="nate.com" id="nate.com">nate.com</option>
	            <option value="directly" id="textEmail">직접 입력하기</option>
	        </select>
	    <input type="hidden" name="email" id="email-input" />
	          <small class="form-text" style="color: gray" id="emailPattern">
      이메일 형식에 맞게 입력하세요.(하지만 ,, 왜 안대는걸까)
      pattern="[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}" 이메일 패턴 잠시 보류!
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
  

  
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	//우편번호 찾기 찾기 화면을 넣을 element
	var element_wrap = document.getElementById('wrap');
	
	function foldDaumPostcode() {
	    // iframe을 넣은 element를 안보이게 한다.
	    element_wrap.style.display = 'none';
	}
	
	function sample3_execDaumPostcode() {
	    // 현재 scroll 위치를 저장해놓는다.
	    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("sample3_extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("sample3_extraAddress").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample3_postcode').value = data.zonecode;
	            document.getElementById("sample3_address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("sample3_detailAddress").focus();
	
	            // iframe을 넣은 element를 안보이게 한다.
	            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	            element_wrap.style.display = 'none';
	
	            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
	            document.body.scrollTop = currentScroll;
	        },
	        // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
	        onresize : function(size) {
	            element_wrap.style.height = size.height+'px';
	        },
	        width : '100%',
	        height : '100%'
	    }).embed(element_wrap);
	
	    // iframe을 넣은 element를 보이게 한다.
	    element_wrap.style.display = 'block';
	}
	</script>

</form>




</body>
</html>