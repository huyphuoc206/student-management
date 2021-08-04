package com.jwat.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.jwat.dao.ISemesterDAO;
import com.jwat.dto.SemesterDTO;
import com.jwat.service.ISemesterService;

public class SemesterService implements ISemesterService {
	
	@Inject
	private ISemesterDAO semesterDAO;

	@Override
	public List<SemesterDTO> findAll() {
		return semesterDAO.findAll();
	}

	@Override
	public List<SemesterDTO> getSemestersAssignLecturer(Long id) {
		return semesterDAO.getSemestersAssignLecturer(id);
	}
}
