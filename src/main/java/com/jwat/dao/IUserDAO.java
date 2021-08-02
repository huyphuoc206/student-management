package com.jwat.dao;

import com.jwat.dto.UserDTO;

public interface IUserDAO {

	UserDTO findOneByUsernameAndPasswordAndStatus(String username, String password, int status);

	UserDTO findOneById(Long id);

	UserDTO findOneByEmail(String email);
	
	boolean update(UserDTO userDTO);

	boolean changePassword(String newPassword, Long userId);

	boolean delete(Long id);

	UserDTO findOneByEmailOrUsernameExcludeId(String email, String username, Long id);

}
