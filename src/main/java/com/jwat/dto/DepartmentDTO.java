package com.jwat.dto;

public class DepartmentDTO {
	private Long id;
	private String name;
	private String code;
	private Long facultyId;
	private String facultyName;
	private Long lecturerId;
	private String lecturerName;

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

	public void setId(Long id) {
		this.id = id;
	}

	public Long getFacultyId() {
		return facultyId;
	}

	public void setFacultyId(Long facultyId) {
		this.facultyId = facultyId;
	}

	public String getFacultyName() {
		return facultyName;
	}

	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}

	public Long getLecturerId() {
		return lecturerId;
	}

	public void setLecturerId(Long lecturerId) {
		this.lecturerId = lecturerId;
	}

	public String getLecturerName() {
		return lecturerName;
	}

	public void setLecturerName(String lecturerName) {
		this.lecturerName = lecturerName;
	}

	@Override
	public String toString() {
		return "DepartmentDTO [id=" + id + ", name=" + name + ", code=" + code + ", facultyId=" + facultyId
				+ ", facultyName=" + facultyName + ", lecturerId=" + lecturerId + ", lecturerName=" + lecturerName
				+ "]";
	}
	
}
