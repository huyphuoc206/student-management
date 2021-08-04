package com.jwat.dto;

public class SubjectAssignDTO {
	private Long id;
	private Long lecturerId;
	private Long subjectId;
	private Long semesterId;
	private SubjectDTO subject;
	private SemesterDTO semester;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public Long getLecturerId() {
		return lecturerId;
	}

	public void setLecturerId(Long lecturerId) {
		this.lecturerId = lecturerId;
	}

	public Long getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Long subjectId) {
		this.subjectId = subjectId;
	}

	public Long getSemesterId() {
		return semesterId;
	}

	public void setSemesterId(Long semesterId) {
		this.semesterId = semesterId;
	}

	public SubjectDTO getSubject() {
		return subject;
	}

	public void setSubject(SubjectDTO subjectDTO) {
		this.subject = subjectDTO;
	}

	public SemesterDTO getSemester() {
		return semester;
	}

	public void setSemester(SemesterDTO semester) {
		this.semester = semester;
	}

}
