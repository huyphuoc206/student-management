package com.jwat.dto;

public class FacultyDTO {
	private Long id;
	private String name;
	private String code;
	private LecturerDTO lecturer;

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

	public LecturerDTO getLecturer() {
		return lecturer;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setLecturer(LecturerDTO lecturer) {
		this.lecturer = lecturer;
	}
}
