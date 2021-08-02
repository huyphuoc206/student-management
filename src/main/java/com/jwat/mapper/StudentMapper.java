package com.jwat.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jwat.dto.ClassDTO;
import com.jwat.dto.StudentDTO;
import com.jwat.dto.UserDTO;

public class StudentMapper implements IRowMapper<StudentDTO> {

	@Override
	public StudentDTO mapRow(ResultSet resultSet) {
		try {
			StudentDTO student = new StudentDTO();
			student.setId(resultSet.getLong("student_id"));
			student.setClassId(resultSet.getLong("class_id"));
			ClassDTO classDTO = new ClassDTO();
			classDTO.setId(resultSet.getLong("class_id"));
			classDTO.setSchoolYear(resultSet.getString("school_year"));
			classDTO.setName(resultSet.getString("class_name"));
			classDTO.setCode(resultSet.getString("class_code"));
			classDTO.setFacultyId(resultSet.getLong("faculty_id"));
			classDTO.setFacultyName(resultSet.getString("faculty"));
			student.setClassDTO(classDTO);
			
			UserDTO user = new UserDTO();
			user.setId(resultSet.getLong("id"));
			user.setUsername(resultSet.getString("username"));
			user.setFullname(resultSet.getString("fullname"));
			user.setEmail(resultSet.getString("email"));
			user.setGender(resultSet.getString("gender"));
			user.setDob(resultSet.getTimestamp("dob"));
			user.setPhoneNumber(resultSet.getString("phone_number"));
			user.setStatus(resultSet.getInt("status"));
			user.setCreatedDate(resultSet.getTimestamp("created_date"));
			student.setUser(user);

			return student;
		} catch (SQLException throwables) {
			System.out.println("Can not map result set to dto");
			return null;
		}
	}
}
