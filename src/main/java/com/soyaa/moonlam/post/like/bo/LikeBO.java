package com.soyaa.moonlam.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soyaa.moonlam.post.like.dao.LikeDAO;

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
}
