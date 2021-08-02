package com.jwat.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jwat.dto.DegreeDTO;
import com.jwat.dto.DepartmentDTO;
import com.jwat.dto.LecturerDTO;
import com.jwat.dto.UserDTO;

public class LecturerMapper implements IRowMapper<LecturerDTO> {

	@Override
	public LecturerDTO mapRow(ResultSet resultSet) {
		try {
			LecturerDTO lecturer = new LecturerDTO();
			
			lecturer.setId(resultSet.getLong("lecturer_id"));
			lecturer.setDegreeId(resultSet.getLong("degree_id"));
			lecturer.setDepartmentId(resultSet.getLong("department_id"));
			
			DegreeDTO degree = new DegreeDTO();
			degree.setName(resultSet.getString("degree_name"));
			degree.setCode(resultSet.getString("degree_code"));
			lecturer.setDegree(degree);
			
			DepartmentDTO department = new DepartmentDTO();
			department.setName(resultSet.getString("department_name"));
			department.setFacultyId(resultSet.getLong("faculty_id"));
			department.setFacultyName(resultSet.getString("faculty_name"));
			lecturer.setDepartment(department);
			
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
			lecturer.setUser(user);
			return lecturer;
		} catch (SQLException throwables) {
			System.out.println("Can not map result set to dto");
			return null;
		}
	}
}
