package com.jwat.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jwat.dto.DepartmentDTO;
import com.jwat.dto.SubjectDTO;

public class SubjectMapper implements IRowMapper<SubjectDTO> {

	@Override
	public SubjectDTO mapRow(ResultSet resultSet) {
		try {
			SubjectDTO subjectDTO = new SubjectDTO();
			subjectDTO.setId(resultSet.getLong("id"));
			subjectDTO.setName(resultSet.getString("name"));
			subjectDTO.setCode(resultSet.getString("code"));
			subjectDTO.setDepartmentId(resultSet.getLong("department_id"));
			DepartmentDTO department = new DepartmentDTO();
			department.setId(resultSet.getLong("department_id"));
			department.setName(resultSet.getString("department_name"));
			department.setFacultyId(resultSet.getLong("faculty_id"));
			department.setFacultyName(resultSet.getString("faculty_name"));
			subjectDTO.setDepartment(department);
			return subjectDTO;
		} catch (SQLException throwables) {
			System.out.println("Can not map result set to dto");
			return null;
		}
	}
}
