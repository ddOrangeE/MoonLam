package com.soyaa.moonlam.post.comment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soyaa.moonlam.post.comment.dao.CommentDAO;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	// 댓글 작성 기능
	public int addComment(int userId, int postId, String content) {
		
		return commentDAO.insertComment(userId, postId, content);
		
	}
}
