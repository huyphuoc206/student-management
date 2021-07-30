package com.jwat.service;

import java.util.List;

import com.jwat.dto.LecturerDTO;

public interface ILecturerService {

	List<LecturerDTO> findByFacultyId(long id);
	
}
