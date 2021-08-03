package com.jwat.dao.impl;

import java.util.List;

import com.jwat.dao.IFacultyDAO;
import com.jwat.dto.FacultyDTO;
import com.jwat.mapper.FacultyMapper;

public class FacultyDAO extends AbstractDAO<FacultyDTO> implements IFacultyDAO {

	@Override
	public List<FacultyDTO> findAll() {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT F.*, L.fullname FROM faculty F LEFT JOIN ");
		sql.append("(SELECT L.id, CONCAT(D.code, ' ', U.fullname) AS 'fullname' FROM lecturer L JOIN user U ON L.user_id = U.id JOIN degree D ON L.degree_id = D.id) L ");
		sql.append("ON F.lecturer_id = L.id");
		return query(sql.toString(), new FacultyMapper());
	}

	@Override
	public FacultyDTO findOneById(long id) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT F.*, L.fullname FROM faculty F LEFT JOIN ");
		sql.append("(SELECT L.id, U.fullname FROM lecturer L JOIN user U ON L.user_id = U.id) L ");
		sql.append("ON F.lecturer_id = L.id WHERE F.id = ?");
		List<FacultyDTO> faculties = query(sql.toString(), new FacultyMapper(), id);
		return faculties.isEmpty() ? null : faculties.get(0);
	}

	@Override
	public Long insert(FacultyDTO facultyDTO) {
		String sql = "INSERT INTO faculty (name, code) VALUES (?,?)";
		return insert(sql, facultyDTO.getName(), facultyDTO.getCode());
	}

	@Override
	public boolean delete(Long id) {
		String sql = "DELETE FROM faculty WHERE id = ?";
		return update(sql, id);
	}

	@Override
	public boolean update(FacultyDTO facultyDTO) {
		String sql;
		if(facultyDTO.getLecturerId() == null) {
			sql = "UPDATE faculty SET name = ?, code = ? WHERE id = ?";
			return update(sql, facultyDTO.getName(), facultyDTO.getCode(), facultyDTO.getId());
		} else {
			sql = "UPDATE faculty SET name = ?, code = ?, lecturer_id = ? WHERE id = ?";
			return update(sql, facultyDTO.getName(), facultyDTO.getCode(), facultyDTO.getLecturerId(), facultyDTO.getId());
		}
		
	}

	@Override
	public long count() {
		String sql = "SELECT COUNT(*) FROM faculty";
		return count(sql);
	}
}
