package com.jwat.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.jwat.dao.IStudentDAO;
import com.jwat.dao.IUserDAO;
import com.jwat.dto.StudentDTO;
import com.jwat.dto.UserDTO;
import com.jwat.service.IStudentService;
import com.jwat.utils.MD5Hashing;

public class StudentService implements IStudentService {

	@Inject
	private IStudentDAO studentDAO;
	@Inject
	private IUserDAO userDAO;

	@Override
	public List<StudentDTO> findAll() {
		return studentDAO.findAll();
	}

	@Override
	public StudentDTO findOneById(long id) {
		return studentDAO.findOneById(id);
	}

	@Override
	public StudentDTO insert(StudentDTO studentDTO) {
		UserDTO user = userDAO.findOneByEmailOrUsernameExcludeId(studentDTO.getUser().getEmail(),
				studentDTO.getUser().getUsername(), null);
		if (user == null) {
			studentDTO.getUser().setStatus(1);
			studentDTO.getUser().setCreatedDate(new Timestamp(System.currentTimeMillis()));
			String password = studentDTO.getUser().getPassword();
			studentDTO.getUser().setPassword(MD5Hashing.hash(password));
			Long id = studentDAO.insert(studentDTO);
			return studentDAO.findOneByUserId(id);
		}
		return null;
	}

	@Override
	public StudentDTO update(StudentDTO studentDTO) {
		UserDTO user = userDAO.findOneByEmailOrUsernameExcludeId(studentDTO.getUser().getEmail(),
				studentDTO.getUser().getUsername(), studentDTO.getUser().getId());
		if (user == null) {
			if (studentDAO.update(studentDTO))
				return studentDAO.findOneById(studentDTO.getId());
		}
		return null;
	}

	@Override
	public List<StudentDTO> findByClassId(long id) {
		return studentDAO.findByClassIdAndStatus(id, 1);
	}

	@Override
	public StudentDTO findOneByUserId(Long id) {
		return studentDAO.findOneByUserId(id);
	}
}
