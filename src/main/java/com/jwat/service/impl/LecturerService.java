package com.jwat.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.jwat.dao.ILecturerDAO;
import com.jwat.dao.ISubjectDAO;
import com.jwat.dao.IUserDAO;
import com.jwat.dto.DegreeDTO;
import com.jwat.dto.LecturerDTO;
import com.jwat.dto.SubjectAssignDTO;
import com.jwat.dto.UserDTO;
import com.jwat.service.ILecturerService;
import com.jwat.utils.MD5Hashing;

public class LecturerService implements ILecturerService {

	@Inject
	private ILecturerDAO lecturerDao;
	@Inject
	private IUserDAO userDAO;
	@Inject
	private ISubjectDAO subjectDAO;
	
	@Override
	public List<LecturerDTO> findByFacultyId(long id) {
		return lecturerDao.findByFacultyId(id);
	}

	@Override
	public List<LecturerDTO> findByDepartmentId(long id) {
		return lecturerDao.findByDepartmentId(id);
	}

	@Override
	public List<LecturerDTO> findByDepartmentIdAndStatus(long id, int status) {
		return lecturerDao.findByDepartmentIdAndStatus(id, status);
	}
	
	@Override
	public List<LecturerDTO> findAll() {
		return lecturerDao.findAll();
	}

	@Override
	public LecturerDTO findOneById(long id) {
		return lecturerDao.findOneById(id);
	}

	@Override
	public List<DegreeDTO> findAllDegrees() {
		return lecturerDao.findAllDegrees();
	}

	@Override
	public LecturerDTO insert(LecturerDTO lecturerDTO) {
		UserDTO user = userDAO.findOneByEmailOrUsernameExcludeId(lecturerDTO.getUser().getEmail(),
				lecturerDTO.getUser().getUsername(), null);
		if (user == null) {
			lecturerDTO.getUser().setStatus(1);
			lecturerDTO.getUser().setCreatedDate(new Timestamp(System.currentTimeMillis()));
			String password = lecturerDTO.getUser().getPassword();
			lecturerDTO.getUser().setPassword(MD5Hashing.hash(password));
			Long id = lecturerDao.insert(lecturerDTO);
			return lecturerDao.findOneByUserId(id);
		}
		return null;
	}

	@Override
	public LecturerDTO update(LecturerDTO lecturerDTO) {
		UserDTO user = userDAO.findOneByEmailOrUsernameExcludeId(lecturerDTO.getUser().getEmail(),
				lecturerDTO.getUser().getUsername(), lecturerDTO.getUser().getId());
		if (user == null || user.getId() == lecturerDTO.getUser().getId()) {
			if (lecturerDao.update(lecturerDTO))
				return lecturerDao.findOneById(lecturerDTO.getId());
		}
		return null;
	}

	@Override
	public List<LecturerDTO> findBySemesterAndSubject(Long semesterId, Long subjectId) {
		List<LecturerDTO> lecturers = lecturerDao.findBySemesterAndSubject(semesterId, subjectId);
		lecturers.forEach(e -> {
			SubjectAssignDTO subjectAssignDTO = new SubjectAssignDTO();
			subjectAssignDTO.setLecturerId(e.getId());
			subjectAssignDTO.setSemesterId(semesterId);
			subjectAssignDTO.setSubjectId(subjectId);
			subjectAssignDTO = subjectDAO.findSubjectAssign(subjectAssignDTO);
			e.setSubjectAssignId(subjectAssignDTO.getId());
		});
		return lecturers;
	}

	@Override
	public LecturerDTO findOneByUserId(long userId) {
		return lecturerDao.findOneByUserId(userId);
	}
}
