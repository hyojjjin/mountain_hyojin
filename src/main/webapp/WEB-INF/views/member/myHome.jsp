<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="m" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="modal" tagdir="/WEB-INF/tags/modal"%>
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

<div class="container-sm">
   <div class="row">
      <div class="col-12 col-sm-6 offset-sm-3">
			<!--내 정보 보기 -->
			<form>
				<div class="container">
					<div class="row">
						<div class="col border mr-3">
							<div class="my-2 mx-3">
								<h4 class="py-3">프로필</h4>
								<div class="px-4">
									<dl>
										<dt class="d-inline">
											아이디
										</dt>
										<dd class="d-inline"> ${sessionScope.authUser.id }
										</dd>
									</dl>
									<dl>
										<dt class="d-inline">
											이름
										</dt>
										<dd class="d-inline"> ${sessionScope.authUser.name } 
										</dd>
									</dl>
									<dl>
										<dt class="d-inline">
											별명
										</dt>
										<dd class="d-inline"> ${sessionScope.authUser.nickname }
										</dd>
									</dl>
									<dl>
										<dt class="d-inline">
											비밀번호
										</dt>
										<dd class="d-inline"> ****  
										</dd>
									</dl>
									<dl>
										<dt class="d-inline">
											이메일
										</dt>
										<dd class="d-inline"> ${sessionScope.authUser.email } 
										</dd>
									</dl>
									<dl>
										<dt class="d-inline">
											주소
										</dt>
										<dd class="d-inline"> ${locDiv.postcode } ${locDiv.address } ${locDiv.detailAddress } ${locDiv.extraAddress }
										</dd>
									</dl>
								</div>
								<a href="/mountain/member/myModify">
									<input type="button" class="btn btn-primary mb-4" value="수정">
								</a>
								<input type="button" class="btn btn-primary mb-4 float-center" data-toggle="modal" data-target="#memberDeleteModal" value="탈퇴">
								<modal:memberDeleteModal />
							</div>
						</div>
						<div class="w-100"></div>
					 	<!--<div class="col border">
							conquest 등 정보 들어올 예정!
						</div>
						<div class="col">col</div>
						<div class="col">col</div> -->
					</div>
				</div>
			</form>
      </div>
   </div>
</div>
</body>
</html>