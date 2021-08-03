package com.jwat.service;

import java.util.List;

import com.jwat.dto.FacultyDTO;

public interface IFacultyService {

	List<FacultyDTO> findAll();

	FacultyDTO findOneById(long id);

	FacultyDTO insert(FacultyDTO facultyDTO);

	boolean delete(Long id);

	FacultyDTO update(FacultyDTO facultyDTO);

	long count();
}
