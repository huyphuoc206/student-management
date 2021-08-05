package com.jwat.dao;

import java.util.List;

import com.jwat.dto.StudentScoreDTO;

public interface IStudentScoreDAO {

	List<StudentScoreDTO> findAll(Long subjectAssignId, Long classId);

	void delete(Long studentId, Long subjectAssignId);

	void insert(StudentScoreDTO e);

	List<StudentScoreDTO> findScoreDashboard(Long semesterId, Long studentId, Long classId);

}