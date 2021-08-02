package com.jwat.dao.impl;

import java.util.List;

import com.jwat.dao.IUserDAO;
import com.jwat.dto.UserDTO;
import com.jwat.mapper.UserMapper;

public class UserDAO extends AbstractDAO<UserDTO> implements IUserDAO {

	@Override
	public UserDTO findOneByUsernameAndPasswordAndStatus(String username, String password, int status) {
		String sql = "SELECT * FROM user JOIN role ON user.role_id = role.id WHERE username = ? AND password = ? AND status = ?";
		List<UserDTO> users = query(sql, new UserMapper(), username, password, status);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public UserDTO findOneById(Long id) {
		String sql = "SELECT * FROM user WHERE id = ?";
		List<UserDTO> users = query(sql, new UserMapper(), id);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public UserDTO findOneByEmail(String email) {
		String sql = "SELECT * FROM user WHERE email = ?";
		List<UserDTO> users = query(sql, new UserMapper(), email);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public boolean update(UserDTO userDTO) {
		String sql = "UPDATE user SET fullname = ?, email = ?, gender = ?, phone_number = ?, dob = ?  WHERE id = ?";
		return update(sql, userDTO.getFullname(), userDTO.getEmail(), userDTO.getGender(), userDTO.getPhoneNumber(),
				userDTO.getDob(), userDTO.getId());
	}

	@Override
	public boolean changePassword(String newPassword, Long userId) {
		String sql = "UPDATE user SET password = ? WHERE id = ?";
		return update(sql, newPassword, userId);
	}

	@Override
	public boolean delete(Long id) {
		String sql = "UPDATE user SET status = 0 WHERE id = ?";
		return update(sql, id);
	}

	@Override
	public UserDTO findOneByEmailOrUsernameExcludeId(String email, String username, Long id) {
		String sql = "";
		if(id == null) {
			sql = "SELECT * FROM user WHERE email = ? OR username = ? ";
			List<UserDTO> users = query(sql, new UserMapper(), email, username);
			return users.isEmpty() ? null : users.get(0);
		}
		else {
			sql = "SELECT * FROM user WHERE (email = ? OR username = ?) AND id != ?";
			List<UserDTO> users = query(sql, new UserMapper(), email, username, id);
			return users.isEmpty() ? null : users.get(0);
		}
	}
}
