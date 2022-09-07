<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoonLam - ${userId }</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	     
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/static/css/timeline.css" type="text/css">
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/jsp/post/include/header.jsp" />
		<hr>
		<section class="d-flex justify-content-center">
			
			<!-- 전체 -->
			<div class="main-content border border-muted rounded py-3">
				
				<!-- 카드 -->				
				<div class="mb-2">
				
					<div class="d-flex justify-content-between">
						<!-- 이름 -->
						<h3 class="ml-2">${userName }</h3>
						<h3 class="pb-1 text-secondary"><i class="bi bi-three-dots-vertical"></i></h3>
					</div>
					
					<!-- 이미지 -->
					<div class="d-flex justify-content-center">
						<img alt="게시물 이미지" class="w-100" src="https://file2.nocutnews.co.kr/newsroom/image/2021/10/01/202110011529180963_0.jpg">
					</div>
					<!-- 이미지 -->
					
					<!-- 아이콘 -->
					<div class="d-flex">
						<div class="col-4 d-flex">
							<a href="#"><h4 class="text-dark heart-icon"><i class="bi bi-heart"></i></h4></a> 
							<a href="#"><h4 class="ml-3 text-dark"><i class="bi bi-chat"></i></h4></a>
							<!-- <a href="#" class="ml-2"><i class="bi bi-send"></i></a>  -->
						</div>
						
						<div class="col-4 d-flex justify-content-center">
							<h3><i class="bi bi-three-dots"></i></h3>
						</div>
						
						<div class="col-4 d-flex justify-content-end">
							<a href="#"><h4 class="text-dark"><i class="bi bi-tag-fill"></i></h4></a>
						</div>
					</div>
					<!-- 아이콘 -->
					
					<!-- 좋아요, 댓글, 댓글달기 -->
					<div>
						<span class="ml-2 font-weight-bold">OtherName</span>님 여러 명이 좋아합니다. <br>
						
						<div class="mt-2">
							<a href="#" class="ml-2">댓글 9개 모두 보기</a> <br>
						</div>
						
						<div class="mt-2">
							<span class="ml-2 font-weight-bold">OtherName</span> 언니.. <br>
							<span class="ml-2 font-weight-bold">OtherName</span> ...hihi <br>
						</div>
						
						<div class="mt-2">
							<span class="small text-secondary ml-2">1일 전</span>						
						</div>
						
						<hr>
						
						<div class="d-flex mt-3">
							<input type="text" class="text-secondary form-control border-0" placeholder="댓글 달기...">
							<button type="button" class="btn btn-dark">입력</button>
						</div>
						
					</div>
					<!-- 좋아요, 댓글, 댓글달기 -->
					
				</div>
				<!-- 카드 -->

				
			</div>
			<!-- 전체 -->
			
		</section>
		<c:import url="/WEB-INF/jsp/post/include/footer.jsp" />
		
	</div>
	<!-- 전체 -->
	
</body>
</html>