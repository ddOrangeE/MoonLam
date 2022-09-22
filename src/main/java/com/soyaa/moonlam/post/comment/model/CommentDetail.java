package com.soyaa.moonlam.post.comment.model;

import com.soyaa.moonlam.user.model.User;

public class CommentDetail {

	private Comment Comment;
	private User user;
	
	public Comment getComment() {
		return Comment;
	}
	public void setComment(Comment comment) {
		Comment = comment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
