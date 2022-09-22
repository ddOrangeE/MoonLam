package com.soyaa.moonlam.post.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soyaa.moonlam.post.comment.dao.CommentDAO;
import com.soyaa.moonlam.post.comment.model.Comment;
import com.soyaa.moonlam.post.comment.model.CommentDetail;
import com.soyaa.moonlam.user.bo.UserBO;
import com.soyaa.moonlam.user.model.User;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	
	// 댓글 작성 기능
	public int addComment(int userId, int postId, String content) {
		
		return commentDAO.insertComment(userId, postId, content);
		
	}
	
	
	// 포스터 아이디를 통해 댓글 불러오는 기능
	public List<CommentDetail> getCommentListByPostId(int postId) {
		
		List<CommentDetail> commentDetailList = new ArrayList<>();
		
		List<Comment> commentList = commentDAO.selectCommentListByPostId(postId); 
		
		
		for(Comment comment : commentList) {
			
			int userId = comment.getUserId();
			
			User user = userBO.getUserById(userId);
			
			CommentDetail commentDetail = new CommentDetail();
			commentDetail.setComment(comment);
			commentDetail.setUser(user);

			commentDetailList.add(commentDetail);
		}
		
		return commentDetailList;
	}
}
