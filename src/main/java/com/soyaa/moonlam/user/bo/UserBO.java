package com.soyaa.moonlam.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soyaa.moonlam.common.EncryptUtils;
import com.soyaa.moonlam.common.RegexMatcher;
import com.soyaa.moonlam.user.dao.UserDAO;
import com.soyaa.moonlam.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	// 회원가입
	public int addUser(String phEmail, String name, String userName, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(phEmail, name, userName, encryptPassword);
	}
	
	// 로그인
	public User getUser(String userName, String password) {
		
		String phEmail = null;
		String loginId = null;
		
		String phonePattern = "/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/";
		String emailPattern = "/^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$/i\r\n";
		
		 if(RegexMatcher.matches(phonePattern, loginId) || RegexMatcher.matches(emailPattern, loginId)) {
			 
			 id = loginId;
			 
			 return userDAO.selectUser(phEmail, password);
			 
		 }
		
	}
}
