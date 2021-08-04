package com.jwat.dao.impl;

import java.util.List;

import com.jwat.dao.IStudentScoreDAO;
import com.jwat.dto.StudentScoreDTO;
import com.jwat.mapper.StudentScoreMapper;

public class StudentScoreDAO extends AbstractDAO<StudentScoreDTO> implements IStudentScoreDAO {

	@Override
	public List<StudentScoreDTO> findAll(Long subjectAssignId, Long classId) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT S.id, U.username, U.fullname, SC.lecturer_subject_id, SC.process_score, SC.midterm_score, SC.endterm_score ");
		sql.append("FROM (class C JOIN student S ON C.id = S.class_id JOIN user U ON U.id = S.user_id) ");
		sql.append("LEFT JOIN  (SELECT * FROM score WHERE lecturer_subject_id = ?) SC ON S.id = SC.student_id ");
		sql.append("WHERE C.id = ? AND U.status = 1");
		return query(sql.toString(), new StudentScoreMapper(), subjectAssignId, classId);
	}

	@Override
	public void delete(Long studentId, Long subjectAssignId) {
		String sql = "DELETE FROM score WHERE student_id = ? AND lecturer_subject_id = ?";
		update(sql, studentId, subjectAssignId);
	}

	@Override
	public void insert(StudentScoreDTO e) {
		String sql = "INSERT INTO score VALUES (?, ?, ?, ?, ?)";
		insert(sql, e.getStudentId(), e.getSubjectAssignId(), e.getProcessScore(), e.getMidTermScore(), e.getEndTermScore());
	}

}
