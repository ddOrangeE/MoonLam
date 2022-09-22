package com.soyaa.moonlam.post.model;

import java.util.List;

import com.soyaa.moonlam.post.comment.model.CommentDetail;
import com.soyaa.moonlam.user.model.User;

public class PostDetail {
	
	private Post post;
	private User user;
	private int likeCount;
	private int likeCountByUserId;
	private List<CommentDetail> commentDetailList;
	
	public List<CommentDetail> getCommentDetailList() {
		return commentDetailList;
	}
	public void setCommentDetailList(List<CommentDetail> commentDetailList) {
		this.commentDetailList = commentDetailList;
	}
	public int getLikeCountByUserId() {
		return likeCountByUserId;
	}
	public void setLikeCountByUserId(int likeCountByUserId) {
		this.likeCountByUserId = likeCountByUserId;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
