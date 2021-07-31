package com.jwat.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jwat.dto.DepartmentDTO;
import com.jwat.utils.MapperUtil;

public class DepartmentMapper implements IRowMapper<DepartmentDTO> {

	@Override
	public DepartmentDTO mapRow(ResultSet resultSet) {
		try {
			DepartmentDTO department = new DepartmentDTO();
			department.setId(resultSet.getLong("id"));
			department.setName(resultSet.getString("name"));
			department.setCode(resultSet.getString("code"));
			department.setLecturerId(resultSet.getLong("lecturer_id"));
			department.setFacultyId(resultSet.getLong("faculty_id"));
			if (MapperUtil.hasColumn(resultSet, "lecturer"))
				department.setLecturerName(resultSet.getString("lecturer"));
			if (MapperUtil.hasColumn(resultSet, "faculty"))
				department.setFacultyName(resultSet.getString("faculty"));
			return department;
		} catch (SQLException throwables) {
			System.out.println("Can not map result set to dto");
			return null;
		}
	}
}
