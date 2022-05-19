package com.douglashdezt.library.services;

import java.util.List;

import com.douglashdezt.library.models.dtos.UserInfo;
import com.douglashdezt.library.models.entities.User;

public interface UserService {
	void register(UserInfo userInfo) throws Exception;
	User findOneById(Long id) throws Exception;
	List<User> findAll() throws Exception;
	User findOneByIdentifer(String identifier) throws Exception;
	User findOneByUsernameAndEmail(String username, String email) throws Exception;
	Boolean comparePassword(User user, String passToCompare) throws Exception;
	void insertToken(User user, String token) throws Exception;
}
