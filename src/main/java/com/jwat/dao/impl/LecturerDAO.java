package com.jwat.dao.impl;

import java.util.List;

import com.jwat.dao.ILecturerDAO;
import com.jwat.dto.LecturerDTO;
import com.jwat.mapper.LecturerMapper;

public class LecturerDAO extends AbstractDAO<LecturerDTO> implements ILecturerDAO {

	@Override
	public List<LecturerDTO> findByFacultyId(long id) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT L.id, CONCAT(DE.code, ' ', U.fullname) AS 'HV_GV' ");
		sql.append("FROM user U, lecturer L, department D, degree DE ");
		sql.append("WHERE U.id = L.user_id AND L.degree_id = DE.id AND L.department_id = D.id AND D.faculty_id = ?");
		return query(sql.toString(), new LecturerMapper(), id);
	}

}
