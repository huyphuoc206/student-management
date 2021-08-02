package com.jwat.dao.impl;

import java.util.List;

import com.jwat.dao.IClassDAO;
import com.jwat.dto.ClassDTO;
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

}
