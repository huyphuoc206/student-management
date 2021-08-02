package com.jwat.dao.impl;

import java.util.List;

import com.jwat.dao.ILecturerDAO;
import com.jwat.dto.DegreeDTO;
import com.jwat.dto.LecturerDTO;
import com.jwat.dto.UserDTO;
import com.jwat.mapper.DegreeMapper;
import com.jwat.mapper.LecturerMapper;

public class LecturerDAO extends AbstractDAO<LecturerDTO> implements ILecturerDAO {

	@Override
	public List<LecturerDTO> findByFacultyId(long id) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT U.*, L.id AS 'lecturer_id', L.department_id, D.name AS 'department_name', ");
		sql.append("L.degree_id, DE.name AS 'degree_name', DE.code AS 'degree_code', D.faculty_id, F.name AS 'faculty_name' ");
		sql.append("FROM user U, lecturer L, department D, degree DE, faculty F ");
		sql.append("WHERE U.id = L.user_id AND L.department_id = D.id AND D.faculty_id = F.id AND L.degree_id = DE.id AND D.faculty_id = ?");
		return query(sql.toString(), new LecturerMapper(), id);
	}

	@Override
	public List<LecturerDTO> findByDepartmentId(long id) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT U.*, L.id AS 'lecturer_id', L.department_id, D.name AS 'department_name', ");
		sql.append("L.degree_id, DE.name AS 'degree_name', DE.code AS 'degree_code', D.faculty_id, F.name AS 'faculty_name' ");
		sql.append("FROM user U, lecturer L, department D, degree DE, faculty F ");
		sql.append("WHERE U.id = L.user_id AND L.department_id = D.id AND D.faculty_id = F.id AND L.degree_id = DE.id AND L.department_id = ?");
		return query(sql.toString(), new LecturerMapper(), id);
	}

	@Override
	public List<LecturerDTO> findAll() {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT U.*, L.id AS 'lecturer_id', L.department_id, D.name AS 'department_name', ");
		sql.append("L.degree_id, DE.name AS 'degree_name', DE.code AS 'degree_code', D.faculty_id, F.name AS 'faculty_name' ");
		sql.append("FROM user U, lecturer L, department D, degree DE, faculty F ");
		sql.append("WHERE U.id = L.user_id AND L.department_id = D.id AND D.faculty_id = F.id AND L.degree_id = DE.id");
		return query(sql.toString(), new LecturerMapper());
	}

	@Override
	public LecturerDTO findOneById(long id) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT U.*, L.id AS 'lecturer_id', L.department_id, D.name AS 'department_name', ");
		sql.append("L.degree_id, DE.name AS 'degree_name', DE.code AS 'degree_code', D.faculty_id, F.name AS 'faculty_name' ");
		sql.append("FROM user U, lecturer L, department D, degree DE, faculty F ");
		sql.append("WHERE U.id = L.user_id AND L.department_id = D.id AND D.faculty_id = F.id AND L.degree_id = DE.id AND L.id = ?");
		List<LecturerDTO> lecturers = query(sql.toString(), new LecturerMapper(), id);
		return lecturers.isEmpty() ? null : lecturers.get(0);
	}

	@Override
	public List<DegreeDTO> findAllDegrees() {
		String sql = "SELECT * FROM degree";
		return query(sql, new DegreeMapper());
	}

	@Override
	public Long insert(LecturerDTO lecturerDTO) {
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO user (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) ");
		sql.append("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?); ");
		sql.append("INSERT INTO lecturer (`degree_id`, `user_id`, `department_id`) ");
		sql.append("VALUES (?, LAST_INSERT_ID(), ?);");
		UserDTO user = lecturerDTO.getUser();
		return insert(sql.toString(), user.getUsername(), user.getPassword(), user.getFullname(), user.getDob(), user.getGender(), user.getEmail(),
				user.getPhoneNumber(), user.getStatus(), user.getCreatedDate(), 2, lecturerDTO.getDegreeId(), lecturerDTO.getDepartmentId());
	}

	@Override
	public LecturerDTO findOneByUserId(Long id) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT U.*, L.id AS 'lecturer_id', L.department_id, D.name AS 'department_name', ");
		sql.append("L.degree_id, DE.name AS 'degree_name', DE.code AS 'degree_code', D.faculty_id, F.name AS 'faculty_name' ");
		sql.append("FROM user U, lecturer L, department D, degree DE, faculty F ");
		sql.append("WHERE U.id = L.user_id AND L.department_id = D.id AND D.faculty_id = F.id AND L.degree_id = DE.id AND L.user_id = ?");
		List<LecturerDTO> lecturers = query(sql.toString(), new LecturerMapper(), id);
		return lecturers.isEmpty() ? null : lecturers.get(0);
	}

	@Override
	public boolean update(LecturerDTO lecturerDTO) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE lecturer SET department_id = ?, degree_id = ? WHERE id = ?; ");
		sql.append("UPDATE user SET username = ?, fullname = ?, email = ?, gender = ?, phone_number = ?, dob = ?, status = ?  WHERE id = ?");
		UserDTO user = lecturerDTO.getUser();
		return update(sql.toString(), lecturerDTO.getDepartmentId(), lecturerDTO.getDegreeId(), lecturerDTO.getId(), user.getUsername(),
				user.getFullname(), user.getEmail(), user.getGender(),
				user.getPhoneNumber(), user.getDob(), user.getStatus(), user.getId());
	}
}
