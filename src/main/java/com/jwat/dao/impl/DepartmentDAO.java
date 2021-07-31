package com.jwat.dao.impl;

import java.util.List;

import com.jwat.dao.IDepartmentDAO;
import com.jwat.dto.DepartmentDTO;
import com.jwat.mapper.DepartmentMapper;

public class DepartmentDAO extends AbstractDAO<DepartmentDTO> implements IDepartmentDAO {

	@Override
	public List<DepartmentDTO> findAll() {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT D.*, F.name AS 'faculty', L.lecturer ");
		sql.append("FROM (department D JOIN faculty F ON D.faculty_id = F.id) ");
		sql.append("LEFT JOIN (SELECT L.id, CONCAT(DE.code, ' ', U.fullname) AS 'lecturer' ");
		sql.append("FROM lecturer L JOIN degree DE ON L.degree_id = DE.id  JOIN user U ON L.user_id = U.id) L ON D.lecturer_id = L.id");
		return query(sql.toString(), new DepartmentMapper());
	}

	@Override
	public DepartmentDTO findOneById(long id) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT D.*, F.name AS 'faculty', L.lecturer ");
		sql.append("FROM (department D JOIN faculty F ON D.faculty_id = F.id) ");
		sql.append("LEFT JOIN (SELECT L.id, CONCAT(DE.code, ' ', U.fullname) AS 'lecturer' ");
		sql.append("FROM lecturer L JOIN degree DE ON L.degree_id = DE.id  JOIN user U ON L.user_id = U.id) L ON D.lecturer_id = L.id ");
		sql.append("WHERE D.id = ?");
		List<DepartmentDTO> faculties = query(sql.toString(), new DepartmentMapper(), id);
		return faculties.isEmpty() ? null : faculties.get(0);
	}

	@Override
	public Long insert(DepartmentDTO departmentDTO) {
		String sql = "INSERT INTO department (name, code, faculty_id) VALUES (?,?,?)";
		return insert(sql, departmentDTO.getName(), departmentDTO.getCode(), departmentDTO.getFacultyId());
	}

	@Override
	public boolean delete(Long id) {
		String sql = "DELETE FROM department WHERE id = ?";
		return update(sql, id);
	}

	@Override
	public boolean update(DepartmentDTO departmentDTO) {
		String sql;
		if(departmentDTO.getLecturerId() == null) {
			sql = "UPDATE department SET name = ?, code = ?, faculty_id = ? WHERE id = ?";
			return update(sql, departmentDTO.getName(), departmentDTO.getCode(), departmentDTO.getFacultyId(), departmentDTO.getId());
		} else {
			sql = "UPDATE department SET name = ?, code = ?, faculty_id = ?, lecturer_id = ? WHERE id = ?";
			return update(sql, departmentDTO.getName(), departmentDTO.getCode(), departmentDTO.getFacultyId(), departmentDTO.getLecturerId(), departmentDTO.getId());
		}
		
	}

	@Override
	public List<DepartmentDTO> findByFacultyId(Long facultyId) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT D.*, F.name AS 'faculty', L.lecturer ");
		sql.append("FROM (department D JOIN faculty F ON D.faculty_id = F.id) ");
		sql.append("LEFT JOIN (SELECT L.id, CONCAT(DE.code, ' ', U.fullname) AS 'lecturer' ");
		sql.append("FROM lecturer L JOIN degree DE ON L.degree_id = DE.id  JOIN user U ON L.user_id = U.id) L ON D.lecturer_id = L.id ");
		sql.append("WHERE D.faculty_id = ?");
		return query(sql.toString(), new DepartmentMapper(), facultyId);
	}
}
