<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MooLam - createPost</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	     
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/input.css" type="text/css">

</head>
<body>

	<div class="container">
		<c:import url="/WEB-INF/jsp/post/include/header.jsp" />
		<section class="d-flex justify-content-center my-5">
			<div class="col-8">
				<h3 class="text-center font-weight-bold">새 게시물 만들기</h3>
				<div class="d-flex justify-content-between mt-3 border border-warning rounded">
					<a href="/post/timeline/view"><img alt="이전 화살표" width="50px"; src="https://iconmonstr.com/wp-content/g/gd/makefg.php?i=../releases/preview/7.0.0/png/iconmonstr-arrow-left-lined.png&r=255&g=200&b=18"></a>
					<button type="button" class="btn btn-link text-warning"><h5>공유하기</h5></button>				
				</div>
				
				<div class="d-flex justify-content-center mt-3">
					<div class="col-6 bg-danger d-flex align-items-center">
						<img alt="사람 이모티콘" width="40px"; src="https://cdns.iconmonstr.com/wp-content/releases/preview/2018/240/iconmonstr-user-circle-thin.png">
						<h5 class="ml-2">UserName</h5>
					</div>
				</div>
				<textarea class="text-secondary">문구입력...</textarea>			
			
				<div class="col-10">
				
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/post/include/footer.jsp" />
	</div>

</body>
</html>