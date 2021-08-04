package com.jwat.service;

import java.util.List;

import com.jwat.dto.DegreeDTO;
import com.jwat.dto.LecturerDTO;

public interface ILecturerService {

	List<LecturerDTO> findByFacultyId(long id);

	List<LecturerDTO> findByDepartmentId(long id);
	
	List<LecturerDTO> findByDepartmentIdAndStatus(long id, int status);
	
	List<LecturerDTO> findAll();
	
	LecturerDTO findOneById(long id);
	
	LecturerDTO findOneByUserId(long userId);

	List<DegreeDTO> findAllDegrees();

	LecturerDTO insert(LecturerDTO lecturerDTO);

	LecturerDTO update(LecturerDTO lecturerDTO);

	List<LecturerDTO> findBySemesterAndSubject(Long semesterId, Long subjectId);
	
}
