package com.jwat.service;

import java.util.List;

import com.jwat.dto.DepartmentDTO;

public interface IDepartmentService {

	List<DepartmentDTO> findAll();

	DepartmentDTO findOneById(long id);

	DepartmentDTO insert(DepartmentDTO departmentDTO);

	boolean delete(Long id);

	DepartmentDTO update(DepartmentDTO departmentDTO);

	List<DepartmentDTO> findByFacultyId(Long facultyId);

	long count();
}
