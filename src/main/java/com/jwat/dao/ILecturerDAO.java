package com.jwat.dao;

import java.util.List;

import com.jwat.dto.LecturerDTO;

public interface ILecturerDAO {

	List<LecturerDTO> findByFacultyId(long id);
}
