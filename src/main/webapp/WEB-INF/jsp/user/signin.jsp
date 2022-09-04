<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoonLam - 로그인</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	     
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/signin.css" type="text/css">
</head>
<body>
	<div class="container">
		
		<form id="loginForm">
			<section class="contents d-flex justify-content-center">
				<div class="main-content border border-warning rounded container-fluid row justify-content-center align-items-center">
					<h1 class="mt-1 text-dark font-weight-bold">MoonLam</h1>
					<span class="col-10">친구들의 사진과 동영상을 보려면 가입하세요.</span>
					
									
					<input type="text" placeholder="전화번호, 사용자 이름 또는 이메일" class="form-control col-10" id="idInput">
					
					<input type="password" placeholder="비밀번호" class="form-control col-10" id="passwordInput">
	
					<button type="submit" class="btn btn-warning text-white form-control col-10">로그인</button>
					
					<span class="text-secondary">--------------------- 또는 ---------------------</span>
					
				
					<div class="signup-page border border-warning rounded container-fluid row justify-content-center align-items-center mb-3">
						<h5 class="text-secondary">계정이 있으신가요?</h5>
						<a href="#" class="ml-4"><h5 class="text-warning font-weight-bold">로그인</h5></a>
					</div>
				</div>
			</section>
		</form>
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#loginForm").on("submit", function(e) {
				e.preventDefault();
				
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				
				if(id == "") {
					alert("아이디를 입력하세요.");
					return;
				} 
				
				if(password == "") {
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				
				$.ajax({
					type:"post"
					, url:"/user/signin"
					, data:{"id":id, "password":password}
					, success:function(data) {
						if(data.result == "success") {
							location.href = "/post/timeline/view";
						} else {
							alert("아이디/비밀번호를 확인하세요");
						}
					}
					, error:function() {
						alert("로그인 에러");
					}
					
				});
			});
			
		});
	</script>
</body>
</html>