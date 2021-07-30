package com.jwat.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.jwat.dao.ILecturerDAO;
import com.jwat.dto.LecturerDTO;
import com.jwat.service.ILecturerService;

public class LecturerService implements ILecturerService {

	@Inject
	private ILecturerDAO lecturerDao;

	@Override
	public List<LecturerDTO> findByFacultyId(long id) {
		return lecturerDao.findByFacultyId(id);
	}

}
