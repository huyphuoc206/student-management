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
import com.jwat.dto.ClassDTO;
import com.jwat.service.IClassService;

@WebServlet(urlPatterns = { "/api-admin-class" })
public class ClassAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private IClassService classService;

	// get class by faculty id
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		String facultyIdParam = request.getParameter("facultyId");
		List<ClassDTO> classDTOs = null;
		if (facultyIdParam != null) {
			Long facultyId = Long.parseLong(facultyIdParam);
			if (facultyId == -1)
				classDTOs = classService.findAll();
			else
				classDTOs = classService.findByFacultyId(facultyId);
		}
		mapper.writeValue(response.getOutputStream(), classDTOs);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		ClassDTO classDTO = mapper.readValue(request.getInputStream(), ClassDTO.class);
		classDTO = classService.insert(classDTO);
		mapper.writeValue(response.getOutputStream(), classDTO);
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		ClassDTO classDTO = mapper.readValue(request.getInputStream(), ClassDTO.class);
		classDTO = classService.update(classDTO);
		mapper.writeValue(response.getOutputStream(), classDTO);
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		ClassDTO classDTO = mapper.readValue(request.getInputStream(), ClassDTO.class);
		boolean result = classService.delete(classDTO.getId());
		mapper.writeValue(response.getOutputStream(), result);
	}
}
