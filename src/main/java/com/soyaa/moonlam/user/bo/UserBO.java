package com.soyaa.moonlam.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soyaa.moonlam.common.EncryptUtils;
import com.soyaa.moonlam.user.dao.UserDAO;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String phEmail, String name, String userName, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(phEmail, name, userName, encryptPassword);
	}
}
