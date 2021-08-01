package com.jwat.dao;

import java.util.List;

import com.jwat.dto.StudentDTO;

public interface IStudentDAO {

	List<StudentDTO> findAll();

	StudentDTO findOneById(long id);

	Long insert(StudentDTO studentDTO);

	boolean update(StudentDTO studentDTO);
}
