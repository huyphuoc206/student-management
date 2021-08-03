package com.jwat.service;

import java.util.List;

import com.jwat.dto.SubjectAssignDTO;
import com.jwat.dto.SubjectDTO;

public interface ISubjectService {

	List<SubjectDTO> findAll();

	SubjectDTO findOneById(long id);

	SubjectDTO insert(SubjectDTO subjectDTO);

	boolean delete(Long id);

	SubjectDTO update(SubjectDTO subjectDTO);

	List<SubjectDTO> findByFacultyId(Long facultyId);

	List<SubjectDTO> findByDepartmentId(Long departmentId);

	SubjectAssignDTO assignSubject(SubjectAssignDTO subjectAssignDTO);

	boolean deleteSubjectAssign(Long id);

}
