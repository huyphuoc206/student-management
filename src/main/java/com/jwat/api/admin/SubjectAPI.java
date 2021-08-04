package com.jwat.api.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jwat.dto.SubjectDTO;
import com.jwat.service.ISubjectService;

@WebServlet(urlPatterns = { "/api-admin-subject" })
public class SubjectAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private ISubjectService subjectService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		String facultyIdParam = request.getParameter("facultyId");
		String departmentIdParam = request.getParameter("departmentId");
		List<SubjectDTO> subjects = null;
		if (facultyIdParam != null) {
			Long facultyId = Long.parseLong(facultyIdParam);
			if (facultyId == -1)
				subjects = subjectService.findAll();
			else
				subjects = subjectService.findByFacultyId(facultyId);
		}

		if (departmentIdParam != null) {
			Long departmentId = Long.parseLong(departmentIdParam);
			subjects = subjectService.findByDepartmentId(departmentId);
		}
		mapper.writeValue(response.getOutputStream(), subjects);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		SubjectDTO subjectDTO = mapper.readValue(request.getInputStream(), SubjectDTO.class);
		subjectDTO = subjectService.insert(subjectDTO);
		mapper.writeValue(response.getOutputStream(), subjectDTO);
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		SubjectDTO subjectDTO = mapper.readValue(request.getInputStream(), SubjectDTO.class);
		subjectDTO = subjectService.update(subjectDTO);
		mapper.writeValue(response.getOutputStream(), subjectDTO);
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		SubjectDTO subjectDTO = mapper.readValue(request.getInputStream(), SubjectDTO.class);
		boolean result = subjectService.delete(subjectDTO.getId());
		mapper.writeValue(response.getOutputStream(), result);
	}
}
