package com.soyaa.moonlam.post.bo;

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
		
		for(Post post : postList) {
			
			// userId 를 통해서 user 정보를 가지고 오는 기능
			int userId = post.getUserId();
			
			User user = userBO.getUserById(userId);
			
			// Post 객체와 User 을 하나로 묶어야 같이 사용할 수 있다 -> 합쳐서 처리할 새로운 클래스 필요하다! (PostDetail)
			
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setUser(user);
			
		}
		
		return ;
	}
}
