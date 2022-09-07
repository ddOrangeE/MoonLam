<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<header class="d-flex justify-content-between align-items-center">
		
			<a href="/post/timeline/view" style="text-decoration:none" class="col-3 ml-2"><h1 class="text-dark">MoonLam</h1></a>
			<input type="text" placeholder="검색" class="form-control col-4">
			<div class="d-flex justify-content-between align-items-center col-5 mr-2">
				
				<a href="#"><i class="bi bi-house-door-fill"></i></a>
				<a href="#"><i class="bi bi-chat"></i></a>
				<a href="#"><i class="bi bi-plus-square"></i></a>
				<a href="#"><i class="bi bi-heart"></i></a>
				
				<c:if test="${not empty userId }">
					<a href="/user/signout">${userName }</a>
				</c:if>			
			</div>
		</header>