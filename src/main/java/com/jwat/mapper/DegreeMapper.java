package com.jwat.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jwat.dto.DegreeDTO;

public class DegreeMapper implements IRowMapper<DegreeDTO> {

	@Override
	public DegreeDTO mapRow(ResultSet resultSet) {
		try {
			DegreeDTO degree = new DegreeDTO();
			degree.setId(resultSet.getLong("id"));
			degree.setName(resultSet.getString("name"));
			degree.setCode(resultSet.getString("code"));
			return degree;
		} catch (SQLException throwables) {
			System.out.println("Can not map result set to dto");
			return null;
		}
	}
}
