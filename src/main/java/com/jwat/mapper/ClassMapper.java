package com.jwat.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jwat.dto.ClassDTO;
import com.jwat.utils.MapperUtil;

public class ClassMapper implements IRowMapper<ClassDTO> {

	@Override
	public ClassDTO mapRow(ResultSet resultSet) {
		try {
			ClassDTO classDTO = new ClassDTO();
			classDTO.setId(resultSet.getLong("id"));
			classDTO.setName(resultSet.getString("name"));
			classDTO.setCode(resultSet.getString("code"));
			classDTO.setSchoolYear(resultSet.getString("school_year"));
			classDTO.setFacultyId(resultSet.getLong("faculty_id"));
			if (MapperUtil.hasColumn(resultSet, "faculty"))
				classDTO.setFacultyName(resultSet.getString("faculty"));
			return classDTO;
		} catch (SQLException throwables) {
			System.out.println("Can not map result set to dto");
			return null;
		}
	}
}
