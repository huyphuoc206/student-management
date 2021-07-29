package com.jwat.dto;

public class ScoreDTO {
	private StudentDTO student;
	private LecturerSubjectDTO lecturer_subject;
	private float processScore;
	private float midTermScore;
	private float endTermScore;
	private float finalScore;

	public StudentDTO getStudent() {
		return student;
	}

	public void setStudent(StudentDTO student) {
		this.student = student;
	}

	public LecturerSubjectDTO getLecturer_subject() {
		return lecturer_subject;
	}

	public void setLecturer_subject(LecturerSubjectDTO lecturer_subject) {
		this.lecturer_subject = lecturer_subject;
	}

	public float getProcessScore() {
		return processScore;
	}

	public void setProcessScore(float processScore) {
		this.processScore = processScore;
	}

	public float getMidTermScore() {
		return midTermScore;
	}

	public void setMidTermScore(float midTermScore) {
		this.midTermScore = midTermScore;
	}

	public float getEndTermScore() {
		return endTermScore;
	}

	public void setEndTermScore(float endTermScore) {
		this.endTermScore = endTermScore;
	}

	public float getFinalScore() {
		return finalScore;
	}

	public void setFinalScore(float finalScore) {
		this.finalScore = finalScore;
	}

}
