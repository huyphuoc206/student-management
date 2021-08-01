package com.jwat.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.jwat.dao.IStudentDAO;
import com.jwat.dao.IUserDAO;
import com.jwat.dto.StudentDTO;
import com.jwat.dto.UserDTO;
import com.jwat.service.IStudentService;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudentDTO update(StudentDTO studentDTO) {
		UserDTO user = userDAO.findOneByEmail(studentDTO.getUser().getEmail());
		if (user == null || user.getId() == studentDTO.getUser().getId()) {
			if (studentDAO.update(studentDTO))
				return studentDAO.findOneById(studentDTO.getId());
		}
		return null;
	}
}
