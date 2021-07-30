package com.jwat.service;

import com.jwat.dto.UserDTO;

public interface IUserService {
	UserDTO checkLogin(String username, String password);
}
