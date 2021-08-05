package com.jwat.dto;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ScoreDashboardDTO {
	private Map<Long, List<StudentScoreDTO>> scoreDashboard;
	private Map<Long, AverageScoreDTO> averageScores;

	public ScoreDashboardDTO() {
		this.scoreDashboard = new HashMap<>();
		this.averageScores = new HashMap<>();
	}

	public void putData(long semesterId, List<StudentScoreDTO> studentScoreDTOs) {
		this.scoreDashboard.put(semesterId, studentScoreDTOs);
		this.averageScores.put(semesterId, new AverageScoreDTO());
	}

	public void updateAverageScore() {
		scoreDashboard.forEach((key, value) -> {
			boolean isFullFinalScore = isFullFinalScore(value);
			if (isFullFinalScore) {
				float[] averageScore = getAverageScore(value);
				this.averageScores.get(key).setAverageScoreFour(averageScore[0]);
				this.averageScores.get(key).setAverageScoreTen(averageScore[1]);
			} else {
				this.averageScores.get(key).setAverageScoreFour(null);
				this.averageScores.get(key).setAverageScoreTen(null);
			}
		});
	}

	private boolean isFullFinalScore(List<StudentScoreDTO> studentScores) {
		for (StudentScoreDTO studentScoreDTO : studentScores) {
			if (studentScoreDTO.getFinalScore() == null)
				return false;
		}
		return true;
	}

	private float[] getAverageScore(List<StudentScoreDTO> studentScores) {
		float total = 0;
		float averageScoreFour = -1;
		float averageScoreTen = -1;
		for (StudentScoreDTO studentScoreDTO : studentScores) {
			total += studentScoreDTO.getFinalScore();
		}
		DecimalFormat df = new DecimalFormat("0.00");
		averageScoreTen = Float.parseFloat(df.format(total / studentScores.size()));
		averageScoreFour = Float.parseFloat(df.format(4 * (total / studentScores.size()) / 10));
		float[] result = new float[2];
		result[0] = averageScoreFour;
		result[1] = averageScoreTen;
		return result;
	}

	public Map<Long, List<StudentScoreDTO>> getScoreDashboard() {
		return scoreDashboard;
	}

	public void setScoreDashboard(Map<Long, List<StudentScoreDTO>> scoreDashboard) {
		this.scoreDashboard = scoreDashboard;
	}

	public Map<Long, AverageScoreDTO> getAverageScores() {
		return averageScores;
	}

	public void setAverageScores(Map<Long, AverageScoreDTO> averageScores) {
		this.averageScores = averageScores;
	}

}
