package com.jwat.dao;

import java.util.List;

import com.jwat.dto.DepartmentDTO;

public interface IDepartmentDAO {

	List<DepartmentDTO> findAll();

	DepartmentDTO findOneById(long id);

	Long insert(DepartmentDTO departmentDTO);

	boolean delete(Long id);

	boolean update(DepartmentDTO departmentDTO);

	List<DepartmentDTO> findByFacultyId(Long facultyId);
}
