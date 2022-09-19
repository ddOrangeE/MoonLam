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

}
