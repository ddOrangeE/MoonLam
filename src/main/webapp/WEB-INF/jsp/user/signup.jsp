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
		<section class="contents d-flex justify-content-center">
			<div class="main-content border border-warning rounded container-fluid row justify-content-center align-items-center">
				<h1 class="mt-1 text-dark font-weight-bold">MoonLam</h1>
				<span class="col-10">친구들의 사진과 동영상을 보려면 가입하세요.</span>
				
								
				<input type="text" placeholder="휴대폰 번호 또는 이메일 주소" class="form-control col-10">
				<input type="text" placeholder="성명" class="form-control col-10">
				<input type="text" placeholder="사용자 이름" class="form-control col-10">
				<input type="password" placeholder="비밀번호" class="form-control col-10">
				
				
				<button type="submit" class="btn btn-warning text-white form-control col-10">가입</button>
			</div>
		</section>
		<footer class="d-flex justify-content-center">
			<div class="sub-content border border-warning rounded container-fluid row justify-content-center align-items-center mt-4">
				<h5 class="text-secondary">계정이 있으신가요?</h5>
				<a href="#" class="ml-4"><h5>로그인</h5></a>
			</div>
		</footer>
	</div>

</body>
</html>