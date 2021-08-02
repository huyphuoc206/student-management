package com.jwat.dto;

public class LecturerDTO {
	private Long id;
	private UserDTO user;
	private DegreeDTO degree;
	private DepartmentDTO department;
	private Long degreeId;
	private Long departmentId;

	public UserDTO getUser() {
		return user;
	}

	public void setUser(UserDTO user) {
		this.user = user;
	}

	public DegreeDTO getDegree() {
		return degree;
	}

	public void setDegree(DegreeDTO degree) {
		this.degree = degree;
	}

	public DepartmentDTO getDepartment() {
		return department;
	}

	public void setDepartment(DepartmentDTO department) {
		this.department = department;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public Long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Long departmentId) {
		this.departmentId = departmentId;
	}

	public Long getDegreeId() {
		return degreeId;
	}

	public void setDegreeId(Long degreeId) {
		this.degreeId = degreeId;
	}
	
	
}
