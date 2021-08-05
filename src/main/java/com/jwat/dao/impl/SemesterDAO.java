package com.jwat.dao.impl;

import java.util.List;

import com.jwat.dao.ISemesterDAO;
import com.jwat.dto.SemesterDTO;
import com.jwat.mapper.SemesterMapper;

public class SemesterDAO extends AbstractDAO<SemesterDTO> implements ISemesterDAO {

	@Override
	public List<SemesterDTO> findAll() {
		String sql = "SELECT * FROM semester";
		return query(sql, new SemesterMapper());
	}

	@Override
	public List<SemesterDTO> getSemestersAssignLecturer(Long id) {
		String sql = "SELECT DISTINCT(S.id), S.name, S.code FROM semester S JOIN lecturer_subject LS ON S.id = LS.semester_id JOIN lecturer L ON LS.lecturer_id = L.id WHERE L.id = ?";
		return query(sql, new SemesterMapper(), id);
	}

	@Override
	public List<SemesterDTO> findByClass(Long classId) {
		String sql = "SELECT DISTINCT(S.id), S.name, S.code FROM semester S JOIN lecturer_subject LS ON S.id = LS.semester_id JOIN lecturer_class LC ON LS.id = LC.lecturer_subject_id WHERE LC.class_id = ?";
		return query(sql, new SemesterMapper(), classId);
	}
}
