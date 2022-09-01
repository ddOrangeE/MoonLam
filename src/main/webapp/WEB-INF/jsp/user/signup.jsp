<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoonLam - 회원가입</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	     
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/signup.css" type="text/css">

</head>
<body>

	<div class="container">
		<form id="signupForm">			
			<section class="contents d-flex justify-content-center">
				<div class="main-content border border-warning rounded container-fluid row justify-content-center align-items-center">
					<h1 class="mt-1 text-dark font-weight-bold">MoonLam</h1>
					<span class="col-10">친구들의 사진과 동영상을 보려면 가입하세요.</span>
				
					<input type="text" placeholder="휴대폰 번호 또는 이메일 주소" class="form-control col-10" id="phEmailInput">
					<input type="text" placeholder="성명" class="form-control col-10" id="nameInput">
					<input type="text" placeholder="사용자 이름" class="form-control col-10" id="userNameInput">
					<input type="password" placeholder="비밀번호" class="form-control col-10" id="passwordInput">
					<input type="password" placeholder="비밀번호 중복확인" class="form-control col-10" id="duplicatePasswordInput">
				
					<button type="submit" class="btn btn-warning text-white form-control col-10 mb-3">가입</button>
				</div>
			</section>
		</form>
		<footer class="d-flex justify-content-center">
			<div class="sub-content border border-warning rounded container-fluid row justify-content-center align-items-center mt-4">
				<h5 class="text-secondary">계정이 있으신가요?</h5>
				<a href="#" class="ml-4"><h5>로그인</h5></a>
			</div>
		</footer>
	</div>

	<script>
		$(document).ready(function() {
			$("#signupForm").on("submit", function(e) {
				e.preventDefault();
				
				let phEmail = $("#phEmailInput").val();
				let name = $("#nameInput").val();
				let userName = $("#userNameInput").val();
				let password = $("#passwordInput").val();
				let duplicatePassword = $("#duplicatePasswordInput").val();
				
				if(phEmail == "") {
					alert("휴대폰 번호 또는 이메일을 입력하세요.");
					return;
				}
				
				if(name == "") {
					alert("이름을 입력하세요.");
					return;
				}
				
				if(userName == "") {
					alert("사용자 이름을 입력하세요.");
					return;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				if(password != duplicatePassword) {
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signup"
					, data:{"phEmail":phEmail, "name":name, "userName":userName, "password":password}
					, success:function(data) {
						if(data.result == "success") {
							location.href = "/user/signin/view"
						} else {
							alert("회원가입 실패");
						}
					}
					, error:function() {
						alert("회원가입 에러");
					}
					
				});
			});
			
		});
	</script>

</body>
</html>