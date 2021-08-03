package com.jwat.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.jwat.dao.IClassDAO;
import com.jwat.dto.ClassAssignDTO;
import com.jwat.dto.ClassDTO;
import com.jwat.service.IClassService;

public class ClassService implements IClassService {

	@Inject
	private IClassDAO classDAO;

	@Override
	public List<ClassDTO> findByFacultyId(Long facultyId) {
		return classDAO.findByFacultyId(facultyId);
	}

	@Override
	public List<ClassDTO> findAll() {
		return classDAO.findAll();
	}

	@Override
	public ClassDTO findOneById(long id) {
		return classDAO.findOneById(id);
	}

	@Override
	public ClassDTO insert(ClassDTO classDTO) {
		Long id = classDAO.insert(classDTO);
		return classDAO.findOneById(id);
	}

	@Override
	public boolean delete(Long id) {
		return classDAO.delete(id);
	}

	@Override
	public ClassDTO update(ClassDTO classDTO) {
		if (classDAO.update(classDTO))
			return classDAO.findOneById(classDTO.getId());
		return null;
	}

	@Override
	public Long[] findClassAssign(Long subjectAssignId) {
		List<ClassAssignDTO> classAssignDTOs = classDAO.findClassAssigns(subjectAssignId);
		if (classAssignDTOs == null || classAssignDTOs.isEmpty())
			return null;
		Long[] classIds = new Long[classAssignDTOs.size()];
		for (int i = 0; i < classIds.length; i++) {
			classIds[i] = classAssignDTOs.get(i).getClassId();
		}
		return classIds;
	}

	@Override
	public boolean assignClass(ClassAssignDTO classAssignDTO) {
		List<ClassAssignDTO> classAssignDTOs = classDAO.findClassAssigns(classAssignDTO.getSubjectAssignId());
		for (ClassAssignDTO c : classAssignDTOs)
			classDAO.deleteClassAssign(c);

		Long[] classIds = classAssignDTO.getClassIds();
		if (classIds != null) {
			for (Long id : classIds) {
				ClassAssignDTO dto = new ClassAssignDTO();
				dto.setClassId(id);
				dto.setSubjectAssignId(classAssignDTO.getSubjectAssignId());
				classDAO.insertClassAssign(dto);
			}

		}
		return true;
	}

	@Override
	public long count() {
		return classDAO.count();
	}

}
