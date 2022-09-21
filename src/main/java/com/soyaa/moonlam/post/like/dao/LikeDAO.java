package com.soyaa.moonlam.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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

}
