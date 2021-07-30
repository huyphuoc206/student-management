package com.jwat.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.jwat.dao.IFacultyDAO;
import com.jwat.dto.FacultyDTO;
import com.jwat.service.IFacultyService;

public class FacultyService implements IFacultyService {

	@Inject
	private IFacultyDAO facultyDAO;

	@Override
	public List<FacultyDTO> findAll() {
		return facultyDAO.findAll();
	}

	@Override
	public FacultyDTO findOneById(long id) {
		return facultyDAO.findOneById(id);
	}

	@Override
	public FacultyDTO insert(FacultyDTO facultyDTO) {
		Long id = facultyDAO.insert(facultyDTO);
		return facultyDAO.findOneById(id);
	}

	@Override
	public boolean delete(Long id) {
		return facultyDAO.delete(id);
	}

	@Override
	public FacultyDTO update(FacultyDTO facultyDTO) {
		if (facultyDAO.update(facultyDTO))
			return facultyDAO.findOneById(facultyDTO.getId());
		return null;
	}

}
