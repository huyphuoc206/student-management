package com.jwat.api.student;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jwat.dto.ScoreDashboardDTO;
import com.jwat.service.IStudentScoreService;

@WebServlet(urlPatterns = { "/api-student-score" })
public class ScoreDashboardAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Inject
	private IStudentScoreService studentScoreService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		String semesterIdParam = request.getParameter("semesterId");
		String studentIdParam = request.getParameter("studentId");
		ScoreDashboardDTO scoreDashboard = null;
		if (semesterIdParam != null && studentIdParam != null) {
			Long semesterId = Long.parseLong(semesterIdParam);
			Long studentId = Long.parseLong(studentIdParam);
			scoreDashboard = studentScoreService.getScoreDashboard(semesterId, studentId);
		}
		mapper.writeValue(response.getOutputStream(), scoreDashboard);
	}

}
