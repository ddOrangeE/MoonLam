<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${userId }</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	     
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/timeline.css" type="text/css">
</head>
<body>
	<div class="container">
		<header class="d-flex justify-content-between align-items-center">
			<a href="/post/timeline/view" style="text-decoration:none" class="col-3 ml-2"><h1 class="text-dark">MoonLam</h1></a>
			<input type="text" placeholder="🔍검색" class="form-control col-4">
			<div class="d-flex justify-content-between align-items-center col-5 mr-2">
				<a href="#">home</a>
				<a href="#">message</a>
				<a href="#">createPost</a>
				<a href="#">notice</a>
				<a href="#">myPage</a>			
			</div>
		</header>
		<hr>
		<section class="d-flex justify-content-center">
			<div class="main-content">
				<h3 class="mt-2 ml-4">${userName }</h3>
				<div class="d-flex justify-content-center">
					<img src="https://file2.nocutnews.co.kr/newsroom/image/2021/10/01/202110011529180963_0.jpg" width=450px; height=450px;>
				</div>
				<div class="d-flex justify-content-between">
					<div class="mt-2 ml-4">
						<span>♡</span> 
						<span>댓글</span>
						<span>메세지</span>
					</div>
					
					<span class="mt-2 mr-5">...</span>
					<span class="mt-2 mr-4">저장</span>
				</div>
				
				<h5 class="ml-4">OtherName님 여러 명이 좋아합니다.</h5>
				<a href="#" class="ml-4">댓글 9개 모두 보기</a>
				<h5 class="ml-4">OtherName 언니..</h5>
				<h5 class="ml-4">OtherName ...hihi</h5>
				<span class="small text-secondary ml-4">1일 전</span>
				
				<hr>
				
				<h5 class="text-secondary ml-4">댓글 달기...</h5>
			</div>
		</section>
		
	</div>
	
	
</body>
</html>