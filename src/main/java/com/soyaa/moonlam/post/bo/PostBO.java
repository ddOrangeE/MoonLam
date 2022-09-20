package com.soyaa.moonlam.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.soyaa.moonlam.common.FileManagerService;
import com.soyaa.moonlam.post.dao.PostDAO;
import com.soyaa.moonlam.post.model.Post;
import com.soyaa.moonlam.post.model.PostDetail;
import com.soyaa.moonlam.user.bo.UserBO;
import com.soyaa.moonlam.user.model.User;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	// 게시글 정보를 전달 받아서 저장하는 기능
	public int addPost(int userId, String content, MultipartFile file) {
		
		// 경로를 return 해주니까 저장! : 저장을 해놔야 파일을 다룰 수가 있다.
		String imagePath = FileManagerService.saveFile(userId, file);
		
		// 파일 업로드가 문제가 있으면, 인서트를 진행하지 않고, 입력이 진행되지 않는다는 return 값을 만들어준다
		if(imagePath == null) {
			return 0;
		}
		
		return postDAO.insertPost(userId, content, imagePath);
		
	}
	
	// 모든 게시글을 다 가지고 오는 기능
	public List<PostDetail> getPostList() {
		
		// 게시글 하나당 작성자 정보를 조합하는 과정
		List<Post> postList = postDAO.sellectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post : postList) {
			
			// userId 를 통해서 user 정보를 가지고 오는 기능
			int userId = post.getUserId();
			
			User user = userBO.getUserById(userId);
			
			// Post 객체와 User 을 하나로 묶어야 같이 사용할 수 있다 -> 합쳐서 처리할 새로운 클래스 필요하다! (PostDetail)
			
			// 직접 객체를 만들어서 데이터를 관리하는 방법 -> (DTO) BO 에서 가장 일반적으로 사용하는 방법
			// BO : 데이터를 단순히 return 하는 게 아니라, controller, jsp 에서 사용하기 편리한 형식으로 바꾸어주는 기능 수행
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setUser(user);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	// 댓글 작성 기능
	public int addComment(int userId, int postId, String content) {
		
		return postDAO.insertComment(userId, postId, content);
		
	}
	
	// 좋아요 추가 기능
	public int addLike(int userId, int postId) {
		return postDAO.insertLike(userId, postId);
	}
}
