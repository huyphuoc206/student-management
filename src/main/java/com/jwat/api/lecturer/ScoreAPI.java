package com.jwat.api.lecturer;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jwat.dto.StudentScoreDTO;
import com.jwat.service.IStudentScoreService;

@WebServlet(urlPatterns = { "/api-lecturer-score" })
public class ScoreAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Inject
	private IStudentScoreService studentScoreService;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		StudentScoreDTO studentScoreDTO = mapper.readValue(request.getInputStream(), StudentScoreDTO.class);
		boolean result = studentScoreService.saveScores(studentScoreDTO.getStudentScores());
		mapper.writeValue(response.getOutputStream(), result);
	}

}
