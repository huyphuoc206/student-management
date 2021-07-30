package com.jwat.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jwat.dto.RoleDTO;
import com.jwat.dto.UserDTO;
import com.jwat.utils.MapperUtil;

public class UserMapper implements IRowMapper<UserDTO> {

	@Override
	public UserDTO mapRow(ResultSet resultSet) {
		try {
			UserDTO user = new UserDTO();
			user.setId(resultSet.getLong("id"));
			user.setUsername(resultSet.getString("username"));
			user.setPassword(resultSet.getString("password"));
			user.setFullname(resultSet.getString("fullname"));
			user.setEmail(resultSet.getString("email"));
			user.setGender(resultSet.getString("gender"));
			user.setDob(resultSet.getTimestamp("dob").toLocalDateTime().toLocalDate());
			user.setPhoneNumber(resultSet.getString("phone_number"));
			user.setStatus(resultSet.getInt("status"));
			user.setCreatedDate(resultSet.getTimestamp("created_date").toLocalDateTime());
			RoleDTO role = new RoleDTO();
			role.setId(resultSet.getLong("role_id"));
			if (MapperUtil.hasColumn(resultSet, "code"))
				role.setCode(resultSet.getString("code"));
			if (MapperUtil.hasColumn(resultSet, "name"))
				role.setName(resultSet.getString("name"));
			user.setRole(role);

			return user;
		} catch (SQLException throwables) {
			System.out.println("Can not map result set to dto");
			return null;
		}
	}
}
