package com.soyaa.moonlam.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.soyaa.moonlam.post.model.Post;

@Repository
public interface PostDAO {

	public int insertPost(
			// Param 언어테이션 : xml 에서 사용될 키워드
			@Param("userId") int userId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	public List<Post> sellectPostList();
	
	// 댓글 쓰기
	public int insertComment(
			@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("content") String content);

	
	// 좋아요 추가
	public int insertLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	// 좋아요 삭제
	public int deleteLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
}
