package com.soyaa.moonlam.post.like.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soyaa.moonlam.post.like.dao.LikeDAO;
import com.soyaa.moonlam.post.like.model.Like;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	// 좋아요 추가 기능
	public int addLike(int userId, int postId) {
		return likeDAO.insertLike(userId, postId);
	}
	
	// 좋아요 취소 기능
	public int deleteLike(int userId, int postId) {
		return likeDAO.deleteLike(userId, postId);
	}
	
	// 포스터 좋아요 개수
	public int getLikeCountByPostId(int postId) {
		return likeDAO.selectLikeCountByPostId(postId);
	}
	
	// 로그인한 사용자가 포스터 좋아요를 눌렀는지
	public int getLikeCountByUserIdAndPostId(int userId, int postId) {
		return likeDAO.selectLikeCountByUserIdAndPostId(userId, postId);
	}
}
