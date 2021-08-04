package com.jwat.api.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jwat.dto.FacultyDTO;
import com.jwat.service.IFacultyService;

@WebServlet(urlPatterns = { "/api-admin-faculty" })
public class FacultyAPI extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private IFacultyService facultyService;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		FacultyDTO facultyDTO = mapper.readValue(request.getInputStream(), FacultyDTO.class);
		facultyDTO = facultyService.insert(facultyDTO);
		mapper.writeValue(response.getOutputStream(), facultyDTO);
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		FacultyDTO facultyDTO = mapper.readValue(request.getInputStream(), FacultyDTO.class);
		facultyDTO = facultyService.update(facultyDTO);
		mapper.writeValue(response.getOutputStream(), facultyDTO);
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF8");
		response.setContentType("application/json");
		FacultyDTO facultyDTO = mapper.readValue(request.getInputStream(), FacultyDTO.class);
		boolean result = facultyService.delete(facultyDTO.getId());
		mapper.writeValue(response.getOutputStream(), result);
	}
}
