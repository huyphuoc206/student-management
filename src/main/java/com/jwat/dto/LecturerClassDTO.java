package com.jwat.dto;

public class LecturerClassDTO {
	private LecturerSubjectDTO lecturer_subject;
	private ClassDTO classDTO;

	public LecturerSubjectDTO getLecturer_subject() {
		return lecturer_subject;
	}

	public void setLecturer_subject(LecturerSubjectDTO lecturer_subject) {
		this.lecturer_subject = lecturer_subject;
	}

	public ClassDTO getClassDTO() {
		return classDTO;
	}

	public void setClassDTO(ClassDTO classDTO) {
		this.classDTO = classDTO;
	}

}
