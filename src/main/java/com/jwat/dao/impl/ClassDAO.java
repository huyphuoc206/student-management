package com.jwat.dao.impl;

import java.util.List;

import com.jwat.dao.IClassDAO;
import com.jwat.dto.ClassDTO;
import com.jwat.mapper.ClassMapper;

public class ClassDAO extends AbstractDAO<ClassDTO> implements IClassDAO {

	@Override
	public List<ClassDTO> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ClassDTO findOneById(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long insert(ClassDTO classDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(Long id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(ClassDTO classDTO) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ClassDTO> findByFacultyId(Long facultyId) {
		String sql = "SELECT C.*, F.name AS 'faculty' FROM class C JOIN faculty F ON C.faculty_id = F.id WHERE F.id = ?";
		return query(sql, new ClassMapper(), facultyId);
	}

}
