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
		return classDAO.findAll();
	}

	@Override
	public ClassDTO findOneById(long id) {
		return classDAO.findOneById(id);
	}

	@Override
	public ClassDTO insert(ClassDTO classDTO) {
		Long id = classDAO.insert(classDTO);
		return classDAO.findOneById(id);
	}

	@Override
	public boolean delete(Long id) {
		return classDAO.delete(id);
	}

	@Override
	public ClassDTO update(ClassDTO classDTO) {
		if (classDAO.update(classDTO))
			return classDAO.findOneById(classDTO.getId());
		return null;
	}

}
