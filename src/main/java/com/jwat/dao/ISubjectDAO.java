package com.jwat.dao;

import java.util.List;

import com.jwat.dto.SubjectAssignDTO;
import com.jwat.dto.SubjectDTO;

public interface ISubjectDAO {

	List<SubjectDTO> findAll();

	SubjectDTO findOneById(long id);

	Long insert(SubjectDTO subjectDTO);

	boolean delete(Long id);

	boolean update(SubjectDTO subjectDTO);

	List<SubjectDTO> findByFacultyId(Long facultyId);

	List<SubjectDTO> findByDepartmentId(Long departmentId);

	SubjectAssignDTO checkAssign(SubjectAssignDTO subjectAssignDTO);

	Long assignSubject(SubjectAssignDTO subjectAssignDTO);

	SubjectAssignDTO findSubjectAssignById(Long id);
	
	SubjectAssignDTO findSubjectAssign(SubjectAssignDTO subjectAssignDTO);

	boolean deleteSubjectAssign(Long id);

	long count();
}
