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
	public User getUser(String id, String password) {
		
		String phEmail = null;
		String loginId = null;
		
//		String phonePattern = "/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/";
		String phonePattern = "/^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/\r\n";
		
		String emailPattern = "/^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$/i\r\n";
		
		String encryptPassword = EncryptUtils.md5(password);
		
//		 if(RegexMatcher.matches(phonePattern, id) || RegexMatcher.matches(emailPattern, id)) {
//			 
//			 phEmail = id;
//			 
//			 return userDAO.selectUser(phEmail, loginId, encryptPassword);
//
//		 } else {
//			 
//			 loginId = id;
//			 
//			 return userDAO.selectUser(phEmail, loginId, encryptPassword);
//		 }
		
		if(loginId == id) {
			 
			 loginId = id;
			 
			 return userDAO.selectUser(phEmail, loginId, encryptPassword);

		 } else {
			 
			 phEmail = id;
			 
			 return userDAO.selectUser(phEmail, loginId, encryptPassword);
		 }
		
	}
	
	// id 중복확인
	public boolean isDuplicate(String loginId) {
		
		int count = userDAO.selectCountLoginId(loginId);
		
//		if(count == 0) {
//			return false;
//		} else {
//			return true;
//		}
		
		return count != 0;
	}
}
