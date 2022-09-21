package com.soyaa.moonlam.post.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.soyaa.moonlam.post.like.model.Like;

@Repository
public interface LikeDAO {
	
	// 좋아요 추가
	public int insertLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	// 좋아요 삭제
	public int deleteLike(
			@Param("userId") int userId
			, @Param("postId") int postId);

	// 포스터 좋아요 개수 조회
	public int selectLikeCountByPostId(@Param("postId") int postId);
	
	// 로그인한 사용자가 포스터 좋아요를 눌렀는지
	public int selectLikeCountByUserIdAndPostId(
			@Param("userId") int userId
			, @Param("postId") int postId
			);
}
