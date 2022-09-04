package com.soyaa.moonlam.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {

	
	@GetMapping("timeline/view")
	public String timelineView() {
		return "post/timeline";
	}
}