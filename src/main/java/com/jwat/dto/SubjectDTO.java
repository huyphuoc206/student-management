package com.jwat.dto;

public class SubjectDTO {
	private Long id;
	private String name;
	private String code;
	private DepartmentDTO department;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Long getId() {
		return id;
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
}
