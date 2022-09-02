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
					<input type="text" placeholder="사용자 이름" class="form-control col-7" id="userNameInput">
					<button type="button" class="btn btn-warning text-white" id="isDuplicateBtn">중복확인</button>
					<span class="small text-danger d-none" id="duplicate">x 중복된 사용자 이름입니다.</span>
					<span class="small text-primary d-none" id="non-duplicate">✔ 사용가능한 사용자 이름입니다.</span>
					
					<!-- <pre class="display-4 text-primary">✔</pre> -->
					<!-- <input type="text" class="form-control col-9" id="idDuplicate"> <pre class="display-4 text-danger">x</pre> -->
					
					
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
			
			var isDuplicateCheck = false;
			var isDuplicate = true;
			
			// 사용자가 아이디 인풋을 건드는 순간 중복체크 관련 모든 사항을 초기화
			$("#userNameInput").on("input", function() {
				
				isDuplicateCheck = false;
				isDuplicate = true;
				
				$("#duplicate").addClass("d-none");
				$("#non-duplicate").addClass("d-none");
				
			});
			
			$("#isDuplicateBtn").on("click", function() {
				
				let userName = $("#userNameInput").val();
				
				if(userName == "") {
					alert("아이디를 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/user/duplicate_id"
					, data:{"loginId":userName}
					, success:function(data) {
						if(data.id_duplicate) {
							$("#duplicate").removeClass("d-none");
							$("#non-duplicate").addClass("d-none");
							isDuplicateCheck = true;
							isDuplicate = true;
							
						} else {
							$("#duplicate").addClass("d-none");
							$("#non-duplicate").removeClass("d-none");
							isDuplicateCheck = true;
							isDuplicate = false;
						}
					}
					, error:function() {
						alert("중복확인 에러");
					}
					
				});
				
			});
			
			
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
				
				// 중복체크 여부 확인 (중복체크가 진행되지 않으면 return)
				if(!isDuplicateCheck) {
					alert("중복확인을 해주세요.");
					return;
				}
				
				// 아이디 중복확인 (중복된 상태면 return)
				if(isDuplicate) {
					alert("중복된 사용자 이름입니다.");
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