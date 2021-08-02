package com.jwat.service;

import java.util.List;

import com.jwat.dto.DegreeDTO;
import com.jwat.dto.LecturerDTO;

public interface ILecturerService {

	List<LecturerDTO> findByFacultyId(long id);

	List<LecturerDTO> findByDepartmentId(long id);
	
	List<LecturerDTO> findAll();
	
	LecturerDTO findOneById(long id);

	List<DegreeDTO> findAllDegrees();

	LecturerDTO insert(LecturerDTO lecturerDTO);

	LecturerDTO update(LecturerDTO lecturerDTO);
	
}
