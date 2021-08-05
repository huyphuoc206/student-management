package com.jwat.service;

import java.util.List;

import com.jwat.dto.StudentDTO;

public interface IStudentService {

	List<StudentDTO> findAll();

	StudentDTO findOneById(long id);

	StudentDTO insert(StudentDTO studentDTO);

	StudentDTO update(StudentDTO studentDTO);

	List<StudentDTO> findByClassId(long id);

	StudentDTO findOneByUserId(Long id);
}
