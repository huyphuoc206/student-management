package com.jwat.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jwat.dto.LecturerDTO;
import com.jwat.dto.UserDTO;
import com.jwat.utils.MapperUtil;

public class LecturerMapper implements IRowMapper<LecturerDTO> {

	@Override
	public LecturerDTO mapRow(ResultSet resultSet) {
		try {
			LecturerDTO lecturer = new LecturerDTO();
			if (MapperUtil.hasColumn(resultSet, "HV_GV")) {
				UserDTO user = new UserDTO();
				user.setFullname(resultSet.getString("HV_GV"));
				lecturer.setUser(user);
				lecturer.setId(resultSet.getLong("id"));
				return lecturer;
			}
			return lecturer;
		} catch (SQLException throwables) {
			System.out.println("Can not map result set to dto");
			return null;
		}
	}
}
