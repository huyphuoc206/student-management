package com.jwat.dto;

public class ClassDTO {
	private Long id;
	private String name;
	private String code;
	private String schoolYear;
	private FacultyDTO faculty;

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

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public String getSchoolYear() {
		return schoolYear;
	}

	public void setSchoolYear(String schoolYear) {
		this.schoolYear = schoolYear;
	}

	public FacultyDTO getFaculty() {
		return faculty;
	}

	public void setFaculty(FacultyDTO faculty) {
		this.faculty = faculty;
	}

}
