package com.jwat.api.lecturer;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jwat.dto.SubjectAssignDTO;
import com.jwat.service.ISubjectService;

@WebServlet(urlPatterns = { "/api-lecturer-subject-assign" })
public class SubjectAssignAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private ISubjectService subjectService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		String semesterIdParam = request.getParameter("semesterId");
		String lecturerIdParam = request.getParameter("lecturerId");
		List<SubjectAssignDTO> subjectAssigns = null;
		if(semesterIdParam != null && lecturerIdParam != null) {
			Long semesterId = Long.parseLong(semesterIdParam);
			Long lecturerId = Long.parseLong(lecturerIdParam);
			subjectAssigns = subjectService.findSubjectAssignBySemesterAndLecturer(semesterId, lecturerId);
		}
		mapper.writeValue(response.getOutputStream(), subjectAssigns);
	}

}
