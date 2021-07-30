package com.jwat.service.impl;

import javax.inject.Inject;

import com.jwat.dao.IUserDAO;
import com.jwat.dto.UserDTO;
import com.jwat.service.IUserService;

public class UserService implements IUserService {

	@Inject
	private IUserDAO userDAO;

	@Override
	public UserDTO checkLogin(String username, String password) {
//		password = MD5Hashing.hash(password);
		UserDTO user = userDAO.findOneByUsernameAndPasswordAndStatus(username, password, 1);
		if (user != null)
			return user;
		return user;
	}

}
