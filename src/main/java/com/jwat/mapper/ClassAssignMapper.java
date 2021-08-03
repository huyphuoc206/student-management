package com.jwat.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jwat.dto.ClassAssignDTO;

public class ClassAssignMapper implements IRowMapper<ClassAssignDTO> {

	@Override
	public ClassAssignDTO mapRow(ResultSet resultSet) {
		try {
			ClassAssignDTO classAssignDTO = new ClassAssignDTO();
			classAssignDTO.setSubjectAssignId(resultSet.getLong("lecturer_subject_id"));
			classAssignDTO.setClassId(resultSet.getLong("class_id"));
			return classAssignDTO;
		} catch (SQLException throwables) {
			System.out.println("Can not map result set to dto");
			return null;
		}
	}
}
