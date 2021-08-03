package com.jwat.service.impl;

import javax.inject.Inject;

import com.jwat.dao.IUserDAO;
import com.jwat.dto.ChangePasswordDTO;
import com.jwat.dto.UserDTO;
import com.jwat.service.IUserService;
import com.jwat.utils.MD5Hashing;

public class UserService implements IUserService {

	@Inject
	private IUserDAO userDAO;

	@Override
	public UserDTO checkLogin(String username, String password) {
		password = MD5Hashing.hash(password);
		UserDTO user = userDAO.findOneByUsernameAndPasswordAndStatus(username, password, 1);
		if (user != null)
			return user;
		return user;
	}

	@Override
	public UserDTO findOneById(Long id) {
		return userDAO.findOneById(id);
	}

	@Override
	public UserDTO update(UserDTO userDTO) {
		UserDTO user = userDAO.findOneByEmailOrUsernameExcludeId(userDTO.getEmail(), userDTO.getUsername(), userDTO.getId());
		if (user == null) {
			if (userDAO.update(userDTO))
				return userDAO.findOneById(userDTO.getId());
		}
		return null;
	}

	@Override
	public boolean changePassword(ChangePasswordDTO dto) {
		if (!dto.getNewPassword().equals(dto.getNewPasswordConfirm()))
			return false;
		UserDTO user = userDAO.findOneById(dto.getUserId());
		if (!user.getPassword().equals(MD5Hashing.hash(dto.getOldPassword())))
			return false;
		String newPasswordHash = MD5Hashing.hash(dto.getNewPassword());
		return userDAO.changePassword(newPasswordHash, dto.getUserId());
	}

	@Override
	public boolean delete(Long id) {
		return userDAO.delete(id);
	}

	@Override
	public long countByRole(String role) {
		return userDAO.countByRole(role);
	}
}
