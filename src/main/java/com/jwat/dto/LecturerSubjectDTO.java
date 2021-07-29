package com.jwat.dto;

public class LecturerSubjectDTO {
	private Long id;
	private LecturerDTO lecturer;
	private SubjectDTO subject;
	private SemesterDTO semester;

	public LecturerDTO getLecturer() {
		return lecturer;
	}

	public void setLecturer(LecturerDTO lecturer) {
		this.lecturer = lecturer;
	}

	public SubjectDTO getSubject() {
		return subject;
	}

	public void setSubject(SubjectDTO subject) {
		this.subject = subject;
	}

	public SemesterDTO getSemester() {
		return semester;
	}

	public void setSemester(SemesterDTO semester) {
		this.semester = semester;
	}

	public Long getId() {
		return id;
	}
}
