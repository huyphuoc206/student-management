package com.jwat.dao;

import java.util.List;

import com.jwat.dto.SemesterDTO;

public interface ISemesterDAO {

	List<SemesterDTO> findAll();

	List<SemesterDTO> getSemestersAssignLecturer(Long id);

}