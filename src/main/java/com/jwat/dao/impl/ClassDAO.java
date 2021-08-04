package com.jwat.dao.impl;

import java.util.List;

import com.jwat.dao.IClassDAO;
import com.jwat.dto.ClassAssignDTO;
import com.jwat.dto.ClassDTO;
import com.jwat.mapper.ClassAssignMapper;
import com.jwat.mapper.ClassMapper;

public class ClassDAO extends AbstractDAO<ClassDTO> implements IClassDAO {

	@Override
	public List<ClassDTO> findAll() {
		String sql = "SELECT C.*, F.name AS 'faculty' FROM class C JOIN faculty F ON C.faculty_id = F.id";
		return query(sql, new ClassMapper());
	}

	@Override
	public ClassDTO findOneById(long id) {
		String sql = "SELECT C.*, F.name AS 'faculty' FROM class C JOIN faculty F ON C.faculty_id = F.id WHERE C.id = ?";
		List<ClassDTO> classDTOs = query(sql, new ClassMapper(), id);
		return classDTOs.isEmpty() ? null : classDTOs.get(0);
	}

	@Override
	public Long insert(ClassDTO classDTO) {
		String sql = "INSERT INTO class (name, code, school_year, faculty_id) VALUES (?,?,?,?)";
		return insert(sql, classDTO.getName(), classDTO.getCode(), classDTO.getSchoolYear(), classDTO.getFacultyId());
	}

	@Override
	public boolean delete(Long id) {
		String sql = "DELETE FROM class WHERE id = ?";
		return update(sql, id);
	}

	@Override
	public boolean update(ClassDTO classDTO) {
		String sql = "UPDATE class SET name = ?, code = ?, school_year = ?, faculty_id = ? WHERE id = ?";
		return update(sql, classDTO.getName(), classDTO.getCode(), classDTO.getSchoolYear(), classDTO.getFacultyId(), classDTO.getId());
	}

	@Override
	public List<ClassDTO> findByFacultyId(Long facultyId) {
		String sql = "SELECT C.*, F.name AS 'faculty' FROM class C JOIN faculty F ON C.faculty_id = F.id WHERE F.id = ?";
		return query(sql, new ClassMapper(), facultyId);
	}

	@Override
	public List<ClassAssignDTO> findClassAssigns(Long subjectAssignId) {
		String sql = "SELECT * FROM lecturer_class WHERE lecturer_subject_id = ?";
		return query(sql, new ClassAssignMapper(), subjectAssignId);
	}

	@Override
	public boolean deleteClassAssign(ClassAssignDTO classAssignDTO) {
		String sql = "DELETE FROM lecturer_class WHERE lecturer_subject_id = ? AND class_id = ?";
		return update(sql, classAssignDTO.getSubjectAssignId(), classAssignDTO.getClassId());
	}

	@Override
	public void insertClassAssign(ClassAssignDTO dto) {
		String sql = "INSERT INTO lecturer_class (lecturer_subject_id, class_id) VALUES (?,?)";
		insert(sql, dto.getSubjectAssignId(), dto.getClassId());
	}
	
	@Override
	public long count() {
		String sql = "SELECT COUNT(*) FROM class";
		return count(sql);
	}

	@Override
	public List<ClassDTO> findBySubjectAssign(Long subjectAssignId) {
		String sql = "SELECT C.* FROM class C JOIN lecturer_class LC ON C.id = LC.class_id WHERE LC.lecturer_subject_id = ?";
		return query(sql, new ClassMapper(), subjectAssignId);
	}
}
