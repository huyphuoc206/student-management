package com.jwat.dao.impl;

import java.util.List;

import com.jwat.dao.ISemesterDAO;
import com.jwat.dto.SemesterDTO;
import com.jwat.mapper.SemesterMapper;

public class SemesterDAO extends AbstractDAO<SemesterDTO> implements ISemesterDAO {

	@Override
	public List<SemesterDTO> findAll() {
		String sql = "SELECT * FROM semester";
		return query(sql, new SemesterMapper());
	}

}
