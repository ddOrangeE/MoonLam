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
	
	// 게시글별 좋아요 개수 얻는 기능
	public int getLikeCountByPostId(int postId) {
		return likeDAO.selectLikeCountByPostId(postId);
	}
	
	// 특정 사용자가 특정 게시글에 좋아요 여부 확인 기능
	public boolean isLike(int userId, int postId) {
		int count = likeDAO.selectLikeCountByUserIdAndPostId(userId, postId);
		
		// count == 0 이면 좋아요 하지 않았다.
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
}
