package com.jwat.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jwat.dto.SubjectAssignDTO;

public class SubjectAssignMapper implements IRowMapper<SubjectAssignDTO> {

	@Override
	public SubjectAssignDTO mapRow(ResultSet resultSet) {
		try {
			SubjectAssignDTO subjectAssignDTO = new SubjectAssignDTO();
			subjectAssignDTO.setId(resultSet.getLong("id"));
			subjectAssignDTO.setLecturerId(resultSet.getLong("lecturer_id"));
			subjectAssignDTO.setSemesterId(resultSet.getLong("semester_id"));
			subjectAssignDTO.setSubjectId(resultSet.getLong("subject_id"));
			return subjectAssignDTO;
		} catch (SQLException throwables) {
			System.out.println("Can not map result set to dto");
			return null;
		}
	}
}
