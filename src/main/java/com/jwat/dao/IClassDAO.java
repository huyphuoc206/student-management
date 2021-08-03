package com.jwat.dao;

import java.util.List;

import com.jwat.dto.ClassAssignDTO;
import com.jwat.dto.ClassDTO;

public interface IClassDAO {

	List<ClassDTO> findAll();

	ClassDTO findOneById(long id);

	Long insert(ClassDTO classDTO);

	boolean delete(Long id);

	boolean update(ClassDTO classDTO);

	List<ClassDTO> findByFacultyId(Long facultyId);
	
	List<ClassAssignDTO> findClassAssigns(Long subjectAssignId);
	
	boolean deleteClassAssign(ClassAssignDTO classAssignDTO);

	void insertClassAssign(ClassAssignDTO dto);

	long count();
}
