package com.soyaa.moonlam.post;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/post")
public class PostRestController {

	// 게시물 작성 기능
	@PostMapping("/create")
	public Map<String, String> create(
			@RequestParam("content") String content
			) {
		
	}
}
