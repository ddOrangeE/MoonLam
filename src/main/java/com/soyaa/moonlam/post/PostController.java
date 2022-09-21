package com.soyaa.moonlam.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soyaa.moonlam.post.bo.PostBO;
import com.soyaa.moonlam.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostBO postBO;
	
	@GetMapping("timeline/view")
	public String timelineView(Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userIdByLogin = (Integer)session.getAttribute("userId");
	
		List<PostDetail> postList = postBO.getPostList(userIdByLogin);
		
		model.addAttribute("postList", postList);
		
		
		return "post/timeline";
	}
	
	@GetMapping("create/view")
	public String postInput() {
		return "post/input";
	}
	
}
