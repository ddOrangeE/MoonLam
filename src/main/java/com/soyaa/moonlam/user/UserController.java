package com.soyaa.moonlam.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	// 회원가입 화면
	@GetMapping("/signup/view")
	public String signupView() {
		return "user/signup";
	}
	
	// 로그인 화면
	@GetMapping("/signin/view")
	public String signinView() {
		return "user/signin";
	}
	
	// 로그아웃 기능
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// 로그인 정보 제거
		// 세션에 로그인 사용자 정보 제거
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		
		return "redirect:/user/signin/view";
	}
	
}
