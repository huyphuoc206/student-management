package com.jwat.dto;

public class ClassAssignDTO {
	private Long subjectAssignId;
	private Long[] classIds;
	private Long classId;

	public Long getSubjectAssignId() {
		return subjectAssignId;
	}

	public void setSubjectAssignId(Long subjectAssignId) {
		this.subjectAssignId = subjectAssignId;
	}

	public Long[] getClassIds() {
		return classIds;
	}

	public void setClassIds(Long[] classIds) {
		this.classIds = classIds;
	}

	public Long getClassId() {
		return classId;
	}

	public void setClassId(Long classId) {
		this.classId = classId;
	}
}
