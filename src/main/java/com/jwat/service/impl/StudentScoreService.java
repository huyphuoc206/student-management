package com.jwat.service.impl;

import java.text.DecimalFormat;
import java.util.List;

import javax.inject.Inject;

import com.jwat.dao.ISemesterDAO;
import com.jwat.dao.IStudentDAO;
import com.jwat.dao.IStudentScoreDAO;
import com.jwat.dto.ScoreDashboardDTO;
import com.jwat.dto.SemesterDTO;
import com.jwat.dto.StudentDTO;
import com.jwat.dto.StudentScoreDTO;
import com.jwat.service.IStudentScoreService;

public class StudentScoreService implements IStudentScoreService {

	@Inject
	private IStudentScoreDAO studentScoreDAO;
	@Inject
	private IStudentDAO studentDAO;
	@Inject
	private ISemesterDAO semesterDAO;
	@Override
	public List<StudentScoreDTO> findAll(Long subjectAssignId, Long classId) {
		List<StudentScoreDTO> studentScoreDTOs = studentScoreDAO.findAll(subjectAssignId, classId);
		return setFinalScore(studentScoreDTOs);
	}

	@Override
	public boolean saveScores(List<StudentScoreDTO> studentScores) {
		studentScores.forEach(e -> {
			studentScoreDAO.delete(e.getStudentId(), e.getSubjectAssignId());
			DecimalFormat df = new DecimalFormat("0.00");
			Float processScore = e.getProcessScore();
			Float midTermScore = e.getMidTermScore();
			Float endTermScore = e.getEndTermScore();
			if (processScore != null) {
				if (processScore >= 0 && processScore <= 10)
					e.setProcessScore(Float.parseFloat(df.format(processScore)));
				else
					e.setProcessScore(null);
			}

			if (midTermScore != null) {
				if (midTermScore >= 0 && midTermScore <= 10)
					e.setMidTermScore(Float.parseFloat(df.format(midTermScore)));
				else
					e.setMidTermScore(null);
			}

			if (endTermScore != null) {
				if (endTermScore >= 0 && endTermScore <= 10)
					e.setEndTermScore(Float.parseFloat(df.format(endTermScore)));
				else
					e.setEndTermScore(null);
			}

			studentScoreDAO.insert(e);
		});
		return true;
	}

	@Override
	public ScoreDashboardDTO getScoreDashboard(Long semesterId, Long studentId) {
		ScoreDashboardDTO scoreDashboard = new ScoreDashboardDTO();
		StudentDTO studentDTO = studentDAO.findOneById(studentId);
		Long classId = studentDTO.getClassId();
		if (semesterId == -1) {
			List<SemesterDTO> semesters = semesterDAO.findByClass(classId);
			semesters.forEach(s -> {
				List<StudentScoreDTO> studentScores = studentScoreDAO.findScoreDashboard(s.getId(), studentId, classId);
				studentScores = setFinalScore(studentScores);
				scoreDashboard.putData(s.getId(), studentScores);
				scoreDashboard.updateAverageScore();
			});
		} else {
			List<StudentScoreDTO> studentScores = studentScoreDAO.findScoreDashboard(semesterId, studentId, classId);
			studentScores = setFinalScore(studentScores);
			scoreDashboard.putData(semesterId, studentScores);
			scoreDashboard.updateAverageScore();
		}
		return scoreDashboard;
	}

	private List<StudentScoreDTO> setFinalScore(List<StudentScoreDTO> studentScores) {
		studentScores.forEach(e -> {
			Float processScore = e.getProcessScore();
			Float midTermScore = e.getMidTermScore();
			Float endTermScore = e.getEndTermScore();
			if (processScore != null && midTermScore != null && endTermScore != null) {
				float total = (processScore * 20 / 100) + (midTermScore * 30 / 100) + (endTermScore * 50 / 100);
				DecimalFormat df = new DecimalFormat("0.00");
				total = Float.parseFloat(df.format(total));
				e.setFinalScore(total);
			} else
				e.setFinalScore(null);
		});
		return studentScores;
	}
}
