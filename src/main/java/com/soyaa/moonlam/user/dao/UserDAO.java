package com.soyaa.moonlam.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.soyaa.moonlam.user.model.User;

@Repository
public interface UserDAO {

	// 회원가입
	public int insertUser(
			@Param("phEmail") String phEmail
			, @Param("name") String name
			, @Param("userName") String userName
			, @Param("password") String password);
	
	
	// 로그인
	public User selectUser(
			@Param("loginId") String loginId
			, @Param("password") String password);
}

