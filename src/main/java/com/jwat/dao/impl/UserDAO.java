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
}
