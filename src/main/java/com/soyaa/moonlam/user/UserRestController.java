package com.soyaa.moonlam.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.soyaa.moonlam.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	// 회원가입 기능
	@PostMapping("/signup")
	public Map<String, String> signup(
			@RequestParam("phEmail") String phEmail
			, @RequestParam("name") String name
			, @RequestParam("userName") String userName
			, @RequestParam("password") String password) {
		
		int count = userBO.addUser(phEmail, name, userName, password);
		
		Map<String, String> result = new HashMap<>();
		
//		response(json)	
//		성공시	{"result":"success"}
//		실패시	{"result":"fail"}
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}
