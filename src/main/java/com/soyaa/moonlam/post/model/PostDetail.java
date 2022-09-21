package com.soyaa.moonlam.post.model;

import com.soyaa.moonlam.user.model.User;

public class PostDetail {
	
	private Post post;
	private User user;
	private int likeCount;
	private int likeCountByUserId;
	
	
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
