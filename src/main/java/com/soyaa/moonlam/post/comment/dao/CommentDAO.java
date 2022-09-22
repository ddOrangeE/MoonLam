package com.soyaa.moonlam.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.soyaa.moonlam.post.comment.model.Comment;

@Repository
public interface CommentDAO {

	// 댓글 쓰기
	public int insertComment(
			@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("content") String content);

	// 댓글 보여주는 기능 - timeline.jsp
	public List<Comment> selectCommentListByPostId(int postId);
	
}
