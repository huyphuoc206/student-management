package com.jwat.service;

import com.jwat.dto.ChangePasswordDTO;
import com.jwat.dto.UserDTO;

public interface IUserService {
	UserDTO checkLogin(String username, String password);

	UserDTO findOneById(Long id);

	UserDTO update(UserDTO userDTO);

	boolean changePassword(ChangePasswordDTO dto);

	boolean delete(Long id);
}
