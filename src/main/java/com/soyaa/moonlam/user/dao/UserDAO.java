package com.soyaa.moonlam.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("phEmail") String phEmail
			, @Param("name") String name
			, @Param("userName") String userName
			, @Param("password") String password);
	
}
