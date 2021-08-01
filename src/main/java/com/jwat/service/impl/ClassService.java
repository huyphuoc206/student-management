package com.jwat.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.jwat.dao.IClassDAO;
import com.jwat.dto.ClassDTO;
import com.jwat.service.IClassService;

public class ClassService implements IClassService {

	@Inject
	private IClassDAO classDAO;

	@Override
	public List<ClassDTO> findByFacultyId(Long facultyId) {
		return classDAO.findByFacultyId(facultyId);
	}

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
	public ClassDTO insert(ClassDTO classDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(Long id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ClassDTO update(ClassDTO classDTO) {
		// TODO Auto-generated method stub
		return null;
	}

}
