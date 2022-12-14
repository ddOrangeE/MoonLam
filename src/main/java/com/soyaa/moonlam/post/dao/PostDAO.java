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
	
	// comment 패키지로 이동
	// 댓글 쓰기
//	public int insertComment(
//			@Param("userId") int userId
//			, @Param("postId") int postId
//			, @Param("content") String content);

	
	// like 패키지로 이동
//	// 좋아요 추가
//	public int insertLike(
//			@Param("userId") int userId
//			, @Param("postId") int postId);
//	
//	// 좋아요 삭제
//	public int deleteLike(
//			@Param("userId") int userId
//			, @Param("postId") int postId);
	
	// 아이디 기반으로 post 조회하는 기능
	public Post selectPostByIdAndUserId(@Param("id") int id, @Param("userId") int userId);
	
	// 게시물 삭제
	public int deletePost(@Param("postId") int postId);
}
