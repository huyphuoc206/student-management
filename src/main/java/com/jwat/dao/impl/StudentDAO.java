package com.jwat.dao.impl;

import java.util.List;

import com.jwat.dao.IStudentDAO;
import com.jwat.dto.StudentDTO;
import com.jwat.dto.UserDTO;
import com.jwat.mapper.StudentMapper;

public class StudentDAO extends AbstractDAO<StudentDTO> implements IStudentDAO {

	@Override
	public List<StudentDTO> findAll() {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT U.*, S.id AS 'student_id', S.class_id, C.school_year, C.faculty_id, C.code AS 'class_code', C.name AS 'class_name', F.name AS 'faculty' ");
		sql.append("FROM user U, student S, class C, faculty F ");
		sql.append("WHERE U.id = S.user_id AND S.class_id = C.id AND C.faculty_id = F.id");
		return query(sql.toString(), new StudentMapper());
	}

	@Override
	public StudentDTO findOneById(long id) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT U.*, S.id AS 'student_id', S.class_id, C.school_year, C.faculty_id, C.code AS 'class_code', C.name AS 'class_name', F.name AS 'faculty' ");
		sql.append("FROM user U, student S, class C, faculty F ");
		sql.append("WHERE U.id = S.user_id AND S.class_id = C.id AND C.faculty_id = F.id AND S.id = ?");
		List<StudentDTO> students = query(sql.toString(), new StudentMapper(), id);
		return students.isEmpty() ? null : students.get(0);
	}

	@Override
	public Long insert(StudentDTO studentDTO) {
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO user (`username`, `password`, `fullname`, `dob`, `gender`, `email`, `phone_number`, `status`, `created_date`, `role_id`) ");
		sql.append("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?); ");
		sql.append("INSERT INTO student (`user_id`, `class_id`) ");
		sql.append("VALUES (LAST_INSERT_ID(), ?);");
		UserDTO user = studentDTO.getUser();
		return insert(sql.toString(), user.getUsername(), user.getPassword(), user.getFullname(), user.getDob(), user.getGender(), user.getEmail(),
				user.getPhoneNumber(), user.getStatus(), user.getCreatedDate(), 3, studentDTO.getClassId());
	}

	@Override
	public boolean update(StudentDTO studentDTO) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE student SET class_id = ? WHERE id = ?; ");
		sql.append("UPDATE user SET username = ?, fullname = ?, email = ?, gender = ?, phone_number = ?, dob = ?, status = ?  WHERE id = ?");
		return update(sql.toString(), studentDTO.getClassId(), studentDTO.getId(), studentDTO.getUser().getUsername(),
				studentDTO.getUser().getFullname(), studentDTO.getUser().getEmail(), studentDTO.getUser().getGender(),
				studentDTO.getUser().getPhoneNumber(), studentDTO.getUser().getDob(), studentDTO.getUser().getStatus(),
				studentDTO.getUser().getId());
	}

	@Override
	public List<StudentDTO> findByClassIdAndStatus(long id, int status) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT U.*, S.id AS 'student_id', S.class_id, C.school_year, C.faculty_id, C.code AS 'class_code', C.name AS 'class_name', F.name AS 'faculty' ");
		sql.append("FROM user U, student S, class C, faculty F ");
		sql.append("WHERE U.id = S.user_id AND S.class_id = C.id AND C.faculty_id = F.id AND S.class_id = ? AND U.status = ?");
		return query(sql.toString(), new StudentMapper(), id, status);
	}

	@Override
	public StudentDTO findOneByUserId(Long id) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT U.*, S.id AS 'student_id', S.class_id, C.school_year, C.faculty_id, C.code AS 'class_code', C.name AS 'class_name', F.name AS 'faculty' ");
		sql.append("FROM user U, student S, class C, faculty F ");
		sql.append("WHERE U.id = S.user_id AND S.class_id = C.id AND C.faculty_id = F.id AND S.user_id = ?");
		List<StudentDTO> students = query(sql.toString(), new StudentMapper(), id);
		return students.isEmpty() ? null : students.get(0);
	}

}
