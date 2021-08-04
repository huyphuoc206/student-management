package com.jwat.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jwat.dto.SemesterDTO;
import com.jwat.dto.SubjectAssignDTO;
import com.jwat.dto.SubjectDTO;
import com.jwat.utils.MapperUtil;

public class SubjectAssignMapper implements IRowMapper<SubjectAssignDTO> {

	@Override
	public SubjectAssignDTO mapRow(ResultSet resultSet) {
		try {
			SubjectAssignDTO subjectAssignDTO = new SubjectAssignDTO();
			subjectAssignDTO.setId(resultSet.getLong("id"));
			subjectAssignDTO.setLecturerId(resultSet.getLong("lecturer_id"));
			subjectAssignDTO.setSemesterId(resultSet.getLong("semester_id"));
			subjectAssignDTO.setSubjectId(resultSet.getLong("subject_id"));
			SubjectDTO subjectDTO = new SubjectDTO();
			if (MapperUtil.hasColumn(resultSet, "subject_name"))
				subjectDTO.setName(resultSet.getString("subject_name"));
			if (MapperUtil.hasColumn(resultSet, "subject_code"))
				subjectDTO.setCode(resultSet.getString("subject_code"));
			SemesterDTO semesterDTO = new SemesterDTO();
			if (MapperUtil.hasColumn(resultSet, "semester_name"))
				semesterDTO.setName(resultSet.getString("semester_name"));
			subjectAssignDTO.setSemester(semesterDTO);
			subjectAssignDTO.setSubject(subjectDTO);
			return subjectAssignDTO;
		} catch (SQLException throwables) {
			System.out.println("Can not map result set to dto");
			return null;
		}
	}
}
