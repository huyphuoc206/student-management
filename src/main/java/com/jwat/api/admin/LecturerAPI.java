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
import com.jwat.dto.LecturerDTO;
import com.jwat.service.ILecturerService;

@WebServlet(urlPatterns = { "/api-admin-lecturer" })
public class LecturerAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private ILecturerService lecturerService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		String facultyIdParam = request.getParameter("facultyId");
		String departmentIdParam = request.getParameter("departmentId");
		List<LecturerDTO> lecturers = null;
		if (facultyIdParam != null) {
			Long facultyId = Long.parseLong(facultyIdParam);
			if (facultyId == -1)
				lecturers = lecturerService.findAll();
			else
				lecturers = lecturerService.findByFacultyId(facultyId);
		}

		if (departmentIdParam != null) {
			Long departmentId = Long.parseLong(departmentIdParam);
			lecturers = lecturerService.findByDepartmentId(departmentId);
		}
		mapper.writeValue(response.getOutputStream(), lecturers);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		LecturerDTO lecturerDTO = mapper.readValue(request.getInputStream(), LecturerDTO.class);
		lecturerDTO = lecturerService.insert(lecturerDTO);
		mapper.writeValue(response.getOutputStream(), lecturerDTO);
	}
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		LecturerDTO lecturerDTO = mapper.readValue(request.getInputStream(), LecturerDTO.class);
		lecturerDTO = lecturerService.update(lecturerDTO);
		mapper.writeValue(response.getOutputStream(), lecturerDTO);
	}
}
