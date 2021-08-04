package com.jwat.dto;

import java.util.List;

public class StudentScoreDTO {
	private Long studentId;
	private String username;
	private String fullname; 
	private Long subjectAssignId;
	private Float processScore;
	private Float midTermScore;
	private Float endTermScore;
	private Float finalScore;
	private List<StudentScoreDTO> studentScores;
	
	public Float getProcessScore() {
		return processScore;
	}

	public void setProcessScore(Float processScore) {
		this.processScore = processScore;
	}

	public Float getMidTermScore() {
		return midTermScore;
	}

	public void setMidTermScore(Float midTermScore) {
		this.midTermScore = midTermScore;
	}

	public Float getEndTermScore() {
		return endTermScore;
	}

	public void setEndTermScore(Float endTermScore) {
		this.endTermScore = endTermScore;
	}

	public Float getFinalScore() {
		return finalScore;
	}

	public void setFinalScore(Float finalScore) {
		this.finalScore = finalScore;
	}

	public Long getStudentId() {
		return studentId;
	}

	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public Long getSubjectAssignId() {
		return subjectAssignId;
	}

	public void setSubjectAssignId(Long subjectAssignId) {
		this.subjectAssignId = subjectAssignId;
	}

	public List<StudentScoreDTO> getStudentScores() {
		return studentScores;
	}

	public void setStudentScores(List<StudentScoreDTO> studentScores) {
		this.studentScores = studentScores;
	}

	@Override
	public String toString() {
		return "StudentScoreDTO [studentId=" + studentId + ", username=" + username + ", fullname=" + fullname
				+ ", subjectAssignId=" + subjectAssignId + ", processScore=" + processScore + ", midTermScore="
				+ midTermScore + ", endTermScore=" + endTermScore + ", finalScore=" + finalScore + "]";
	}
	
}
