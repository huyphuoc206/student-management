package com.jwat.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jwat.dto.SemesterDTO;

public class SemesterMapper implements IRowMapper<SemesterDTO> {

	@Override
	public SemesterDTO mapRow(ResultSet resultSet) {
		try {
			SemesterDTO semesterDTO = new SemesterDTO();
			semesterDTO.setId(resultSet.getLong("id"));
			semesterDTO.setName(resultSet.getString("name"));
			semesterDTO.setCode(resultSet.getString("code"));
			return semesterDTO;
		} catch (SQLException throwables) {
			System.out.println("Can not map result set to dto");
			return null;
		}
	}
}
