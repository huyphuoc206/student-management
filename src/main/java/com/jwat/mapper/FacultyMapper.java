package com.jwat.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jwat.dto.FacultyDTO;
import com.jwat.utils.MapperUtil;

public class FacultyMapper implements IRowMapper<FacultyDTO> {

	@Override
	public FacultyDTO mapRow(ResultSet resultSet) {
		try {
			FacultyDTO faculty = new FacultyDTO();
			faculty.setId(resultSet.getLong("id"));
			faculty.setName(resultSet.getString("name"));
			faculty.setCode(resultSet.getString("code"));
			faculty.setLecturerId(resultSet.getLong("lecturer_id"));
			if (MapperUtil.hasColumn(resultSet, "fullname"))
				faculty.setLecturerName(resultSet.getString("fullname"));
			return faculty;
		} catch (SQLException throwables) {
			System.out.println("Can not map result set to dto");
			return null;
		}
	}
}
