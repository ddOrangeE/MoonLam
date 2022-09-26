<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
						<!-- 삭제버튼 -->
							<a href="#" class="more-btn" data-post-id="${postDetail.post.id }" data-toggle="modal" data-target="#moreModal"><h3 class="pb-1 text-secondary"><i class="bi bi-three-dots-vertical"></i></h3></a>
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
								<%--로그인한 사용자가 좋아요한 게시물 --%>
								<c:when test="${postDetail.like }">
								<a href="#" class="unlike-btn" data-post-id="${postDetail.post.id }"><h4 class="text-dark heart-icon"><i class="bi bi-heart-fill text-danger"></i></h4></a>
								</c:when>
								
								<%-- is로 시작하는 값은 is를 제외한 값만 써줘야 한다 --%>
								<%--로그인한 사용자가 좋아요를 하지 않은 게시물 --%>
								<c:otherwise>
								<a href="#" class="like-btn" data-post-id="${postDetail.post.id }"><h4 class="text-dark heart-icon"><i class="bi bi-heart"></i></h4></a>
								</c:otherwise>
	
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
							
								<c:if test="${fn:length(postDetail.commentDetailList) > 2 }">
								<a href="#" class="ml-2 comment-detail-btn" id="commentDetailBtn${postDetail.post.id }" data-post-id="${postDetail.post.id }">댓글 <c:out value="${fn:length(postDetail.commentDetailList) }" />개 모두 보기</a>
								<a href="#" class="ml-2 d-none comment-basic-btn" id="commentBasicBtn${postDetail.post.id }" data-post-id="${postDetail.post.id }">댓글 접기</a>
								</c:if>
								
							</div>
							
							<div class="mt-2" id="commentBasic${postDetail.post.id }">
								<c:forEach var="comment" items="${postDetail.commentDetailList }" begin="0" end="1">
								<span class="ml-2 font-weight-bold">
									<c:out value="${comment.user.loginId }" />
								</span> 
									<c:out value="${comment.comment.content }" />
								<br>
								</c:forEach>
							</div>
							
							<div class="mt-2 d-none" id="commentAll${postDetail.post.id }">
								<c:forEach var="comment" items="${postDetail.commentDetailList }">
								<span class="ml-2 font-weight-bold">
									<c:out value="${comment.user.loginId }" />
								</span> 
									<c:out value="${comment.comment.content }" />
								<br>
								</c:forEach>
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
	
	<!-- Modal -->
	<div class="modal fade" id="moreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body text-center">
				<a href="#" id="deleteBtn">삭제하기</a>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(document).ready(function() {
		
			$("#deleteBtn").on("click", function(e) {
				e.preventDefault();
			
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/delete"
					, data:{"postId":postId}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("삭제 실패");
						}
					}
					, error:function() {
						alert("삭제 에러");
					}
				});
				
				
			});
			
			
			$(".more-btn").on("click", function() {
			
				// 모달의 삭제하기 a 태그에 data-post-id 속성에,
				// 현재 more-btn이 포함된 postId 를 저장한다.
				let postId = $(this).data("post-id");
				
				$("#deleteBtn").data("post-id", postId);
				
			});
			
			
			// 좋아요 취소
			$(".unlike-btn").on("click", function(e){
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/unlike"
					, data:{"postId":postId}
				
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 취소 실패");
						}
					}
					, error:function() {
						alert("좋아요 취소 에러");
					}
				});
				
			
			
			});
			
			
			
			// 댓글 2개만 보기
			$(".comment-basic-btn").on("click", function(e) {
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$("#commentBasic" + postId).removeClass("d-none");
				$("#commentAll" + postId).addClass("d-none");
				$("#commentDetailBtn" + postId).removeClass("d-none");
				$("#commentBasicBtn" + postId).addClass("d-none");
				
			});
			
			// 댓글 모두 보기
			$(".comment-detail-btn").on("click", function(e) {
				e.preventDefault();
			
				let postId = $(this).data("post-id");
				
				$("#commentBasic" + postId).addClass("d-none");
				$("#commentAll" + postId).removeClass("d-none");
				$("#commentDetailBtn" + postId).addClass("d-none");
				$("#commentBasicBtn" + postId).removeClass("d-none");
				
			});
			

			// var countheart = false;
			
			// 좋아요 추가

			// 커서 올리면 손모양으로 변환 .css("cursor","pointer") : 흔하게 쓰는 방식은 아님
			// $(".heart").css("cursor","pointer").on("click", function() {
			$(".like-btn").on("click", function(e) {
				
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