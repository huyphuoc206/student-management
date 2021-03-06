package com.jwat.service;

import java.util.List;

import com.jwat.dto.ClassAssignDTO;
import com.jwat.dto.ClassDTO;

public interface IClassService {
	
	List<ClassDTO> findAll();

	ClassDTO findOneById(long id);

	ClassDTO insert(ClassDTO classDTO);

	boolean delete(Long id);

	ClassDTO update(ClassDTO classDTO);

	List<ClassDTO> findByFacultyId(Long facultyId);

	Long[] findClassAssign(Long subjectAssignId);

	boolean assignClass(ClassAssignDTO classAssignDTO);

	long count();

	List<ClassDTO> findBySubjectAssign(Long subjectAssignId);
}
