package com.jwat.service;

import java.util.List;

import com.jwat.dto.SemesterDTO;

public interface ISemesterService {
	
	List<SemesterDTO> findAll();

	List<SemesterDTO> getSemestersAssignLecturer(Long id);
	
	List<SemesterDTO> findByClass(Long classId);

}
