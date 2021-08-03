package com.jwat.dao;

import java.util.List;

import com.jwat.dto.FacultyDTO;

public interface IFacultyDAO {

	List<FacultyDTO> findAll();

	FacultyDTO findOneById(long id);

	Long insert(FacultyDTO facultyDTO);

	boolean delete(Long id);

	boolean update(FacultyDTO facultyDTO);

	long count();
}
