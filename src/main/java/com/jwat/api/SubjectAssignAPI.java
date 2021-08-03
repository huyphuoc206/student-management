package com.jwat.api;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jwat.dto.LecturerDTO;
import com.jwat.dto.SubjectAssignDTO;
import com.jwat.service.ILecturerService;
import com.jwat.service.ISubjectService;

@WebServlet(urlPatterns = { "/api-admin-subject-assign" })
public class SubjectAssignAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private ISubjectService subjectService;
	@Inject
	private ILecturerService lecturerService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		String semesterIdParam = request.getParameter("semesterId");
		String subjectIdParam = request.getParameter("subjectId");
		List<LecturerDTO> lecturers = null;
		if(semesterIdParam != null && subjectIdParam != null) {
			Long semesterId = Long.parseLong(semesterIdParam);
			Long subjectId = Long.parseLong(subjectIdParam);
			lecturers = lecturerService.findBySemesterAndSubject(semesterId, subjectId);
		}
		mapper.writeValue(response.getOutputStream(), lecturers);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		SubjectAssignDTO subjectAssignDTO = mapper.readValue(request.getInputStream(), SubjectAssignDTO.class);
		subjectAssignDTO = subjectService.assignSubject(subjectAssignDTO);
		mapper.writeValue(response.getOutputStream(), subjectAssignDTO);
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		SubjectAssignDTO subjectAssignDTO = mapper.readValue(request.getInputStream(), SubjectAssignDTO.class);
		boolean result = subjectService.deleteSubjectAssign(subjectAssignDTO.getId());
		mapper.writeValue(response.getOutputStream(), result);
	}
}
