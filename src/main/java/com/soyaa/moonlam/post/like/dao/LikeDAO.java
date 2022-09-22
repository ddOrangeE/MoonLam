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
	// dao 입장에서는 내가 지금 하는 기능이 어떻게 쓰이는 지 모르는 게 좋다!
	public int selectLikeCountByUserIdAndPostId(
			@Param("userId") int userId
			, @Param("postId") int postId);
}
