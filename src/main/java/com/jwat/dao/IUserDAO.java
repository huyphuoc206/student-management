package com.jwat.dao;

import com.jwat.dto.UserDTO;

public interface IUserDAO {

	UserDTO findOneByUsernameAndPasswordAndStatus(String username, String password, int status);

}
