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
			@Param("phEmail") String phEmail
			, @Param("loginId") String loginId
			, @Param("password") String password);
	
	// id 중복확인
	public int selectCountLoginId(@Param("loginId") String loginId);
	
	// user 테이블의 id를 통해서 사용자 정보를 얻어 오는 기능
	public User selectUserById(@Param("id") int id);
}

