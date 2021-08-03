package com.jwat.dao.impl;

import java.util.List;

import com.jwat.dao.ISubjectDAO;
import com.jwat.dto.SubjectAssignDTO;
import com.jwat.dto.SubjectDTO;
import com.jwat.mapper.SubjectAssignMapper;
import com.jwat.mapper.SubjectMapper;

public class SubjectDAO extends AbstractDAO<SubjectDTO> implements ISubjectDAO {

	@Override
	public List<SubjectDTO> findAll() {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT S.*, D.faculty_id, D.name AS 'department_name', F.name AS 'faculty_name' ");
		sql.append("FROM subject S JOIN department D ON S.department_id = D.id ");
		sql.append("JOIN faculty F ON D.faculty_id = F.id");
		return query(sql.toString(), new SubjectMapper());
	}

	@Override
	public SubjectDTO findOneById(long id) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT S.*, D.faculty_id, D.name AS 'department_name', F.name AS 'faculty_name' ");
		sql.append("FROM subject S JOIN department D ON S.department_id = D.id ");
		sql.append("JOIN faculty F ON D.faculty_id = F.id WHERE S.id = ?");
		List<SubjectDTO> subjects = query(sql.toString(), new SubjectMapper(), id);
		return subjects.isEmpty() ? null : subjects.get(0);
	}

	@Override
	public Long insert(SubjectDTO subjectDTO) {
		String sql = "INSERT INTO subject (name, code, department_id) VALUES (?,?,?)";
		return insert(sql, subjectDTO.getName(), subjectDTO.getCode(), subjectDTO.getDepartmentId());
	}

	@Override
	public boolean delete(Long id) {
		String sql = "DELETE FROM subject WHERE id = ?";
		return update(sql, id);
	}

	@Override
	public boolean update(SubjectDTO subjectDTO) {
		String sql = "UPDATE subject SET name = ?, code = ?, department_id = ? WHERE id = ?";
		return update(sql, subjectDTO.getName(), subjectDTO.getCode(), subjectDTO.getDepartmentId(), subjectDTO.getId());
	}

	@Override
	public List<SubjectDTO> findByFacultyId(Long facultyId) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT S.*, D.faculty_id, D.name AS 'department_name', F.name AS 'faculty_name' ");
		sql.append("FROM subject S JOIN department D ON S.department_id = D.id ");
		sql.append("JOIN faculty F ON D.faculty_id = F.id WHERE D.faculty_id = ?");
		return query(sql.toString(), new SubjectMapper(), facultyId);
	}

	@Override
	public List<SubjectDTO> findByDepartmentId(Long departmentId) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT S.*, D.faculty_id, D.name AS 'department_name', F.name AS 'faculty_name' ");
		sql.append("FROM subject S JOIN department D ON S.department_id = D.id ");
		sql.append("JOIN faculty F ON D.faculty_id = F.id WHERE S.department_id = ?");
		return query(sql.toString(), new SubjectMapper(), departmentId);
	}

	@Override
	public SubjectAssignDTO checkAssign(SubjectAssignDTO subjectAssignDTO) {
		String sql = "SELECT * FROM lecturer_subject WHERE lecturer_id = ? AND subject_id = ? AND semester_id = ?";
		List<SubjectAssignDTO> subjectAssigns = query(sql, new SubjectAssignMapper(), subjectAssignDTO.getLecturerId(), subjectAssignDTO.getSubjectId(), subjectAssignDTO.getSemesterId());
		return subjectAssigns.isEmpty() ? null : subjectAssigns.get(0);
	}

	@Override
	public Long assignSubject(SubjectAssignDTO subjectAssignDTO) {
		String sql = "INSERT INTO lecturer_subject (lecturer_id, subject_id, semester_id) VALUES (?,?,?)";
		return insert(sql, subjectAssignDTO.getLecturerId(), subjectAssignDTO.getSubjectId(), subjectAssignDTO.getSemesterId());
	}

	@Override
	public SubjectAssignDTO findSubjectAssignById(Long id) {
		String sql = "SELECT * FROM lecturer_subject WHERE id = ?";
		List<SubjectAssignDTO> subjectAssigns = query(sql, new SubjectAssignMapper(), id);
		return subjectAssigns.isEmpty() ? null : subjectAssigns.get(0);
	}

	@Override
	public SubjectAssignDTO findSubjectAssign(SubjectAssignDTO subjectAssignDTO) {
		String sql = "SELECT * FROM lecturer_subject WHERE lecturer_id = ? AND subject_id = ? AND semester_id = ?";
		List<SubjectAssignDTO> subjectAssigns = query(sql, new SubjectAssignMapper(), subjectAssignDTO.getLecturerId(), subjectAssignDTO.getSubjectId(), subjectAssignDTO.getSemesterId());
		return subjectAssigns.isEmpty() ? null : subjectAssigns.get(0);
	}

	@Override
	public boolean deleteSubjectAssign(Long id) {
		String sql = "DELETE FROM lecturer_subject WHERE id = ?";
		return update(sql, id);
	}

}
