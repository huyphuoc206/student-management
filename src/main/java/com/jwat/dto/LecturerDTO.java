package com.jwat.dto;

public class LecturerDTO {
	private Long id;
	private UserDTO user;
	private DegreeDTO degree;
	private DepartmentDTO department;

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

	public Long getId() {
		return id;
	}
}
