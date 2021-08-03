package com.jwat.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.jwat.dao.ISubjectDAO;
import com.jwat.dto.SubjectAssignDTO;
import com.jwat.dto.SubjectDTO;
import com.jwat.service.ISubjectService;

public class SubjectService implements ISubjectService {

	@Inject
	private ISubjectDAO subjectDAO;

	@Override
	public List<SubjectDTO> findAll() {
		return subjectDAO.findAll();
	}

	@Override
	public SubjectDTO findOneById(long id) {
		return subjectDAO.findOneById(id);
	}

	@Override
	public SubjectDTO insert(SubjectDTO subjectDTO) {
		Long id = subjectDAO.insert(subjectDTO);
		return subjectDAO.findOneById(id);
	}

	@Override
	public boolean delete(Long id) {
		return subjectDAO.delete(id);
	}

	@Override
	public SubjectDTO update(SubjectDTO subjectDTO) {
		if (subjectDAO.update(subjectDTO))
			return subjectDAO.findOneById(subjectDTO.getId());
		return null;
	}

	@Override
	public List<SubjectDTO> findByFacultyId(Long facultyId) {
		return subjectDAO.findByFacultyId(facultyId);
	}

	@Override
	public List<SubjectDTO> findByDepartmentId(Long departmentId) {
		return subjectDAO.findByDepartmentId(departmentId);
	}

	@Override
	public SubjectAssignDTO assignSubject(SubjectAssignDTO subjectAssignDTO) {
		SubjectAssignDTO subjectAssign = subjectDAO.checkAssign(subjectAssignDTO);

		if (subjectAssign == null) {
			Long id = subjectDAO.assignSubject(subjectAssignDTO);
			return subjectDAO.findSubjectAssignById(id);
		}
		return null;
	}

	@Override
	public boolean deleteSubjectAssign(Long id) {
		return subjectDAO.deleteSubjectAssign(id);
	}

}
