package com.jwat.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.jwat.dao.IDepartmentDAO;
import com.jwat.dto.DepartmentDTO;
import com.jwat.service.IDepartmentService;

public class DepartmentService implements IDepartmentService {

	@Inject
	private IDepartmentDAO departmentDAO;

	@Override
	public List<DepartmentDTO> findAll() {
		return departmentDAO.findAll();
	}

	@Override
	public DepartmentDTO findOneById(long id) {
		return departmentDAO.findOneById(id);
	}

	@Override
	public DepartmentDTO insert(DepartmentDTO departmentDTO) {
		Long id = departmentDAO.insert(departmentDTO);
		return departmentDAO.findOneById(id);
	}

	@Override
	public boolean delete(Long id) {
		return departmentDAO.delete(id);
	}

	@Override
	public DepartmentDTO update(DepartmentDTO departmentDTO) {
		if (departmentDAO.update(departmentDTO))
			return departmentDAO.findOneById(departmentDTO.getId());
		return null;
	}

	@Override
	public List<DepartmentDTO> findByFacultyId(Long facultyId) {
		return departmentDAO.findByFacultyId(facultyId);
	}

	@Override
	public long count() {
		return departmentDAO.count();
	}

}
