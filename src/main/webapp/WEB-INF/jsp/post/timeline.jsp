<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoonLam - ${userLoginId }</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	     
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/static/css/timeline.css" type="text/css">
</head>
<style>
	
	<%--
	.d-none {
		display:none;
	}
	--%>
	
</style>
<body>
	<div class="container">
		<c:import url="/WEB-INF/jsp/post/include/header.jsp" />
		<hr>
		<section class="d-flex justify-content-center">
			
			<!-- 전체 -->
			<div class="main-content">
				
				<!-- 피드들~ -->				
				<c:forEach var="postDetail" items="${postList }">
				<div class="mb-2 border border-muted rounded py-3">
					
					<!-- 카드 -->
					<div>
					
						<div class="d-flex justify-content-between">
							<!-- 이름 -->
							<h3 class="ml-2">${postDetail.user.loginId }</h3>
							<a href="#"><h3 class="pb-1 text-secondary"><i class="bi bi-three-dots-vertical"></i></h3></a>
						</div>
						
						<!-- 이미지 -->
						<div class="d-flex justify-content-center">
							<img alt="게시물 이미지" class="w-100" src="${postDetail.post.imagePath }">
						</div>
						<!-- 이미지 -->
						
						<!-- class 는 대문자 말고 - 로 만들면 좋다!! -->
						<!-- 아이콘 -->
						<div class="d-flex">
							<div class="col-4 d-flex">
								<!-- data 속성 이름에 절대 대문자 들어가면 안됨! -->
								<!-- el 태그 : 서버쪽 코드 -->
								<!-- 자바스크립트 : 클라이언트(브라우저)에서 처리되는 코드 -->
								
							<c:choose>
								<c:when test="${postDetail.likeCountByUserId eq 0 }">
								<a href="#" class="heart" data-post-id="${postDetail.post.id }" id="offheart${postDetail.post.id }"><h4 class="text-dark heart-icon"><i class="bi bi-heart"></i></h4></a>
								</c:when>
								
								<c:when test="${postDetail.likeCountByUserId ne 0 }">
								<a href="#" class="heart" data-post-id="${postDetail.post.id }" id="onheart${postDetail.post.id }"><h4 class="text-dark heart-icon"><i class="bi bi-heart-fill"></i></h4></a>
								</c:when>
								
								<c:otherwise></c:otherwise>
							</c:choose>
							
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
						
						<!-- 좋아요, 컨텐트 댓글, 댓글달기 -->
						<div>
							<c:if test="${postDetail.likeCount > 0 }">
							<span class="ml-2 font-weight-bold">OtherName</span>님 ${postDetail.likeCount }명이 좋아합니다. <br>
							</c:if>
							
							<div class="mt-2">
								<b class="ml-2">${postDetail.user.loginId }</b> 
								<span class="ml-1">${postDetail.post.content }</span>
							</div>
							
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
								<input type="text" class="text-secondary form-control border-0" placeholder="댓글 달기..." id="commentInput${postDetail.post.id }">
								<button type="button" class="comment-btn btn btn-dark" data-post-id="${postDetail.post.id }">입력</button>
							</div>
							
						</div>
						<!-- 좋아요, 댓글, 댓글달기 -->
						
					
					</div>
					<!-- 카드 -->
					
				</div>
				</c:forEach>
				<!-- 피드들~ -->
				
			</div>
			<!-- 전체 -->
			
		</section>
		<c:import url="/WEB-INF/jsp/post/include/footer.jsp" />
		
	</div>
	<!-- 전체 -->
	
	<script>
		$(document).ready(function() {
			

			// var countheart = false;
			
			// 좋아요 추가

			// 커서 올리면 손모양으로 변환 .css("cursor","pointer") : 흔하게 쓰는 방식은 아님
			// $(".heart").css("cursor","pointer").on("click", function() {
			$(".heart").on("click", function(e) {
				
				e.preventDefault();	
				
				// this : 지금 현재 이벤트가 발생된 객체
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/like"
					, data:{"postId":postId}
				
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 추가 실패");
						}
					}
					, error:function() {
						alert("좋아요 추가 에러");
					}
					
				});				
				
				
				/*
			 이렇게 해도 되지만 다시 좋아요 개수를 조회하는 과정으로 돌아가면 더 좋기 때문에 location.reload 사용
				if(countheart == false) {
					$.ajax({
						type:"get"
						, url:"/post/like"
						, data:{"postId":postId}
					
						, success:function(data) {
							if(data.result == "success") {
								
								countheart = true;
								
								if(countheart) {
									$("#offheart" + postId).addClass("d-none");
									$("#onheart" + postId).removeClass("d-none");
								} 
								
								
								location.reload();
							} else {
								alert("좋아요 추가 실패");
							}
						}
						, error:function() {
							alert("좋아요 추가 에러");
						}
						
					});				
				} else {
					$.ajax({
						type:"get"
						, url:"/post/unlike"
						, data:{"postId":postId}
					
						, success:function(data) {
							
							
							countheart = false;
							
							if(countheart == false) {
								$("#offheart" + postId).removeClass("d-none");
								$("#onheart" + postId).addClass("d-none");
							}
							
							
							location.reload();
						}
						, error:function() {
							alert("좋아요 취소 에러");
						}
						
					});
					
					
				}
				*/
				
				
			});
			
			// 댓글 입력
			$(".comment-btn").on("click", function(e) {
				
				let postId = $(this).data("post-id");		
				
				let comment = $("#commentInput" + postId).val();
				
				
				if(comment == "") {
					alert("댓글을 입력하세요!");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/post/comment/create"
					, data:{"postId":postId, "content":comment}
				
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글작성 실패");
						}
					}
					, error:function() {
						alert("댓글작성 에러");
					}
					
				});
				
			});
			
		});
	</script>
</body>
</html>