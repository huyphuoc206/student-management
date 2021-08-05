package com.jwat.service;

import java.util.List;

import com.jwat.dto.ScoreDashboardDTO;
import com.jwat.dto.StudentScoreDTO;

public interface IStudentScoreService {

	List<StudentScoreDTO> findAll(Long subjectAssignId, Long classId);

	boolean saveScores(List<StudentScoreDTO> studentScores);

	ScoreDashboardDTO getScoreDashboard(Long semesterId, Long studentId);
}
