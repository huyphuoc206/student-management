package com.jwat.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jwat.dto.StudentScoreDTO;
import com.jwat.utils.MapperUtil;

public class StudentScoreMapper implements IRowMapper<StudentScoreDTO> {

	@Override
	public StudentScoreDTO mapRow(ResultSet resultSet) {
		try {
			StudentScoreDTO studentScoreDTO = new StudentScoreDTO();
			if (MapperUtil.hasColumn(resultSet, "id"))
				studentScoreDTO.setStudentId(resultSet.getLong("id"));
			if (MapperUtil.hasColumn(resultSet, "username"))
				studentScoreDTO.setUsername(resultSet.getString("username"));
			if (MapperUtil.hasColumn(resultSet, "fullname"))
				studentScoreDTO.setFullname(resultSet.getString("fullname"));
			if (MapperUtil.hasColumn(resultSet, "lecturer_subject_id"))
				studentScoreDTO.setSubjectAssignId(resultSet.getLong("lecturer_subject_id"));
			if (MapperUtil.hasColumn(resultSet, "subject_name"))
				studentScoreDTO.setSubjectName(resultSet.getString("subject_name"));
			String processScore = resultSet.getString("process_score");
			String midTermScore = resultSet.getString("midterm_score");
			String endTermScore = resultSet.getString("endterm_score");
			if (processScore == null) {
				studentScoreDTO.setProcessScore(null);
			} else
				studentScoreDTO.setProcessScore(Float.parseFloat(processScore));

			if (midTermScore == null) {
				studentScoreDTO.setMidTermScore(null);
			} else
				studentScoreDTO.setMidTermScore(Float.parseFloat(midTermScore));

			if (endTermScore == null) {
				studentScoreDTO.setEndTermScore(null);
			} else
				studentScoreDTO.setEndTermScore(Float.parseFloat(endTermScore));
			return studentScoreDTO;
		} catch (SQLException throwables) {
			System.out.println("Can not map result set to dto");
			return null;
		}
	}
}
